***Settings***
Documentation    Test login to admin account
Library          SeleniumLibrary
Suite Setup      Prepare Env

***Variables***
${LOGIN}            login
${PASSWORD}         password
${expected_link}    https://poczta.wp.pl/w/mails?label=1

***Test Cases***
Login to admin pass or fail
    Open websiteeees
    Accept Rules Google
    Typing login
    Typing password
    Click Enter
    LOG CURRENT LOCATION


***Keywords***
Prepare Env
    Set Selenium Speed    1

Open websiteeees
    Open Browser               https://poczta.wp.pl    chrome
    Maximize Browser Window

Accept Rules Google
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div[3]/div/button[2]
    Click Element                    xpath=/html/body/div[3]/div/div[2]/div[3]/div/button[2]

Typing login
    Input Text    id:login    ${LOGIN} 

Typing password
    Input Text    id:password    ${PASSWORD} 

Click Enter
    Press Keys    id:password    ENTER

LOG CURRENT LOCATION
    ${url} =          Execute Javascript                return window.location.href;
    Log               LOCATIhON:${url}                  console=yes
    Run Keyword If    "${url}" != "${expected_link}"    Fail                            Link is not equal to expected


# https://poczta.wp.pl/login/login.html#bad_login
# https://poczta.wp.pl/w/mails?label=1