FROM node:16-alpine AS build

WORKDIR /usr

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
COPY tsconfig.json ./
RUN npm install 
COPY src ./src 
RUN npm run build
# If you are building your code for production
# RUN npm ci --only=production

FROM node:16-alpine
WORKDIR /usr

COPY package*.json ./
RUN npm install --only=production
COPY --from=build /usr/dist .
EXPOSE 8080
CMD ["node", "."]