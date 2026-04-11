*** Settings ***
Library    Browser
Library    String
Library    Collections

*** Test Cases ***
Test1
    New Browser    browser=chromium    headless=False    slowMo=50ms
    New Context    viewport={"width": 1920, "height": 1080}
    New Page       url=https://www.saucedemo.com

    # Read credentials displayed on the login page
    ${logins}=      Get Text    selector=id=login_credentials
    ${password}=    Get Text    selector=div.login_password
    BuiltIn.Log Many    ${logins}    ${password}

    ${logins}=     String.Fetch From Right    ${logins}    separator=:
    ${logins}=     String.Split String        ${logins}    
    ${logins}=     Collections.Get From List    ${logins}    index=0

    ${password}=   String.Fetch From Right    ${password}    separator=:
    ${password}=   String.Split String        ${password}    
    ${password}=   Collections.Get From List    ${password}    index=0
    BuiltIn.Log Many    ${logins}    ${password}
    # Enter credentials and click login button