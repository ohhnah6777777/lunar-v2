FROM node:20
ENV NODE_ENV=production
ENV PORT=8080
WORKDIR /app
COPY ["package.json", "pnpm-lock.yaml*", "./"]
COPY . .
RUN npm i -g pnpm 
RUN pnpm config set only-built-dependencies sharp esbuild bufferutil javascript-obfuscator
RUN pnpm install --frozen-lockfile
RUN pnpm build
EXPOSE 8080
CMD ["pnpm", "start"]
