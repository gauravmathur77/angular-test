## STAGE 1 ##
FROM node:10.19.0-alpine as node

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .
RUN npm install
RUN npm run build --prod
## STAGE 2 ##
FROM nginx:alpine
COPY --from=node /app/dist/project /usr/share/ngnix/html
EXPOSE 80
