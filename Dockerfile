FROM debian:bookworm-slim

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y glusterfs-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["glusterfs", "--no-daemon"]
