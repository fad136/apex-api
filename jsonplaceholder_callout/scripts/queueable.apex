JSONPlaceholderAPI.JSONPlaceholderUserDTO user = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
user.name = 'John Doe';
user.username = 'johndoe';
user.email = 'johndoe@example.com';
user.phone = '1234567890';
user.website = 'https://example.com';

JSONPlaceholderQueueable queueable = new JSONPlaceholderQueueable(new List<JSONPlaceholderAPI.JSONPlaceholderUserDTO>{ user }, JSONPlaceholderQueueable.UserEvent.CREATED);
System.enqueueJob(queueable);