FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Install Playwright browsers
RUN npx playwright install

# Copy project files
COPY . .

# Create target directory for reports
RUN mkdir -p target

# Run tests
CMD ["npm", "run", "cucumber"]
