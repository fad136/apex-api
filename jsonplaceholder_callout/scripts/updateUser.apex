JSONPlaceholderAPI.JSONPlaceholderUserDTO user = new JSONPlaceholderAPI.JSONPlaceholderUserDTO();
user.name = 'John Doe';
user.username = 'johndoe';
user.email = 'johndoe@example.com';
user.phone = '1234567890';
user.website = 'https://example.com';
user.id = 1;

JSONPlaceholderAPI.service.updateUser(1, user);