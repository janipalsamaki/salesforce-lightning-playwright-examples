*** Settings ***
Documentation       Salesforce Lightning uses a lot of shadow DOMs.
...                 Playwright can access the shadow DOMs.
...                 Here's examples of interacting with various elements.
...                 Visible browser is enabled for demo purposes.
...                 SelectorsHub works well for finding the initial locators.

Library             RPA.Browser.Playwright


*** Variables ***
${DEMO_APP_URL}=    https://lwc-recipes-oss.herokuapp.com


*** Tasks ***
Interact with input fields
    New Browser    headless=False
    New Page    ${DEMO_APP_URL}
    Type Text
    ...    css=recipe-hello-expressions ui-input:nth-child(1) input
    ...    First name
    Type Text
    ...    css=recipe-hello-expressions ui-input:nth-child(2) input
    ...    Last name
    Take Screenshot
    ...    selector=css=recipe-hello-expressions ui-card .card-body

Interact with dynamic elements
    New Browser    headless=False
    New Page    ${DEMO_APP_URL}/#composition
    Type Text
    ...    css=recipe-composition-contact-search input[type="search"]
    ...    Amy
    ${search_result_locator}=
    ...    Set Variable
    ...    css=recipe-composition-contact-search recipe-contact-tile
    Wait For Elements State    ${search_result_locator}
    Take Screenshot    selector=${search_result_locator}
