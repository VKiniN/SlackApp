WORKDIR /app
# # Copy all files from current directory to working dir in image
COPY . .



# nginx state for serving content
FROM dockerregistry-v2.vih.infineon.com/nginx-120



COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY --from=builder /app/build .
EXPOSE 8080:8080
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"] 
