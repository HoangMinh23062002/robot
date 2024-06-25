*** Settings ***
Library    SeleniumLibrary   
Resource    ../keywords/keyword1.robot


*** Test Cases ***
Login Test
    Login To Application    ${username}    ${password}    ${cfPassword}