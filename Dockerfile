# base image
FROM node:10.19.0-alpine as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .

FROM nginx:alpine
COPY --from=node /app/dist/project /usr/share/ngnix/html 
