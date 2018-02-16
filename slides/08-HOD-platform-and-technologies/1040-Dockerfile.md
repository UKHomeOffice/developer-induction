## Dockerfiles
- Dockerfile, is a file, with a set of instructions, starting with a FROM image, to build an image​

<iframe class="ace stretch" data-mode="dockerfile">
FROM node:6-alpine
RUN mkdir -p /usr/src/app && chown -R node /usr/src/app
WORKDIR /usr/src/app
USER node
COPY . .
RUN npm install --quiet && npm test
EXPOSE 4000
CMD npm start
</iframe>
