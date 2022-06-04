FROM node:slim AS node_modules
WORKDIR /mnt/app
COPY package*.json .
RUN npm i


FROM node:slim AS build
WORKDIR /mnt/app
COPY . .
COPY --from=node_modules /mnt/app/ .
CMD npm run dev