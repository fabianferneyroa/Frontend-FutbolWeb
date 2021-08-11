  
# build environment
FROM node:12.17-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
RUN yarn install
# RUN yarn global add -g
COPY . /app
RUN yarn generate
EXPOSE 3000
CMD yarn start