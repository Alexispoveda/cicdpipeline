FROM node:16.14-alpine AS build-step
# Create app directory
WORKDIR /build
# Add node_modules to path
ENV PATH /app/node_modules/.bin:$PATH
RUN echo "$PWD"
# Install app dependencies
COPY "frontend/package.json" ./
COPY "frontend/package-lock.json" ./
RUN npm install
# Copy app source code
COPY ./frontend .
# Build app
RUN npm run build
# Stage 2 - the production environment
FROM nginx:1.25.2-alpine
# Install openssh
RUN apk add --update --no-cache openssh 
RUN apk add openssh
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/seguridad -s /bin/sh -D seguridad
RUN echo -n 'seguridad:jose' | chpasswd
RUN echo "[[ $- == *i* ]] || return" >> /home/seguridad/.bashrc
EXPOSE 22
COPY ./production/entrypoint.sh /
COPY ./production/nginx.conf /etc/nginx/nginx.conf
USER seguridad
COPY --chown=seguridad:seguridad --from=build-step /build/build /home/seguridad/build
USER root
ENTRYPOINT ["/entrypoint.sh"]
