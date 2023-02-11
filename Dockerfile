# Start builder phase
FROM node:16-alpine AS builder
WORKDIR '/home/node/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Start host phase
FROM nginx AS host
COPY --from=builder /home/node/app/build /usr/share/nginx/html 