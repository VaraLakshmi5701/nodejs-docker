FROM node:16
LABEL vara lakshmi
COPY package*.json ./
RUN npm install -y
COPY . .
CMD ["node", "index.js"]
