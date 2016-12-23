## Dockerfiles
- Dockerfile, is a file, with a set of instructions, starting with a FROM image, to build an image​

<iframe class="ace stretch">FROM node:6-alpine
RUN useradd -d /app app
RUN mkdir -p /app
RUN chown -R app:app /app
USER app
WORKDIR /app
COPY . /app
RUN ./build.sh
EXPOSE 3018
CMD [npm, start]</iframe>