package za.co.bsg.feign.uaa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserServiceClient userServiceClient;

    @Autowired
    public UserService(UserServiceClient userServiceClient) {
        this.userServiceClient = userServiceClient;
    }

    public UserDTO getLoggedInUserByEmail(String email) {
        return userServiceClient.getLoggedInUserByEmail(email);
    }

    public UserDTO getLoggedInUserByUsername(String username) {
        return userServiceClient.getLoggedInUserByUsername(username);
    }

}
