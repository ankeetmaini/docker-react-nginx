# dockerized react-nginx app

> initial boilerplate taken from CRA.

# running - dev

```
docker-compose up --build
```

> this will blow up the first time as there are no `node_modules`

- ssh into the container for node
```bash
docker-compose run app /bin/bash
yarn

# exit after yarn installs all the deps and run
# `docker-compose up`
```

# containers (check [docker-compose.yml](./docker-compose.yml))
- node container serving react
- nginx container proxing requests to node

# building docker images by hand
- app

```bash
docker build . -t docker-react 
# run it
docker run --publish 8000:3000 -it docker-react:latest
```

- nginx

```bash
cd nginx
docker build . -t docker-nginx
# run it
docker run --publish 8000:80 -it docker-nginx:latest
```