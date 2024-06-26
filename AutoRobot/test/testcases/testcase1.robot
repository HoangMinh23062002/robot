*** Settings ***
Library    SeleniumLibrary   
Resource    ../keywords/pages.robot


*** Test Cases ***
Login Test
    Login To Application
    Element Should Contain    ${dictMinh.sucessMsg}    Your registration completed
Get value 
    Get List of text from locator
    
        