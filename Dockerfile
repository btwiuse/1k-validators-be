FROM btwiuse/arch:ufo AS ufo

FROM btwiuse/arch:node-18 AS builder
ARG MATRIX_TOKEN
ARG PACKAGE=core
ENV PACKAGE ${PACKAGE}
WORKDIR /code
COPY . .

RUN echo "building ${PACKAGE}... "; \
    yarn set version 3.2.2 ; \
    yarn install ; \
    echo "yarn install done. Building...." ; \
    yarn workspaces foreach run build ; \
    echo "building ${PACKAGE} done."
# CMD yarn run start:js:${PACKAGE}

COPY --from=ufo /usr/local/bin/ufo /bin/ufo
CMD ufo term https://ufo.k0s.io?app=scorekeeper

