Buy Expensive Things Only All Pages
    Open Browser    ${URL}    ${BROWSER}

    WHILE    True
        Wait Until Element Is Visible   css=#tbodyid > div > div > div > h4 > a    5s

        ${count}=    Get Element Count    css=#tbodyid > div > div > div > h4 > a
        Log    Found ${count} items on the page

        FOR    ${index}    IN RANGE    ${count}
            ${items}=    Get WebElements    css=#tbodyid > div > div > div > h4 > a
            ${item}=    Get From List    ${items}    ${index}

            Wait Until Element Is Visible    ${item}    5s
            Click Element    ${item}
            Wait Until Element Is Visible    css=.price-container    5s

            ${price_text}=    Get Text    css=.price-container
            ${price_clean}=    Evaluate    re.sub(r'[^0-9]', '', """${price_text}""")    re
            ${price}=    Evaluate    int(${price_clean})

            IF    ${price} > 500
                Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
                Click Element    css=#tbodyid > div.row > div > a
                Alert Should Be Present    action=ACCEPT
                Log    Purchased because price was ${price}
                Go Back
                Go Back
            ELSE
                Log    Skipping purchase; price ${price} is not high enough
                Go Back
            END
            Wait Until Element Is Visible   css=#tbodyid > div > div > div > h4 > a    5s
        END

        ${next_exists}=    Run Keyword And Return Status    Element Should Be Visible    css=#next2    3s
        IF    ${next_exists}
            Click Element    css=#next2
            Sleep    2s
            Wait Until Element Is Visible    css=#tbodyid > div > div > div > h4 > a    5s
        ELSE
            BREAK
        END
    END