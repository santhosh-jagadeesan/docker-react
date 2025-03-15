FROM node:22-alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.26.3
COPY --from=builder /app/build /usr/share/nginx/html
# We are not specifying the start-up command because nginx image already has one to start the server.