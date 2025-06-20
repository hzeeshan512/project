# Use latest Node.js LTS on Alpine Linux
FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy and install only production dependencies
COPY package*.json ./
RUN npm i --only=production

# Copy the rest of the application code
COPY . .

# Set environment variable (optional, but good practice)
ENV PORT=3000

# Expose the port your app runs on
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
