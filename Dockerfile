FROM node:20-slim

WORKDIR /app

# Install system dependencies for Playwright
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-noto-cjk \
    libxkbcommon0 \
    libxrender1 \
    libxext6 \
    libx11-6 \
    libxrandr2 \
    xvfb \
    libfontconfig1 \
    libfreetype6 \
    libegl1 \
    libgles2 \
    libgl1 \
    libxss1 \
    libappindicator3-1 \
    libsecret-1-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package.json package-lock.json ./

# Install Node dependencies
RUN npm install

# Install Playwright browsers with system dependencies
RUN npm exec playwright install --with-deps chromium

# Install remaining system dependencies
RUN npx playwright install-deps

# Copy project files
COPY . .

# Create target directory for reports
RUN mkdir -p target

# Run tests in headless mode
CMD ["npm", "run", "cucumber"]
