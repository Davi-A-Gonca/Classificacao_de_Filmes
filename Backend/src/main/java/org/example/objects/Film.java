package org.example.objects;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
@Getter
@Setter
public class Film {
    private String id;
    private String name;
    private String description;

}
