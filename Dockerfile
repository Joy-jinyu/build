FROM node:latest
COPY ./ /build
WORKDIR /build
RUN npm install && npm run build

FROM nginx
RUN mkdir /build
COPY --from=0 /build/dist /build
COPY nginx.conf /etc/nginx/nginx.conf