FROM node:latest
COPY ./ /build
WORKDIR /build
RUN npm i -g pnpm nrm && nrm use taobao
RUN pnpm i && pnpm build

FROM nginx:latest
RUN mkdir /build
COPY --from=0 /build/dist /build
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
