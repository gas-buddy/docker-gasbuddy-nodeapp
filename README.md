# docker-gasbuddy-nodeapp
A docker image for running a node application with GasBuddy opinions. Some of those opinions include:

* Alpine
* Least user privilege
* Run npm install at build time not runtime
* Use an NPM_TOKEN environment variable for namespaced (private) packages
* Signals should be forwarded properly so shut down works
* Binary toolchain should be available for native modules
* Use ```npm run build``` to transpile or otherwise assemble your application
* Use ```npm start``` to start your app

## Docker Image

The Dockerfile supports building images for Node.js versions 12, 14, 16, and 18 using build arguments:

```bash
# Build with specific Node.js version
docker build --build-arg NODE_VERSION=16 --build-arg NODE_TAG=alpine -t ghcr.io/gas-buddy/node-app:16-alpine .

# Default build (Node.js 18-alpine)
docker build -t ghcr.io/gas-buddy/node-app:18-alpine .
```

## GitHub Container Registry

This image is published to the GitHub Container Registry (GHCR). Images are built for Node.js versions 12, 14, 16, and 18 using GitHub Actions.

## Legacy Information

**Note:** The Makefile is maintained for legacy purposes but is no longer the primary build method. GitHub Actions is now used for building and publishing images.

There are two active branches:

* **prod** - does everything stated above after copying the source code of
* **dev** - Uses a volume for /data and /data/node_modules, which allows you to share your code with the host and not have to rebuild every time you make a change. Doesn't run ```npm install``` at build time
