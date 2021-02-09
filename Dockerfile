# Generated by: tyk-ci/wf-gen
# Generated on: Tue  9 Feb 10:54:26 UTC 2021

# Generation commands:
# ./pr.zsh -title Use go 1.12 everywhere -branch goreleaser/more -p
# m4 -E -DxREPO=tyk


ARG BASE_IMAGE=debian:buster-slim
ARG PORTS
ARG TARBALL

FROM $BASE_IMAGE

RUN apt-get update \
 && apt-get dist-upgrade -y ca-certificates \
 && apt-get autoremove -y

WORKDIR /opt/tyk-gateway
COPY $TARBALL .

EXPOSE $PORTS

ENTRYPOINT ["/opt/tyk-gateway/tyk" ]
CMD [ "--conf=/opt/tyk-gateway/tyk.conf" ]
