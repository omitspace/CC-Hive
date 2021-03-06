--Author: blunty666
--forum post: http://www.computercraft.info/forums2/index.php?/topic/19491-starnav-advanced-turtle-pathfinding-and-environment-mapping/

local maps = {}

local function toGridCode(tVector)
	return math.floor(tVector.x/16), math.floor(tVector.y/16), math.floor(tVector.z/16), tVector.x % 16, tVector.y % 16, tVector.z % 16
end

local function setGrid(tMap, x, y, z, grid)
	if not tMap.map[x] then
		tMap.map[x] = {}
	end
	if not tMap.map[x][y] then
		tMap.map[x][y] = {}
	end
	tMap.map[x][y][z] = grid
	return tMap.map[x][y][z]
end

local function getGrid(tMap, x, y, z)
	if not tMap.map[x] or not tMap.map[x][y] or not tMap.map[x][y][z] then
		return tMap:load(x, y, z)
	else
		return tMap.map[x][y][z]
	end
end

local methods = {

	load = function(self, tVector, y, z)
		local gX, gY, gZ
		if y and z then
			gX, gY, gZ = tVector, y, z
		else
			gX, gY, gZ = toGridCode(tVector)
		end
		if self.name then
			if fs.exists(".maps/"..self.name.."/"..gX..","..gY..","..gZ) then
				local handle = fs.open(".maps/"..self.name.."/"..gX..","..gY..","..gZ, "r")
				if handle then
					local grid = textutils.unserialize(handle.readAll())
					handle.close()
					if type(grid) == "table" then
						return setGrid(self, gX, gY, gZ, grid)
					end
				end
			end
		end
		return setGrid(self, gX, gY, gZ, {})
	end,

	loadAll = function(self)
		if self.name and fs.exists(".maps/"..self.name) and fs.isDir(".maps/"..self.name) then
			for _, gridFile in ipairs(fs.list(".maps/"..self.name)) do
				local _, _, gX, gY, gZ = string.find(gridFile, "(.+)%,(.+)%,(.+)")
				if gX and gY and gX then
					self:load(tonumber(gX), tonumber(gY), tonumber(gZ))
				end
			end
		end
	end,

	save = function(self)
		if self.name then
			local saveDir = ".maps/"..self.name
			for x, YZmap in pairs(self.map) do
				for y, Zmap in pairs(YZmap) do
					for z, grid in pairs(Zmap) do
						if next(grid) then
							local handle = fs.open(fs.combine(saveDir, x..","..y..","..z), "w")
							handle.write(textutils.serialize(grid))
							handle.close()
						end
					end
				end
			end
		end
	end,

	get = function(self, tVector)
		local gX, gY, gZ, pX, pY, pZ = toGridCode(tVector)
		local grid = getGrid(self, gX, gY, gZ)
		if grid[pX] and grid[pX][pY] then
			return grid[pX][pY][pZ]
		end
	end,

	set = function(self, tVector, value)
		local gX, gY, gZ, pX, pY, pZ = toGridCode(tVector)
		local grid = getGrid(self, gX, gY, gZ)
		if not grid[pX] then
			grid[pX] = {}
		end
		if not grid[pX][pY] then
			grid[pX][pY] = {}
		end
		grid[pX][pY][pZ] = value
		return grid[pX][pY][pZ]
	end,

	getOrSet = function(self, tVector, value)
		local gX, gY, gZ, pX, pY, pZ = toGridCode(tVector)
		local grid = getGrid(self, gX, gY, gZ)
		if grid[pX] and grid[pX][pY] and grid[pX][pY][pZ] then
			return grid[pX][pY][pZ], false
		else
			if not grid[pX] then
				grid[pX] = {}
			end
			if not grid[pX][pY] then
				grid[pX][pY] = {}
			end
			grid[pX][pY][pZ] = value
			return grid[pX][pY][pZ], true
		end
	end,

}

function new(name)
	local tMap = {}
	if name and type(name) == "string" then
		if maps[name] then
			return maps[name]
		end
		tMap.name = name
		if not fs.exists(".maps/"..name) then
			fs.makeDir(".maps/"..name)
		end
		maps[name] = tMap
	end
	tMap.map = {}
	setmetatable(tMap, {__index = methods})
	return tMap
end