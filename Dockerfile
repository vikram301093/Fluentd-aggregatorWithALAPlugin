FROM fluent/fluentd:v1.7-debian-1

# Use root account to use apt
USER root

# Installing the secure_forward plugin through which we can transfer logs securely
# Installing gelf pluging for graylog 
# Installing Azure Log Analytics plugin
# Installing Docker plugin
RUN buildDeps="sudo make gcc g++ libc-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo gem install fluent-plugin-secure-forward \
 && sudo gem install fluent-plugin-azure-loganalytics \
 && sudo gem install fluent-plugin-docker \
 && sudo gem install fluent-plugin-gelf-hs
 
RUN usermod -a -G root fluent

USER fluent
