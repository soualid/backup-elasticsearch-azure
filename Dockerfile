FROM microsoft/azure-cli:2.0.37

ADD backup.sh /backup.sh

RUN apk add --update nodejs && \
    npm install elasticdump -g && \
    chmod a+x /backup.sh

CMD ["/backup.sh"]