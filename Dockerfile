FROM node:12-stretch-slim as base

FROM base as dev

WORKDIR /docker-react-nginx

# add node deps to path so that you don't have
# to do ./node_modules/.bin/something
ENV PATH=./node_modules/.bin:$PATH

CMD ["yarn", "start"]

FROM base as test

# least privilege user
RUN mkdir -p /docker-react-nginx && chown -R node:node /docker-react-nginx
USER node

WORKDIR /docker-react-nginx

# node module deps as a separate layer for caching
COPY  --chown=node:node package.json yarn.*lock ./
RUN yarn install --pure-lockfile

# copy source code
COPY --chown=node:node  . .

# run any tests you want to, linting, prettier, unit etc
ENV CI true
RUN yarn test

ENV NODE_ENV production
# after successful test build your JS assets etc
RUN yarn build
RUN yarn build:server

FROM base as prod
# least privilege user
RUN mkdir -p /docker-react-nginx && chown -R node:node /docker-react-nginx
USER node

WORKDIR /docker-react-nginx

# only copy needed assets, node_modules
# etc will be left in test image, super light prod image
COPY --chown=node:node --from=test /docker-react-nginx/build .
CMD ["node", "server.js"]
