#####Job Store (Online)

This is made and ready to be used of course we will have a lot to make it do.
The idea is of course already planned out, please leave the shared file as somewhere to put ideas etc, as this can become quite annoying, so everything can stay like this please.

The server will be able to multitask, having more than one turtle on a project is somewhat impossible due to how it would be setup via the actual job code. So this is a no-no unless you plan to feed the turtles commands 24/7? (which is near enough impossible without unlimited rednet range...)
-- To get around this people who wish to make a job that requires more than one turtle can add in the functionality via the config for jobs.

#####A note on the Hive environment...
We will need a few "stations" so we will need a materials station and a refuel station, the refuel station (of course) will refuel turtles who will be able to figure out how much fuel they have and if they do not have enough they will take some so it lasts. The item storage will be set up via block meta tags which I have built in already so do not worry, the skynav... nah been testing a new one on my own server and it works like a charm. The code is automatic and works all via GPS, the gps will set you a course and you will go around whatever is in your way, it works it is cool. I have also added a few new job already:

Auto-Miner -> This is a program that will literally make a turtle scout a world and underground and make him randomly search for blocks until he is about to run out of fuel then he will come home... And he can search for materials, like diamond, iron, gold, and this works with the Hive Pocket Client which allows you to see how much he has got by using the monitor and pocket client output system that I built into the turtle code.

Auto-Craft -> A simplistic crafting program that allows turtles to grab a crafting recipe (or search it) and craft it...
[use this?](http://www.computercraft.info/forums2/index.php?/topic/23076-crafting-api-learn-recipes/)

GPS System -> This is a gps system maker which will force the first turtle to go and build the GPS systems when the Hive is installed to an advanced computers, plus the installer now has a full featured config setup file with about 4 pages of configs that need to be done before the user can enjoy it, it has built in help and is able to auto fill some of the config settings.

Online Job Store -> This is going to work from my app store and you can download a category called: hive-job which is hidden from the community but can be downloaded via a few new functions plus I am adding this to the store now so you can see all jobs that are on there.

Also I have included a setting that if HTTP enabled then when searching for jobs, it grabs the latest list of jobs online instantly and keeps it updated plus any local ones we have.


#####Turtles:
These have the core code in already to make sure it can move around the world with no problems as well as giving it a destination and even specifying a 'via' option that allows it to go via another destination.

#####Addons:
One of the things I wish to add is the addon support, which means as we get more ideas, a server can have an addon which can read/write content to the server in another coroutine, this means that we can add support form many things, I have already created an addon for SGCraft allowing turtles to send it's content through a gate. I have also added a new feature that allows you to compress a inventory down to a program, and then using command blocks and meta tags you can re-download these after.

Server has the features and core systems before I upload my code I have to make sure it works :D
