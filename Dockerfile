FROM node:16 AS Vara
LABEL vara lakshmi
WORKDIR /flm
COPY package*.json ./
RUN npm install -y
COPY . .
Expose 80

FROM node:19-alpine AS final
COPY --from=Vara /flm .
RUN npm install --production
CMD ["node", "index.js"]
