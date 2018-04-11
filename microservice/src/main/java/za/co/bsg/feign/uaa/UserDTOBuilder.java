package za.co.bsg.feign.uaa;

import java.time.Instant;
import java.util.Set;

public class UserDTOBuilder {

    private String id;
    private String login;
    private String firstName;
    private String lastName;
    private String email;
    private boolean activated;
    private String imageUrl;
    private String langKey;
    private String createdBy;
    private Instant createdDate;
    private String lastModifiedBy;
    private Instant lastModifiedDate;
    private Set<String> authorities;
    private String identityNumber;
    private String workNumber;
    private String mobileNumber;

    public static UserDTOBuilder aUserDTO() {
        return new UserDTOBuilder();
    }

    public UserDTOBuilder withId(String id) {
        this.id = id;
        return this;
    }

    public UserDTOBuilder withLogin(String login) {
        this.login = login;
        return this;
    }

    public UserDTOBuilder withFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public UserDTOBuilder withLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public UserDTOBuilder withEmail(String email) {
        this.email = email;
        return this;
    }

    public UserDTOBuilder withActivated(boolean activated) {
        this.activated = activated;
        return this;
    }

    public UserDTOBuilder withImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
        return this;
    }

    public UserDTOBuilder withLangKey(String langKey) {
        this.langKey = langKey;
        return this;
    }

    public UserDTOBuilder withCreatedBy(String createdBy) {
        this.createdBy = createdBy;
        return this;
    }

    public UserDTOBuilder withCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
        return this;
    }

    public UserDTOBuilder withLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
        return this;
    }

    public UserDTOBuilder withLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
        return this;
    }

    public UserDTOBuilder withAuthorities(Set<String> authorities) {
        this.authorities = authorities;
        return this;
    }

    public UserDTOBuilder withIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
        return this;
    }

    public UserDTOBuilder withWorkNumber(String workNumber) {
        this.workNumber = workNumber;
        return this;
    }

    public UserDTOBuilder withMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
        return this;
    }

    public UserDTO createUserDTO() {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(id);
        userDTO.setLogin(login);
        userDTO.setFirstName(firstName);
        userDTO.setLastName(lastName);
        userDTO.setEmail(email);
        userDTO.setActivated(activated);
        userDTO.setImageUrl(imageUrl);
        userDTO.setLangKey(langKey);
        userDTO.setCreatedBy(createdBy);
        userDTO.setCreatedDate(createdDate);
        userDTO.setLastModifiedBy(lastModifiedBy);
        userDTO.setLastModifiedDate(lastModifiedDate);
        userDTO.setAuthorities(authorities);
        userDTO.setIdentityNumber(identityNumber);
        userDTO.setWorkNumber(workNumber);
        userDTO.setMobileNumber(mobileNumber);
        return userDTO;
    }
}
