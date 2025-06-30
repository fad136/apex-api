List<JSONPlaceholderAPI.JSONPlaceholderUserDTO> users = JSONPlaceholderAPI.service.getAllUsers();

List<JSONPlaceholderUser__c> usersToInsert = new List<JSONPlaceholderUser__c>();
for (JSONPlaceholderAPI.JSONPlaceholderUserDTO user : users) {
    JSONPlaceholderUser__c userToInsert = new JSONPlaceholderUser__c();

    // Remember to set the field level security for the fields
    userToInsert.Name__c = user.name;
    userToInsert.Email__c = user.email;
    userToInsert.Phone__c = user.phone;
    userToInsert.Website__c = user.website;
    userToInsert.ExternalId__c = user.id;
    userToInsert.Username__c = user.username;
    usersToInsert.add(userToInsert);
}

insert usersToInsert;