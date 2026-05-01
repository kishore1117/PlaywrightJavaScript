const { Given, When, Then } = require("@cucumber/cucumber");
const { chromium } = require("playwright");
const { expect } = require("@playwright/test");

let page;
let browser;

Given("when the user navigates to login page", async ()=>{
 browser = await chromium.launch({ headless: true });
 page = await browser.newPage();
 await page.goto("https://www.saucedemo.com/");
})

When("the user enters valid username {string} and valid password {string}", async (username, password)=>{
    await page.getByPlaceholder('Username').fill(username);
    await page.getByPlaceholder('Password').fill(password);
    await page.getByText("login").click();
})
When("the user enters invalid username {string} and invalid password {string}", async (username, password)=>{
    await page.getByPlaceholder('Username').fill(username);
    await page.getByPlaceholder('Password').fill(password);
    await page.getByText("login").click();
})

Then("user should see the error message {string}", async (message)=>{
    await expect(page.getByText(message)).toBeVisible();
    await browser.close();
})

Then("user should be able to view the inventory page", async ()=>{
   await expect(page).toHaveURL("https://www.saucedemo.com/inventory.html");
   await browser.close();
})