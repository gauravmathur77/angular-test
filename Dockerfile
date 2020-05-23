# base image
FROM node:10.19.0-alpine as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .

FROM nginx:1.17.1-alpine
COPY --from=node /app/dist/project /usr/share/ngnix/html/ 