local repo = "https://raw.githubusercontent.com/lupus590/CC-Hive/master/src/"

local directories = { --list of folders to create
  "Assets",
  "Client",
  "Logs",
  "Pocket",
  "Server",
  "Shared",
  "Shared/nsh",
  "Turtle",
  "Turtle/starNav",
  "Turtle/lamaRewrite",
}

local files = { --list of files to get
  "Assets/jobstore.lua",
  "Assets/logo.lua",
  "Assets/progutils.lua",
  "Client/client.lua",
  "Server/server.lua",
  "Shared/AutoLabel.lua",
  "Shared/HiveLauncher.lua",
  "Shared/nsh/binget.lua",
  "Shared/nsh/binput.lua",
  "Shared/nsh/framebuffer.lua",
  "Shared/nsh/get.lua",
  "Shared/nsh/nsh.lua",
  "Shared/nsh/put.lua",
  "Shared/nsh/vncd.lua",
  "Turtle/AutoFuel.lua",
  "Turtle/lamaRewrite/lamaedit.lua",
  "Turtle/starNav/map.lua",
  "Turtle/starNav/pqueue.lua",
  "Turtle/starNav/starnav.lua",
  "Turtle/starNav/starnav_-_goto.lua",
}

for _, dir in ipairs( directories ) do -- make the directories
  fs.makeDir( dir )
end

for k, file in pairs( files ) do
  local response = http.get( repo .. file ) -- get the file
  if response then -- if we got it
    local file = fs.open( file, "w" ) -- save it
    file.write( response.readAll() )
    file.close()
    response.close()
  else -- otherwise, error
    error( "Failed to get file: " .. file, 0 )
  end
end