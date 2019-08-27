FROM fluent/fluentd:v1.7-debian

RUN apt-get update && apt-get install -y git ruby-dev procps iputils-ping curl dnsutils iproute2 vim net-tools libc-dev gcc g++ libffi-dev make automake

RUN fluent-gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 2.3.0 && \
    fluent-gem install --no-document fluent-plugin-elasticsearch -v 3.5.5 && \
    fluent-gem install --no-document fluent-plugin-kafka -v 0.11.1 &&  cd /opt

RUN mkdir -p /data/config/fluentd/position
ADD fluent.conf /fluentd/etc/
RUN rm -rf /var/lib/apt/lists/* /home/fluent/.gem/ruby/*/cache/*.gem /var/lib/gems/*/cache/*.gem

