I want to have a client, server and turtle.

The client will be what a user would interact with this will have a nice interface with options to upload, download, edit, create, delete jobs. A database will be stored of all jobs, and they will be given a nickname, so we can access them with a fancy list to see all the installed jobs and a small description of what they do. The client will be the one that will allow you to see what a turtle is doing where it is (GPS cords) and allow you to fully interact with everything.

The server is the mainframe, the backbone of the whole thing, a servers job is to listen out to requests from clients that are given access as well as to pairing clients who wish to connect, it will also be the hub of where all the turtles information will be stored and will be running many scripts to keep an eye on everything that is happening with the turtles. It will also be working by giving out the commands to the turtles and in charge of sending the data to and from the client, and turtle.

The turtle of course will be the one that will receive job requests and do everything it is told, each turtle will have a pairing code and these are then stored in a database with nicknames we can call them. A turtle will go around the world using GPS (which will be built into the servers) which it will move around the land without us having to touch it or help it.

Now there will be many "databases" / "tables":
(all databases are stored on the server, which is why I mean it is the hub):

###### User Database:
* Will store all usernames and passwords to everyone that can access the client, this is stored on servers.

###### Jobs Database:
* This will be where all the jobs are saved /indexed and they will be saved on the server in a nice folder called jobs.

###### Turtle Database:
* This will be where the turtles will be indexed, so it will have the XYZ, nickname, hash, and id.

###### Destinations database:
* This is a database that has loads of destinations for a turtle to go, so say it has a job to fix a building that it build 2 days ago, it will save the coordinates and can be directed to go there.

###### Materials Database:
* This is where a turtle can go to replenish the majority of it's materials it needs as well as being able to get what it needs for a certain job, this will be automatic and will be stored on the database.
