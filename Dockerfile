FROM node:20-alpine

WORKDIR /app

# Install dependencies for Playwright to run in headless environment
RUN apk add --no-cache \
    bash \
    ca-certificates \
    font-noto-cjk \
    libxkbcommon \
    libxrender \
    libxext \
    libx11 \
    libxrandr \
    xvfb

# Copy package files
COPY package.json package-lock.json ./

# Install Node dependencies
RUN npm install

# Install Playwright and browsers
RUN npx playwright install --with-deps chromium

# Copy project files
COPY . .

# Create target directory for reports
RUN mkdir -p target

# Run tests in headless mode
CMD ["npm", "run", "cucumber"]
