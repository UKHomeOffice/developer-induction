FROM quay.io/ukhomeofficedigital/nodejs-base:v6.9.1

RUN yum install -y git which make gcc-c++ bzip2 fontconfig && \
  yum clean all && \
  useradd app

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN chown app /app && \
  ln -s /app/slides.pdf /app/media/slides.pdf

USER app

CMD npm start