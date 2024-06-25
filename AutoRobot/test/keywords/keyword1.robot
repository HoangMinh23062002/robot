***Settings***
Library    SeleniumLibrary
Resource    

*** Variables ***
&{dictMinh}
...    gender_Checkbox=xpath=//input[@id='gender-male']
...    first_Name=xpath=//input[@id='FirstName']
...    lastName=xpath=//input[@id='LastName']
...    day=xpath=//select[@name='DateOfBirthDay']
...    month=xpath=//select[@name='DateOfBirthMonth']
...    year=xpath=//select[@name='DateOfBirthYear']
...    email=xpath=//input[@id='Email']
...    passwordd=xpath=//input[@id='Password']
...    cfPassword=xpath=//input[@id='ConfirmPassword']
...    registerButton=xpath=//button[@id='register-button']


# Set variable for input data
${firstName}    Minhh



*** Keywords ***
Login To Application
    Open Browser       ${BROWSER}    chrome
    Click Element    ${Wensite}
    Click Element    ${genderCheckbox}
    Input Text    ${firstName}    ${firstName}
    Input Text    ${lastName}    ${firstName}
    Select From List By Value    ${day}    6
    Select From List By Value    ${month}    6
    Select From List By Value    ${year}    1990
    Input Text    ${email}    ${username}@gmail.com
    Input Text    ${passwordd}    ${password}
    Input Text    ${cfPassword}    ${cfPassword}
    Click Element    ${registerButton}
