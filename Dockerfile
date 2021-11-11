FROM node:14-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY public public

COPY src src

RUN npm run build

#CMD ["ping","google.com"]

FROM nginx as runner

COPY --from=builder /app/build /usr/share/nginx/html
#we are not writing a CMD instruction so it will use the start up command of base nginx image
