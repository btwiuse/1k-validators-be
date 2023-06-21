core:
	node packages/core/build/index.js start

mongo:
	mongod --dbpath `mktemp -d`
