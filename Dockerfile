FROM fluent/fluentd:v1.2.5-debian

RUN apt-get update && apt-get install -y git ruby-dev procps iputils-ping curl dnsutils iproute2 vim net-tools libc-dev gcc g++ libffi-dev make automake

RUN fluent-gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 2.1.2 && \
    fluent-gem install --no-document fluent-plugin-elasticsearch && \
    fluent-gem install --no-document fluent-plugin-kafka -v 0.7.8 &&  cd /opt

RUN mkdir -p /data/config/fluentd/position
ADD fluent.conf /fluentd/etc/
RUN rm -rf /var/lib/apt/lists/* /home/fluent/.gem/ruby/*/cache/*.gem /var/lib/gems/*/cache/*.gem

