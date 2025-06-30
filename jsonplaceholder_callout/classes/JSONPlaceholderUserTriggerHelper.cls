public class JSONPlaceholderUserTriggerHelper {

    public static JSONPlaceholderAPI.JSONPlaceholderUserDTO buildUserDTO(JSONPlaceholderUser__c user) {
        JSONPlaceholderAPI.JSONPlaceholderUserDTO userDTO = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
        userDTO.id = (Integer) user.ExternalId__c;
        userDTO.name = user.Name__c;
        userDTO.username = user.Username__c;
        userDTO.email = user.Email__c;
        userDTO.phone = user.Phone__c;
        userDTO.website = user.Website__c;
        return userDTO;
    }

}