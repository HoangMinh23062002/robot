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
...    first_Name=xpath=//input[@id='FirstName']
...    lastName=xpath=//input[@id='LastName']
...    day=xpath=//select[@name='DateOfBirthDay']
...    month=xpath=//select[@name='DateOfBirthMonth']
...    year=xpath=//select[@name='DateOfBirthYear']
...    email=xpath=//input[@id='Email']
...    passwordd=xpath=//input[@id='Password']
...    cfPassword=xpath=//input[@id='ConfirmPassword']
...    registerButton=xpath=//button[@id='register-button']
...    sucessMsg=xpath=//div[@class='result']
&{listLocator}
...    menu_value=xpath=//ul[@class='top-menu notmobile']/li/a
...    apprarel_menu=xpath=(//ul[@class='top-menu notmobile']/li/a)[3]
...    header_logo=xpath=//div[@class='header-logo']/a

# Set variable for input data

*** Keywords ***
Login To Application
    [Documentation]    Opens the browser and registers a new user
    Open Browser       ${form_url.browserA}    chrome
    Maximize Browser Window
    SeleniumLibrary.Click Element    ${dictMinh.register_button}
    SeleniumLibrary.Input Text    ${dictMinh.first_Name}    ${form_url.name}
    SeleniumLibrary.Input Text    ${dictMinh.lastName}    ${form_url.name}
    Select From List By Value    ${dictMinh.day}    6
    Select From List By Value    ${dictMinh.month}    6
    Select From List By Value    ${dictMinh.year}    1990
    SeleniumLibrary.Input Text    ${dictMinh.email}    ${form_url.email}
    SeleniumLibrary.Input Text    ${dictMinh.passwordd}    ${form_url.password}
    SeleniumLibrary.Input Text    ${dictMinh.cfPassword}    ${form_url.cfpasssword}
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
    
