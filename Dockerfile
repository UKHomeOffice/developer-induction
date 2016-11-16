FROM quay.io/ukhomeofficedigital/revealjs
RUN npm install -g prez
COPY . /tmp/code
RUN prez /tmp/code && \
    mv build/index.html build/images /app/revealjs/