#Stage 1
FROM node:latest as node
WORKDIR /app
COPY ..
RUN npm install
RUN npm run build --prod

#Stage 2
FROM nginx:alpine
COPY -form=node /app/dist/angular-app /usr/share/nginx/html