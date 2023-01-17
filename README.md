# docker-gasbuddy-nodeapp
A docker image for running a node application with GasBuddy opinions. Some of those opinions include:

* Alpine
* Least user privilege
* Signals should be forwarded properly so shut down works
* Binary toolchain should be available for native modules
* Use ```npm start``` to start your app

## fakesh
This script is a wrapper for running other command-line programs. It does the following:

1. If the first argument passed to the script starts with a dash ("-"), it shifts the positional parameters to the left by 1 position (removing the first argument).
2. The script sets the command line arguments to all the passed arguments.
3. It finds the full path to the command passed as the first argument by using the "which" command.
4. It shifts the positional parameters to the left by 1 position, effectively removing the command used to find the full path to the executable.
5. Finally, it runs the command found in step 3, with all of the remaining command-line arguments passed to it.

This script allows you to run commands as if they were in the PATH, even if you don't know exactly where they are located.
