public class JSONPlaceholderAPI {

    public static final APIImpl service = new APIImpl();
    
    public class APIImpl {

        private APIImpl() {}

        public List<JSONPlaceholderUserDTO> getAllUsers() {
            HttpRequest request = getRequest('GET', '/users');
            HttpResponse response = sendRequest(request);
            List<JSONPlaceholderUserDTO> users = (List<JSONPlaceholderUserDTO>) JSON.deserialize(response.getBody(), List<JSONPlaceholderUserDTO>.class);
            return users;
        }

        public JSONPlaceholderUserDTO getUserById(Integer id) {
            HttpRequest request = getRequest('GET', '/users/' + id);
            HttpResponse response = sendRequest(request);
            JSONPlaceholderUserDTO user = (JSONPlaceholderUserDTO) JSON.deserialize(response.getBody(), JSONPlaceholderUserDTO.class);
            return user;
        }

        public String getUserEmailById(Integer id) {
            JSONPlaceholderUserDTO user = getUserById(id);
            return user != null ? user.email : null;
        }

        public void createUser(JSONPlaceholderUserDTO user) {
            HttpRequest request = getRequest('POST', '/users');
            request.setBody(JSON.serialize(user));
            HttpResponse response = sendRequest(request);
            System.debug(response.getBody());
        }

        public void updateUser(Integer id, JSONPlaceholderUserDTO user) {
            HttpRequest request = getRequest('PUT', '/users/' + id);
            request.setBody(JSON.serialize(user));
            HttpResponse response = sendRequest(request);
            System.debug(response.getBody());
        }

        public void deleteUser(Integer id) {
            HttpRequest request = getRequest('DELETE', '/users/' + id);
            HttpResponse response = sendRequest(request);
            System.debug(response.getBody());
        }

        @TestVisible
        private HttpRequest getRequest (String method, String endpoint) {

            // HARDCODED APPROACH
            String baseUrl = 'https://jsonplaceholder.typicode.com';

            /* REMOTE SITE SETTINGS + CUSTOM SETTINGS APPROACH
            Setup | Home | Data | Schema Settings and Enable "Manage List Custom Settings Type" to enable List Custom Settings
            
            String baseUrl = JSONPlaceholderSettings__c.getValues('baseUrl').Value__c;
            */
            

            /* NAMED CREDENTIALS APPROACH
            1. Create the External Credential
            2. Create the Named Credential relating it to the External Credential
            3. In the External Credential, create a Principal
            4. Create a Permission Set to assign the Principal to the User in the External Credential Principal Access section

            String baseUrl = 'callout:JSONPlaceholderNamedCredential';
            */

            HttpRequest request = new HttpRequest();
            request.setEndpoint(baseUrl + endpoint);
            request.setMethod(method);

            /* 
            If you need to use an API key, here's how to do it:

            request.setHeader('Authorization', 'Bearer ' + apiKey);
            String apiKey = JSONPlaceholderSettings__c.getValues('apiKey').Value__c;
            */

            if (method == 'POST') {
                request.setHeader('Content-Type', 'application/json');
            }
            return request;
        }   

        @TestVisible
        private HttpResponse sendRequest (HttpRequest request) {
            return new Http().send(request);
        }

    }

    public class JSONPlaceholderUserDTO {
        public Integer id;
        public String name;
        public String username;
        public String email;
        public String phone;
        public String website;
        public AddressDTO address;
        public CompanyDTO company;
    }

    public class AddressDTO {
        public String street;
        public String suite;
        public String city;
        public String zipcode;
        public GeoDTO geo;
    }

    public class GeoDTO {
        public String lat;
        public String lng;
    }

    public class CompanyDTO {
        public String name;
        public String catchPhrase;
        public String bs;
    }
}