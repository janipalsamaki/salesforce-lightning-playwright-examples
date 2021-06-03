*** Settings ***
Documentation     Salesforce Lightning uses a lot of shadow DOMs.
...               Playwright expressions can access the shadow DOMs.
...               Here's examples of interacting with various elements.
...               Visible browser is enabled for demo purposes.
...               The presenter mode is enabled for demo purposes.
...               SelectorsHub works well for finding the initial locators.
Library           RPA.Browser.Playwright    enable_presenter_mode=True

*** Variables ***
${DEMO_APP_URL}=    https://lwc-recipes-oss.herokuapp.com

*** Tasks ***
Interact with input fields
    Open Browser    ${DEMO_APP_URL}
    Type Text
    ...    css=recipe-hello-expressions >> ui-input:nth-child(1) input
    ...    First name
    Type Text
    ...    css=recipe-hello-expressions >> ui-input:nth-child(2) input
    ...    Last name
    Take Screenshot
    ...    selector=css=recipe-hello-expressions >> ui-card >> .card-body

*** Tasks ***
Interact with dynamic elements
    Open Browser    ${DEMO_APP_URL}/#composition
    Type Text
    ...    css=recipe-composition-contact-search >> input[type="search"]
    ...    Amy
    ${search_result_locator}=
    ...    Set Variable
    ...    css=recipe-composition-contact-search >> recipe-contact-tile
    Wait For Elements State
    ...    ${search_result_locator}
    ...    visible
    Take Screenshot    selector=${search_result_locator}
