FROM debian:stretch
MAINTAINER <coolsidd>
WORKDIR /app
COPY . /app
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get install apt-file -y && apt-file update && \
    apt-get install -y apt-utils
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections 
RUN apt-get upgrade -y && \
    apt-get install -y curl freedombox-setup
RUN /usr/lib/freedombox/setup
RUN chmod +x /app/run.sh
# ENTRYPOINT ["/app/run.sh"]
CMD ["bash"]
