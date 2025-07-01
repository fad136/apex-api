/*
UPLOAD THESE STATIC RESOURCES:
- mock_create.json, giving the name "JSONPlaceholderAPIMock_create", Cache Control: Public
- mock_update.json, giving the name "JSONPlaceholderAPIMock_update", Cache Control: Public
- mock_delete.json, giving the name "JSONPlaceholderAPIMock_delete", Cache Control: Public
*/

@isTest
private class JSONPlaceholderQueueableTest {

    // Method to create multimock for update and delete, since they have the same status code
    static MultiStaticResourceCalloutMock getMock() {
        MultiStaticResourceCalloutMock multiMock = new MultiStaticResourceCalloutMock();
        multiMock.setStaticResource('https://jsonplaceholder.typicode.com/users/1', 'JSONPlaceholderAPIMock_update');
        multiMock.setStaticResource('https://jsonplaceholder.typicode.com/users/2', 'JSONPlaceholderAPIMock_delete');
        multiMock.setStatusCode(200);
        multiMock.setHeader('Content-Type', 'application/json');
        return multiMock;
    }

    @isTest
    static void testUpdateUser() {
        Test.setMock(HttpCalloutMock.class, getMock());

        JSONPlaceholderAPI.JSONPlaceholderUserDTO user = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
        user.id = 1;
        user.name = 'Test';

        Test.startTest();
        JSONPlaceholderQueueable queueable = new JSONPlaceholderQueueable(new List<JSONPlaceholderAPI.JSONPlaceholderUserDTO>{user}, JSONPlaceholderQueueable.UserEvent.UPDATED);
        System.enqueueJob(queueable);
        Test.stopTest();
    }

    @isTest
    static void testDeleteUser() {
        Test.setMock(HttpCalloutMock.class, getMock());

        JSONPlaceholderAPI.JSONPlaceholderUserDTO user = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
        user.id = 2;

        Test.startTest();
        JSONPlaceholderQueueable queueable = new JSONPlaceholderQueueable(new List<JSONPlaceholderAPI.JSONPlaceholderUserDTO>{user}, JSONPlaceholderQueueable.UserEvent.DELETED);
        System.enqueueJob(queueable);
        Test.stopTest();
    }

    @isTest
    static void testCreateUser() {

        // Mock the create user callout
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('JSONPlaceholderAPIMock_create');
        mock.setStatusCode(201);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        JSONPlaceholderAPI.JSONPlaceholderUserDTO user = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
        user.name = 'Test';
        user.username = 'testuser';
        user.email = 'testuser@example.com';
        user.phone = '1234567890';
        user.website = 'https://example.com';

        Test.startTest();
        JSONPlaceholderQueueable queueable = new JSONPlaceholderQueueable(new List<JSONPlaceholderAPI.JSONPlaceholderUserDTO>{user}, JSONPlaceholderQueueable.UserEvent.CREATED);
        System.enqueueJob(queueable);
        Test.stopTest();
    }
}