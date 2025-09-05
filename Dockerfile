FROM node:current-alpine3.22 AS base
RUN apk add --no-cache bash

FROM base AS production

ENV PORT=3000
ENV HOST=0.0.0.0

# Directories
COPY ./ /home/node/app/

WORKDIR /home/node/app/

RUN yarn install && yarn build

CMD ["/bin/sh", "-c", "node .output/server/index.mjs"]
