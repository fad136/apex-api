public class JSONPlaceholderQueueable implements Queueable, Database.AllowsCallouts {

    private List<JSONPlaceholderAPI.JSONPlaceholderUserDTO> users;
    public UserEvent userEvent;
    public enum UserEvent {CREATED, UPDATED, DELETED}

    public JSONPlaceholderQueueable(List<JSONPlaceholderAPI.JSONPlaceholderUserDTO> users, UserEvent userEvent) {
        this.users = users;
        this.userEvent = userEvent;
    }

    public void execute(QueueableContext context) {
        switch on userEvent {
            when CREATED {
                for (JSONPlaceholderAPI.JSONPlaceholderUserDTO user : users) {
                    JSONPlaceholderAPI.service.createUser(user);
                }
            }
            when UPDATED {
                for (JSONPlaceholderAPI.JSONPlaceholderUserDTO user : users) {
                    JSONPlaceholderAPI.service.updateUser(user.id, user);
                }
            }
            when DELETED {
                for (JSONPlaceholderAPI.JSONPlaceholderUserDTO user : users) {
                    JSONPlaceholderAPI.service.deleteUser(user.id);
                }
            }
        }
    }
}