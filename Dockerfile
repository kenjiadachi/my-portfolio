FROM node:8

# Download and install hugo
ENV HUGO_VERSION 0.60.1
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

#ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir /usr/share/blog

WORKDIR /usr/share/blog

RUN  npm -g config set user root && \
     npm install -g firebase-tools

# Expose default hugo port
EXPOSE 1313

# Automatically build site
ONBUILD ADD site/ /usr/share/blog
ONBUILD RUN hugo -d /usr/share/nginx/html/

# By default, serve site
ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server -D -b ${HUGO_BASE_URL} --bind=0.0.0.0
