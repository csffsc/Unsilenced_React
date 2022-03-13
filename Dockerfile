
# Name the node stage "builder"
FROM node:16.13.0-alpine AS builder
WORKDIR /app

ADD . /app/
# install node modules and build assets
RUN yarn global add serve --prefix /usr/local
RUN yarn && yarn build

ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080
CMD serve -s build