*** Settings ***
Library    SeleniumLibrary
Resource    ./resources/demoblaze.resource

*** Variables ***


*** Test Cases ***
Add product in cart and checkout
    # use keyword from resource
    Open Demoblaze
    # Wait Until Element Is Visible    css=#tbodyid > div:nth-child(2) > div > div > h4 > a    Nokia lumia 1520
    # Click Element    css=#tbodyid > div:nth-child(2) > div > div > h4 > a
    # # Wait for go to page of product
    # Wait Until Element Is Visible    css=body > div.product-content.product-wrap.clearfix.product-deatil
    # Click Element    css=#tbodyid > div.row > div > a
    # Alert Should Be Present
    # Wait Until Element Is Visible    css=#cartur    Cart
    # Click Element    css=#cartur
    # Wait Until Element Is Visible    css=#tbodyid > tr > td:nth-child(2)    Nokia lumia 1520
    # Click Button    css=#page-wrapper > div > div.col-lg-1 > button