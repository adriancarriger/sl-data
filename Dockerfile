FROM node:8-alpine
WORKDIR /app

RUN yarn global add \
  prisma

COPY package.json .

RUN yarn

COPY . .

CMD [ "yarn", "start" ]
