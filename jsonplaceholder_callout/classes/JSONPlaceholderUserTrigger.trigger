trigger JSONPlaceholderUserTrigger on JSONPlaceholderUser__c (after insert, after update, after delete) {

    List<JSONPlaceholderAPI.JSONPlaceholderUserDTO> users = new List<JSONPlaceholderAPI.JSONPlaceholderUserDTO>();

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            for (JSONPlaceholderUser__c user : Trigger.new) {
                JSONPlaceholderAPI.JSONPlaceholderUserDTO userDTO = JSONPlaceholderUserTriggerHelper.buildUserDTO(user);
                users.add(userDTO);
            }
            System.enqueueJob(new JSONPlaceholderQueueable(users, JSONPlaceholderQueueable.UserEvent.CREATED));
        } else if (Trigger.isUpdate) {
            for (JSONPlaceholderUser__c user : Trigger.new) {
                JSONPlaceholderAPI.JSONPlaceholderUserDTO userDTO = JSONPlaceholderUserTriggerHelper.buildUserDTO(user);
                users.add(userDTO);
            }
            System.enqueueJob(new JSONPlaceholderQueueable(users, JSONPlaceholderQueueable.UserEvent.UPDATED));
        } else if (Trigger.isDelete) {
            for (JSONPlaceholderUser__c user : Trigger.old) {
                JSONPlaceholderAPI.JSONPlaceholderUserDTO userDTO = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
                userDTO.id = (Integer) user.ExternalId__c;
                users.add(userDTO);
            }
            System.enqueueJob(new JSONPlaceholderQueueable(users, JSONPlaceholderQueueable.UserEvent.DELETED));
        }
    }

}