
FROM debian:11

# Update package repositories and install necessary packages
RUN apt-get update && \
    apt-get install -y nginx vim curl openssl && \
    rm -rf /var/lib/apt/lists/*

# Generate SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# Create necessary directories and copy configuration files
RUN mkdir -p /var/run/nginx
COPY conf/default /etc/nginx/sites-available/default
COPY conf/index.html /usr/share/nginx/html/index.html

# Expose port 443
EXPOSE 443

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
