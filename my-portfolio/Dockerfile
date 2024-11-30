FROM node:20.18.1-slim 

WORKDIR /app

RUN npm i -g pnpm

COPY package.json pnpm-lock.yaml /app/ 

RUN pnpm i

EXPOSE 3000

COPY . .

CMD [ "pnpm", "dev" ]