# File: Dockerfile
# Use a base image with a web server (e.g., Nginx)
FROM nginx:latest

# Copy the index.html file to the web server's root directory
COPY index.html /usr/share/nginx/html/
