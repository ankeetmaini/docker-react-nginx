# dockerized react-nginx app

> initial boilerplate taken from CRA.

# running - dev

```
docker-compose up --build
```

> this will blow up the first time as there are no `node_modules`

- ssh into the container
```bash
docker-compose run app /bin/bash
yarn

# exit after yarn installs all the deps and run
# `docker-compose up`
```
