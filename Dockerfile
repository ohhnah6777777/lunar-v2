FROM node:20-alpine AS base

# Install pnpm globally
RUN npm i -g pnpm

WORKDIR /app

# Copy dependency files first for optimized caching
COPY package.json pnpm-lock.yaml ./

# Auto-approve the restricted builds that are crashing your server
RUN pnpm config set only-built-dependencies sharp esbuild bufferutil javascript-obfuscator utf-8-validate

# Install all dependencies exactly as defined in the lockfile
RUN pnpm install --frozen-lockfile

# Copy the rest of your Lunar v2 code files
COPY . .

# Build the Astro application for production
RUN pnpm run build

# Expose the correct web port (Lunar defaults to 8080)
EXPOSE 8080

# Start the proxy server natively
CMD ["pnpm", "start"]
