# base image
FROM node:latest as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .
RUN npm install
RUN npm install -g @angular/cli
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/project /usr/share/ngnix/html
