core:
	node packages/core/build/index.js start

mongo:
	mongod --dbpath `mktemp -d`

gateway:
	ufo teleport https://ufo.k0s.io http://localhost:3300

mongo-express:
	cd ~/mongo-express && env ME_CONFIG_SITE_SESSIONSECRET=12345678 ME_CONFIG_BASICAUTH=false ME_CONFIG_MONGODB_ENABLE_ADMIN=true PORT=8080 yarn start

dbui:
	ufo teleport https://ufo.k0s.io http://localhost:8080
