FROM debian:bookworm-slim

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y glusterfs-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/glusterd", "-p", "/var/run/glusterd.pid", "-N"]
