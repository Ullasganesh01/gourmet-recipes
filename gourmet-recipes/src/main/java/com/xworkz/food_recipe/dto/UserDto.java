package com.xworkz.food_recipe.dto;

import com.xworkz.food_recipe.constants.Gender;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.*;

@Data
@Entity
@Table(name = "users")
@NamedQueries({
        @NamedQuery(name = "fetchAllUsers",query = "from UserDto dto"),
        @NamedQuery(name = "fetchUserByEmail",query = "from UserDto dto where dto.email=:email"),
        @NamedQuery(name = "fetchUserByLoginID",query = "from UserDto dto where dto.email=:loginId OR dto.firstName=:loginId"),
        @NamedQuery(name = "fetchAllUserEmails",query = "select dto.email from UserDto dto"),
        @NamedQuery(name = "fetchUserEmailsExcept",query = "select dto.email from UserDto dto where dto.id!=:id"),
        @NamedQuery(name = "fetchUserContactNoExcept",query = "select dto.contactNo from UserDto dto where dto.id!=:id"),
        @NamedQuery(name = "fetchAllUserContactNo",query = "select dto.contactNo from UserDto dto"),
        @NamedQuery(name = "filterUsers",query = "from UserDto dto where dto.firstName LIKE CONCAT('%',:filter,'%') OR dto.lastName LIKE CONCAT('%',:filter,'%') " +
                "OR dto.email LIKE CONCAT('%',:filter,'%') OR dto.contactNo LIKE CONCAT('%',:filter,'%') OR dto.gender LIKE CONCAT('%',:filter,'%')")
})
public class UserDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int id;

    @NotNull
    @NotBlank
    @Size(min = 4,max = 15,message = "First Name character length must be between 4 and 15")
    @Column(name = "first_name")
    private String firstName;

    @NotNull
    @NotBlank
    @Size(min = 1,max = 15,message = "Last Name character length must be between 1 and 15")
    @Column(name = "last_name")
    private String lastName;

    @NotNull
    @NotBlank
    @Column(unique = true)
    @Pattern(regexp = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$",message = "email must be in abc@gmail.com format")
    private String email;

    @NotNull
    @Min(value = 1000000000,message = "Contact Number must contain 10 digits")
    @Column(name = "contact_number",unique = true)
    private long contactNo;

    @NotNull
    @Min(value = 1000000000,message = "Alternative Contact Number must contain 10 digits")
    @Column(name = "alternative_number")
    private long alternativeNumber;

    @NotNull
    @Enumerated(value = EnumType.STRING)
    private Gender gender;

    @NotNull
    @NotBlank
    @Size(min = 5,max = 100,message = "Address character length must be between 5 and 40")
    private String address;

    @NotNull
    @NotBlank
    @Size(min = 7,max = 16,message = "Password character length must be between 7 and 16")
    @Column(name = "password")
    private String password;

    @Lob
    @Column(name = "profile_pic")
    private byte[] profilePic;
}
