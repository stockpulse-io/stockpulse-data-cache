# Use lightweight Node.js image
FROM node:18-alpine

# Create workspace
WORKDIR /app

# Copy dependency files first
COPY package.json package-lock.json* ./

# Install exact dependencies
RUN npm ci

# Copy full project
COPY . .

# Start your Kafka -> Redis consumer
CMD ["npm", "start"]