FROM nginx:alpine

COPY --from=builder /dist/project/* /usr/share/nginx/html/
