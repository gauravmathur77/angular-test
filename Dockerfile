## STAGE 1 ##
FROM node:10.19.0-alpine as builder

WORKDIR /project

COPY . .

RUN npm install

RUN npm build --prod

## STAGE 2 ##
FROM nginx

COPY --from=builder /project/dist/project /usr/share/nginx/html/

EXPOSE 80
