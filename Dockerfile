FROM mkoch/base:latest
MAINTAINER Michael Koch <michael.koch@enough.de>

ENV DEBIAN_FRONTEND=noninteractive

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends ca-certificates nginx wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
        mkdir -p /app/tmp && \
        mkdir -p /app/html && \
        cd /app/tmp && \
        wget --quiet https://github.com/swagger-api/swagger-ui/archive/v2.1.5.tar.gz && \
        tar xzvf v2.1.5.tar.gz && \
        mv swagger-ui-2.1.5/dist /app/html/swagger && \
        cd /app && \
        rm -rf /app/tmp && \
        rm -rf /etc/nginx/sites-enabled/default

COPY default /etc/nginx/sites-enabled/
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

EXPOSE 80

CMD ["/app/run.sh"]

