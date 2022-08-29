FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.0

USER root

COPY . /tmp/src
RUN cp /tmp/src/dashboard/gateway/views/dashboard.pug /opt/workshop/gateway/views/
RUN cp /tmp/src/dashboard/gateway/routes/dashboard.js /opt/workshop/gateway/routes/
RUN cp /tmp/src/dashboard/renderer/config.js /opt/workshop/renderer/

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

ENV TERMINAL_TAB=

USER 1001

RUN /usr/libexec/s2i/assemble
