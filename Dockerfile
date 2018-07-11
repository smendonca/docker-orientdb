FROM debian:stretch

RUN apt-get update \
  && apt-get install -y openjdk-8-jre openjdk-8-jre-headless wget \
  && rm -rf /var/lib/apt/lists/*

ENV ORIENTDB_VERSION community-importers-2.2.34
ENV ORIENTDB_ROOT_PASSWORD root
ENV ORIENTDB_NODE_NAME odbnode0

RUN wget -qO /opt/orientdb.tar.gz "http://orientdb.com/download.php?email=unknown@unknown.com&file=orientdb-$ORIENTDB_VERSION.tar.gz&os=multi" \
  && tar xvzf /opt/orientdb.tar.gz -C /opt/ \
  && ln -s /opt/orientdb-$ORIENTDB_VERSION/ /opt/orientdb

EXPOSE 2424 2480

CMD ["/opt/orientdb/bin/dserver.sh"]
