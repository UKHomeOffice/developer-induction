FROM quay.io/ukhomeofficedigital/nodejs-base:v6.9.1

RUN rpm --rebuilddb && \
  yum -y update && \
  yum-config-manager --enable cr && \
  yum install -y \
    yum-utils \
    epel-release && \
  yum install -y \
    git \
    fontconfig \
    nginx \
    gcc-c++ \
    bzip2 \
    which && \
  yum clean all && \
  mkdir -p /var/log/nginx &&\
  ln -s /dev/stderr /var/log/nginx/error.log && \
  ln -s /dev/stdout /var/log/nginx/access.log

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build && \
  mv build/* slides.pdf /usr/share/nginx/html/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]