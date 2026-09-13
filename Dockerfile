FROM node:20
WORKDIR /app
COPY package.json ./
COPY pnpm-lock.yaml* ./
COPY . .
RUN npm i -g pnpm
RUN pnpm install --ignore-scripts=false
RUN pnpm build
