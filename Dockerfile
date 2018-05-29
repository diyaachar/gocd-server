FROM ubuntu:16.04
RUN apt-get update && apt-get install -y apt-transport-https && apt-get install curl -y
RUN echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
RUN curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add - 
RUN apt-get update && apt-get install -y default-jre openssl apache2-utils
RUN apt-get update && apt-get install go-server go-agent
COPY entrypoint.sh /tmp/
EXPOSE 8153 8154
ENTRYPOINT ["/tmp/entrypoint.sh", "run"]


