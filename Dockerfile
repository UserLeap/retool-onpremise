FROM tryretool/backend:2.73.22 as base

FROM amazonlinux:2

RUN yum update ; \
  yum upgrade -y ; \
  yum install -y shadow-utils ; \
  groupadd -g 999 retool_user_group ; \ 
  useradd -u 999 -g 999 retool_user
# RUN yum install -y <node and all that fun>

COPY --from=base /retool_backend /retool_backend

WORKDIR /retool_backend

CMD ./docker_scripts/start_api.sh