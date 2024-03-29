FROM node:10.4-alpine AS builder
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build
FROM nginx:stable-alpine
LABEL version="1.0"
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /usr/share/nginx/html
COPY --from=builder /usr/src/app/dist/baseAngularStatic/ .
