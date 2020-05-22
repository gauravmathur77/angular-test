## STAGE 1 ##
FROM node:10.19.0-alpine as builder

WORKDIR /usr/src/app

COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

## STAGE 2 ##
FROM nginx

COPY --from=build /usr/src/app/dist/project /usr/share/nginx/html

EXPOSE 80
