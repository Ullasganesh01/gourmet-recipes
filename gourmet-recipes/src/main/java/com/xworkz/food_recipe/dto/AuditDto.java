package com.xworkz.food_recipe.dto;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "audits")
public class AuditDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "audit_id")
    private int id;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private UserDto userDto;

    @NotBlank
    @NotNull
    @Size(min = 4,message = "Created By length must be atleast 4 ")
    @Column(name = "created_by")
    private String createdBy;

    @NotNull
    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @NotBlank
    @NotNull
    @Size(min = 4,message = "Updated By length must be atleast 4")
    @Column(name = "updated_by")
    private String updatedBy;

    @NotNull
    @Column(name = "updated_on")
    private LocalDateTime updatedOn;
}
