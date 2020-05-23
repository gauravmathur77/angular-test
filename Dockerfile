# base image
FROM node:10.19.0-alpine as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .

FROM nginx:1.17.1-alpine

## Copy our default nginx config
COPY default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=node /app/dist/project /usr/share/nginx/html