# docker-gasbuddy-nodeapp
A docker image for running a node application with GasBuddy opinions. Some of those opinions include:

* Debian
* Least user privilege
* Run npm install at build time not runtime
* Use an NPM_TOKEN environment variable for namespaced (private) packages
* Signals should be forwarded properly so shut down works
* Binary toolchain should be available for native modules
* Use ```npm run build``` to transpile or otherwise assemble your application
* Use ```npm start``` to start your app

There are two active branches:

* **prod** - does everything stated above after copying the source code of
* **dev** - Uses a volume for /data and /data/node_modules, which allows you to share your code with the host and not have to rebuild every time you make a change. Doesn't run ```npm install``` at build time
