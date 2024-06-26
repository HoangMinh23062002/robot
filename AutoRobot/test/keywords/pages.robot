***Settings***
Library    SeleniumLibrary
Variables    ../resources/testdata.yaml
Variables    ../resources/cc_test.yaml
Library    yaml
Library    AppiumLibrary
Library    Collections



*** Variables ***
${WAIT_TIMEOUT}    Get Value From YAML    WAIT_TIMEOUT
&{dictMinh}
...    register_button=xpath=//a[@class='ico-register']
...    gender_Checkbox=xpath=//input[@id='gender-male']
...    firstName_field=xpath=//input[@id='FirstName']
...    lastName_field=xpath=//input[@id='LastName']
...    day_field=xpath=//select[@name='DateOfBirthDay']
...    month_field=xpath=//select[@name='DateOfBirthMonth']
...    year_field=xpath=//select[@name='DateOfBirthYear']
...    email_field=xpath=//input[@id='Email']
...    passwordd_field=xpath=//input[@id='Password']
...    cfPassword_field=xpath=//input[@id='ConfirmPassword']
...    registerButton=xpath=//button[@id='register-button']
...    sucessMsg=xpath=//div[@class='result']
&{listLocator}
...    menu_value=xpath=//ul[@class='top-menu notmobile']/li/a
...    header_logo=xpath=//div[@class='header-logo']/a

# Set variable for input data

*** Keywords ***
Login To Application
    [Documentation]    Opens the browser and registers a new user
    Open Browser       ${form_url.browserA}    chrome
    Maximize Browser Window
    SeleniumLibrary.Click Element    ${dictMinh.register_button}
    SeleniumLibrary.Input Text    ${dictMinh.firstName_field}    ${form_url.name}
    SeleniumLibrary.Input Text    ${dictMinh.lastName_field}    ${form_url.name}
    Select From List By Value    ${dictMinh.day_field}    6
    Select From List By Value    ${dictMinh.month_field}    6
    Select From List By Value    ${dictMinh.year_field}    1990
    SeleniumLibrary.Input Text    ${dictMinh.email_field}    ${form_url.email}
    SeleniumLibrary.Input Text    ${dictMinh.passwordd_field}    ${form_url.password}
    SeleniumLibrary.Input Text    ${dictMinh.cfPassword_field}    ${form_url.cfpasssword}
    SeleniumLibrary.Click Element    ${dictMinh.registerButton}
    
Get List of text from locator
    @{elements}=    SeleniumLibrary.Get WebElements    ${listLocator.menu_value}
    @{list_values}=    Create List

    FOR    ${element}    IN    @{elements}
    ${getMenuText}=    SeleniumLibrary.Get Text    ${element}

    BuiltIn.Run Keyword If    '${getMenuText}' == 'Apprel'    # robotcode: ignore
    SeleniumLibrary.Click Element    ${listLocator.menu_value}

    END
    Log Many    @{list_values}

    # Append to list
    Append To List    ${list_values}    Minhhh
    Log Many    @{list_values}

    # Create list to combine
    @{my_list_B}    Create List    MInh    Tram    Tu    Tuan
    Log    Last name: ${my_list_B}

    # Combine list
    ${my_list_C}    Create List    ${list_values}    ${my_list_B}
    Log    Combined list: ${my_list_C}

    # Contain Value
    List Should Contain Value    ${my_list_B}    Tu
    
