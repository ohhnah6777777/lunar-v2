FROM node:20
WORKDIR /app
COPY package.json ./
COPY pnpm-lock.yaml* ./
COPY . .
RUN npm i -g pnpm
RUN pnpm config set auto-install-peers=true
RUN pnpm install --allow-scripts
RUN pnpm build
