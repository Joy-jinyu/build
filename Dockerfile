FROM hub.c.163.com/library/node:latest
COPY ./ /build
WORKDIR /build
RUN npm config set registry https://registry.npm.taobao.org && npm install && npm run build

FROM hub.c.163.com/library/nginx
RUN mkdir /build
COPY --from=0 /build/dist /build
COPY nginx.conf /etc/nginx/nginx.conf