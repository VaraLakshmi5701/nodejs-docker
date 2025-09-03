FROM node:16 AS Vara
MAINTAINER Vara Lakshmi
LABEL my first nodejs application deployment 
WORKDIR /flm
COPY package*.json ./
RUN npm install -y
COPY . .
EXPOSE 80

FROM node:19-alpine AS final
COPY --from=Vara /flm .
RUN npm install --production
CMD ["node", "index.js"]
