FROM node:16.14-alpine AS build-step

WORKDIR /build

ENV PATH /app/node_modules/.bin:$PATH
RUN echo "$PWD"

COPY "frontend/package.json" ./
COPY "frontend/package-lock.json" ./
RUN npm install

COPY ./frontend .
RUN npm run build

FROM nginx:1.18-alpine
COPY ./production/nginx.conf /etc/nginx/nginx.conf
COPY --from=build-step /build/build /frontend/build