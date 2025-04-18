package org.example.objects;

import lombok.Getter;
import lombok.Setter;
import org.example.objects.DTO.FilmDTO;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
@Getter
@Setter
public class Film {
    private String id;
    private String name;
    private String description;

    public Film(String id, String name, String description){
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public Film(FilmDTO dto){
        name = dto.getName();
        description = dto.getDescription();
    }
}
