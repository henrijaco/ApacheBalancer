FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump php7.0 && apt-get clean
COPY apache2.conf /apache2.conf
COPY proxy.sh /proxy.sh
CMD ["./proxy.sh"]
EXPOSE 80 443
ENTRYPOINT ["/bin/bash"]
