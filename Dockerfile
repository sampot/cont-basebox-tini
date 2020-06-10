FROM ubuntu:18.04 as builder

ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini

FROM sampot/basebox:18.04-spk1

COPY --from=builder /tini /tini

ENTRYPOINT ["/tini", "--"]

CMD ["/usr/bin/nologin"]
