FROM ubuntu:24.04

RUN apt-get update && apt-get install -y squid apache2-utils && rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]
