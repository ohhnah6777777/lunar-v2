FROM node:20
WORKDIR /app
COPY package.json ./
COPY pnpm-lock.yaml* ./
COPY . .
RUN npm i -g pnpm
RUN echo "{\"dependencies\":true,\"devDependencies\":true}" > ~/.pnpmrc
RUN pnpm install --frozen-lockfile
RUN pnpm build
