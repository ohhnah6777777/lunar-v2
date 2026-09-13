FROM node:20
WORKDIR /app
COPY [package.json, pnpm-lock.yaml*, ./]
COPY . .
RUN npm i -g pnpm
RUN pnpm install --frozen-lockfile
RUN pnpm config set only-built-dependencies="sharp esbuild bufferutil javascript-obfuscator"
RUN pnpm build
