## Dockerfiles
- Dockerfile, is a file, with a set of instructions, starting with a FROM image, to build an image​

<iframe class="ace stretch" data-mode="dockerfile">FROM node:6-alpine
RUN mkdir -p /app
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm test
EXPOSE 4000
CMD npm start</iframe>