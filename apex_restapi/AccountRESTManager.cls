@RestResource(urlMapping='/Account/v1/*')
global class AccountRESTManager {

    @HttpGet
    global static Account handleGet() {

        /* HOW TO TEST
        1. Go to https://workbench.developerforce.com/login.php
        2. Login with your Salesforce org
        3. Select REST Explorer
        4. Select GET
        5. Fill in the endpoint /services/apexrest/Account/v1/ID_OF_THE_ACCOUNT
        6. Click on the Execute button
        7. You should see the account details in the response body
        */
        
        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        Account account = [SELECT Id, Name, AccountNumber, Website, Phone, Industry, Description FROM Account WHERE Id = :accountId];

        return account;
    } 

    @HttpPost
    global static Account handlePost(Account account) {

        /* HOW TO TEST
        1. Go to https://workbench.developerforce.com/login.php
        2. Login with your Salesforce org
        3. Select REST Explorer
        4. Select POST
        5. Fill in the endpoint /services/apexrest/Account/v1/
        6. Fill in the request body with the following json:
        {"account": {
            "Name": "Test Account",
            "Description": "Test Account Description"
        }}
        7. Click on the Execute button
        8. You should see the account details in the response body
        */

        insert account;
        return account;
    }

    @HttpPut
    global static Account handlePut(Account account) {

        /* HOW TO TEST
        1. Go to https://workbench.developerforce.com/login.php
        2. Login with your Salesforce org
        3. Select REST Explorer
        4. Select PUT
        5. Fill in the endpoint /services/apexrest/Account/v1/
        6. Fill in the request body with the following json:
        {"account": {
            "Id": "ID_OF_THE_ACCOUNT",
            "Description": "Test Account Description"
        }}
        7. Click on the Execute button
        8. You should see the account details in the response body
        */

        upsert account;
        return account;
    }

    @HttpPatch
    global static Account handlePatch(String description, String accountId) {

        /* HOW TO TEST
        1. Go to https://workbench.developerforce.com/login.php
        2. Login with your Salesforce org
        3. Select REST Explorer
        4. Select PATCH
        5. Fill in the endpoint /services/apexrest/Account/v1/
        6. Fill in the request body with the following json:
        {"description": "Test Account Description", "accountId": "ID_OF_THE_ACCOUNT"}
        7. Click on the Execute button
        8. You should see the account details in the response body
        */

        Account account = [SELECT Id, Description FROM Account WHERE Id = :accountId];
        account.Description = description;
        update account;
        return account;
    }

    @HttpDelete
    global static void handleDelete() {

        /* HOW TO TEST
        1. Go to https://workbench.developerforce.com/login.php
        2. Login with your Salesforce org
        3. Select REST Explorer
        4. Select DELETE
        5. Fill in the endpoint /services/apexrest/Account/v1/ID_OF_THE_ACCOUNT
        6. Click on the Execute button
        7. You should see the account details in the response body
        */

        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        Account accountToDelete = [SELECT Id FROM Account WHERE Id = :accountId];
        delete accountToDelete;
    }

}
