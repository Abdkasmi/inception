# instructions to build my nginx image

FROM debian:buster

# installing nginx and openssl
RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y


# creating a directory to store the certificate
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /etc/nginx/sites-enabled

# Copy config file on the container
COPY	tools/nginx.conf etc/nginx/sites-enabled/default

# openssl is the basic command line tool for creating or managing OpenSSl certificates, keys,...
# req is used to requesta and generate a certificate
# -x509 = self signed
# -nodes = if this option is specified then if a private key is created it will not be encrypted.
# -keyout = This line tells OpenSSL where to place the generated private key file that we are creating.
# -out = This tells OpenSSL where to place the certificate that we are creating.
# -subj = response to SSL key info 
RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/abkasmi.42.fr.key \
    -out /etc/nginx/ssl/abkasmi.42.fr.crt \
    -subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=abkasmi.42.fr/UID=abkasmi"

# Expose the only port we can use in the subject
EXPOSE 443

# start server
CMD ["nginx", "-g", "daemon off;"]
