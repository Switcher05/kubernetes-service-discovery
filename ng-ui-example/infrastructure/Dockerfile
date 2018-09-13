# Step: Install modules
# This order of steps is necessary for build caching
FROM node:8-alpine as modules
WORKDIR /build
COPY package.json .
COPY package-lock.json .
RUN npm install 2> /dev/null

# Step: Run tests
FROM markadams/chromium-xvfb-js:6 as tests
WORKDIR /build
COPY --from=modules /build/node_modules node_modules/
# This step is necessary because of the different architecture between this container, and the previous one which installed the node_modules
RUN npm rebuild node-sass --force
ARG TEAMCITY_VERSION
COPY . /build/
RUN npm run test-single 2> /dev/null

# Step: Build application static content
FROM node:8-alpine as build
WORKDIR /build
COPY --from=modules /build/node_modules node_modules/
COPY . /build/
RUN npm run build 2> /dev/null

# Step: Build webserver application container with static content for distribution
FROM nginx:1.13.3-alpine as server
EXPOSE 8080
LABEL description="Serves Example UI"

RUN mkdir -p /example/www/ && chmod -R ugo=rx /example/www/
COPY --from=build /build/dist /example/www/
