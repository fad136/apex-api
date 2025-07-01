@isTest
private class AccountRESTManagerTest {

    @TestSetup
    static void setup() {
        Account account = new Account(Name = 'Test Account');
        insert account;
    }

    @isTest
    static void test_handleGet() {
        RestRequest request = new RestRequest();

        Account account = [SELECT Id FROM Account LIMIT 1];

        request.requestUri = 'https://SWE106.salesforce.com/services/apexrest/Account/v1/' + account.Id;
        request.httpMethod = 'GET';

        RestContext.request = request;

        Account result = AccountRESTManager.handleGet();

        System.assertEquals(account.Id, result.Id);
    }

    @isTest
    static void test_handlePost() {
        RestRequest request = new RestRequest();

        request.requestUri = 'https://SWE106.salesforce.com/services/apexrest/Account/v1/';
        request.httpMethod = 'POST';

        RestContext.request = request;

        Account account = new Account(Name = 'Test Account');
        Account result = AccountRESTManager.handlePost(account);

        System.assertEquals(account.Id, result.Id);
        System.assertEquals(account.Name, result.Name);
    }

    @isTest
    static void test_handlePut() {
        RestRequest request = new RestRequest();

        request.requestUri = 'https://SWE106.salesforce.com/services/apexrest/Account/v1/';
        request.httpMethod = 'PUT';

        RestContext.request = request;

        Account account = [SELECT Id FROM Account LIMIT 1];
        account.Name = 'Test Account';
        Account result = AccountRESTManager.handlePut(account);

        System.assertEquals(account.Id, result.Id);
        System.assertEquals(account.Name, result.Name);
    }

    @isTest
    static void test_handlePatch() {
        RestRequest request = new RestRequest();

        request.requestUri = 'https://SWE106.salesforce.com/services/apexrest/Account/v1/';
        request.httpMethod = 'PATCH';

        Account account = [SELECT Id FROM Account LIMIT 1];
        String description = 'Test Account Description';
        String accountId = account.Id;
        Account result = AccountRESTManager.handlePatch(description, accountId);

        System.assertEquals(account.Id, result.Id);
        System.assertEquals(description, result.Description);
    }

    @isTest
    static void test_handleDelete() {
        RestRequest request = new RestRequest();

        Account account = [SELECT Id FROM Account LIMIT 1];

        request.requestUri = 'https://SWE106.salesforce.com/services/apexrest/Account/v1/' + account.Id;
        request.httpMethod = 'DELETE';

        RestContext.request = request;

        AccountRESTManager.handleDelete();

        System.assertEquals(0, [SELECT COUNT() FROM Account]);
    }
}