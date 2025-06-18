# Dockerfile
FROM node:18-alpine          # Use an official Node.js runtime image (alpine for small size)
WORKDIR /app

# Install dependencies (copy package.json first for caching)
COPY package*.json ./
RUN npm ci --only=production

# Copy application source code
COPY . .

# Specify port (optional, mainly for documentation)
ENV PORT=3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
