FROM quay.io/ukhomeofficedigital/nodejs-base:v8

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
  yum clean all

RUN useradd node && mkdir -p /usr/src/app && chown -R node /usr/src/app 
WORKDIR /usr/src/app
USER node

COPY package.json .
RUN npm install
COPY . .
RUN npm run build && mv slides.pdf build/
CMD npm start
