*** Comments ***
# Update a product's quantity in the cart by ID and verify the update.
# Create product dictionary with id and quantity.
# Create a list of products to update.
# Create a dictionary with the list of products.
# Send a PATCH request to update the cart.


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${ID}           1
${QUANTITY}     5


*** Test Cases ***
Update Cart
    Create Session    dummy    ${BASE_URL}
    # &{update_product}=    Create Dictionary    id=${ID}    quantity=${QUANTITY}
    # @{update_products_list}=    Create List    ${update_product}
    # &{update_data}=    Create Dictionary    products=${update_products_list}
    ${payload}=    Evaluate    {"products": [{"id": ${ID}, "quantity": ${QUANTITY}}]}
    ${response}=    PATCH On Session    dummy    /carts/1    json=${payload}
    Status Should Be    200    ${response}
    ${updated_quantity}=    Evaluate    json.loads("""${response.content}""")["products"][0]["quantity"]    modules=json
    Should Be Equal As Strings    ${updated_quantity}    ${QUANTITY}
    [Teardown]    Delete All Sessions
