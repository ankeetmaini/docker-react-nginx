FROM node:12-stretch-slim as dev

WORKDIR /docker-react-nginx

# add node deps to path so that you don't have
# to do ./node_modules/.bin/something
ENV PATH=./node_modules/.bin:$PATH

CMD ["yarn", "start"]