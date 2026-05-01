# BDD Test Suite

A Behavior Driven Development (BDD) test suite for automated browser testing using Cucumber and Playwright.

## 📋 Project Overview

This project implements BDD testing practices using Gherkin syntax for writing test scenarios. Tests are executed against the Sauce Demo application (https://www.saucedemo.com/) to validate login functionality with both valid and invalid credentials.

## 🛠 Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| **Node.js** | 18+ | JavaScript runtime |
| **Cucumber** | ^12.8.2 | BDD framework for writing scenarios in Gherkin syntax |
| **Playwright** | Latest | Browser automation for Chrome/Firefox/Safari |
| **@playwright/test** | ^1.59.1 | Test assertion library |
| **Docker** | Latest | Containerization for consistent test environments |
| **GitHub Actions** | Latest | CI/CD automation |

## 📁 Project Structure

```
bdd/
├── Dockerfile                 # Docker configuration for containerized tests
├── package.json              # Node.js dependencies and npm scripts
├── playwright.config.js      # Playwright configuration (optional)
├── .github/
│   └── workflows/
│       └── test.yml         # GitHub Actions workflow for CI/CD
├── config/
│   └── cucumber.js          # Cucumber configuration
├── tests/
│   ├── features/
│   │   └── login.feature    # Gherkin feature file with test scenarios
│   └── stepDefinitions/
│       └── login.js         # Step implementations for feature steps
└── reports/
    ├── cucumber-report.json # Test results in JSON format
    └── cucumber-report.html # HTML test report
```

## 📦 Prerequisites

- **Node.js** 18+ installed
- **npm** or **yarn** package manager
- **Git** for version control
- **Docker** (optional, for containerized runs)

## 🚀 Getting Started

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd bdd
```

2. Install dependencies:
```bash
npm install
```

3. Install Playwright browsers:
```bash
npx playwright install
```

## 🧪 Running Tests

### Run all tests:
```bash
npm run cucumber
```

### Run specific feature file:
```bash
npm run cucumber:login
```

Or from command line:
```bash
npx cucumber-js tests/features/login.feature --config config/cucumber.js
```

### Run tests by tags:
```bash
npx cucumber-js --config config/cucumber.js --tags "@login"
```

## 📊 Test Reports

### View HTML Report:
```bash
npm run cucumber:report
```

Or manually:
```bash
open reports/cucumber-report.html
```

### JSON Report Location:
```
reports/cucumber-report.json
```

## 🐳 Docker Usage

### Build Docker image:
```bash
docker build -t bdd-tests .
```

### Run tests in Docker container:
```bash
docker run bdd-tests
```

### Extract reports from Docker:
```bash
docker run --rm -v $(pwd)/reports:/app/reports bdd-tests
```

## ⚙️ Configuration Files

### `config/cucumber.js`
Cucumber configuration with:
- Feature file paths
- Step definition paths
- Report formats (JSON, HTML, progress-bar)
- Format options (colors, snippet interface)

### `.github/workflows/test.yml`
GitHub Actions workflow that:
- Triggers on push to `main`/`develop` branches
- Triggers on pull requests
- Installs dependencies
- Runs tests in Ubuntu environment
- Uploads test reports as artifacts
- Publishes test results

## 📝 Gherkin Scenarios

### Feature: Login Functionality

**Valid Login Scenario:**
- Navigate to Sauce Demo login page
- Enter valid credentials (standard_user / secret_sauce)
- Verify successful login (inventory page is displayed)

**Invalid Login Scenarios:**
- Navigate to Sauce Demo login page
- Enter invalid credentials
- Verify error message is displayed

## 🔧 NPM Scripts

```json
{
  "cucumber": "cucumber-js --config config/cucumber.js",
  "cucumber:report": "open reports/cucumber-report.html"
}
```

## 📲 CI/CD Pipeline

The project includes GitHub Actions workflow (`.github/workflows/test.yml`) that:

1. **Triggers**: On push to main/develop or PR creation
2. **Setup**: Installs Node.js 18 and dependencies
3. **Execute**: Runs Cucumber tests with Playwright
4. **Report**: Uploads test reports as artifacts
5. **Publish**: Makes test results available in GitHub

## 📊 Test Execution Flow

```
npm run cucumber
    ↓
Reads config/cucumber.js
    ↓
Discovers tests/features/*.feature files
    ↓
Loads tests/stepDefinitions/*.js step implementations
    ↓
Executes scenarios with Playwright browser automation
    ↓
Generates JSON & HTML reports in reports/ folder
    ↓
Displays progress bar in terminal
```

## 🌐 Application Under Test

- **URL**: https://www.saucedemo.com/
- **Test User**: standard_user
- **Test Password**: secret_sauce
- **Features Tested**: Login functionality

## 🚨 Troubleshooting

### "Cannot use import statement outside a module"
- Ensure `package.json` has `"type": "commonjs"`
- Use `require()` instead of `import` statements

### HTML report not generating
- Verify `reports/` directory exists
- Check `config/cucumber.js` format configuration
- Ensure `html:reports/cucumber-report.html` is set correctly

### Playwright browser not found
- Run: `npx playwright install`
- Or: `npm install && npx playwright install`

### Docker build failures
- Ensure Docker is running
- Check `Dockerfile` uses correct Node.js version
- Verify all files are included

## 📚 Resources

- [Cucumber.js Documentation](https://cucumber.io/docs/cucumber/)
- [Playwright Documentation](https://playwright.dev/)
- [Gherkin Syntax Guide](https://cucumber.io/docs/gherkin/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 📋 Next Steps

- Add more test scenarios
- Integrate with test management tools
- Set up notifications for test failures
- Expand to multiple browsers (Chrome, Firefox, Safari)
- Add API testing alongside UI tests

## 👤 Author

Created for BDD practice and automated testing

## 📄 License

ISC
