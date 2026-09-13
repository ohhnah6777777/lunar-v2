FROM node:20
ENV NODE_ENV=production
ENV PORT=8080
WORKDIR /app
COPY ["package.json", "pnpm-lock.yaml*", "./"]
COPY . . 
RUN pnpm config set only-built-dependencies="sharp esbuild bufferutil javascript-obfuscator"
EXPOSE 8080
CMD ["pnpm", "start"]
