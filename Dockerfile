FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl gnupg2 software-properties-common nginx openssl \
    && add-apt-repository -y ppa:ethereum/ethereum \
    && apt-get update && apt-get install -y geth \
    && apt-get clean

COPY ssl-cert.pem /etc/ssl/certs/ssl-cert.pem
COPY ssl-key.pem /etc/ssl/private/ssl-key.pem
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 443

CMD ["/entrypoint.sh"]
