*** Settings ***
Library    Browser

*** Test Cases ***
Test1
    New Browser    browser=chromium    headless=False    slowMo=50ms
    New Context    viewport={"width": 1920, "height": 1080}
    New Page       url=https://www.saucedemo.com

    # Read credentials displayed on the login page
    ${logins}=      Get Text    selector=id=login_credentials
    ${password}=    Get Text    selector=div.login_password
    BuiltIn.Log Many        ${logins}    ${password}
