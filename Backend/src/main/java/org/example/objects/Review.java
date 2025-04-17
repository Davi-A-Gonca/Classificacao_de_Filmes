package org.example.objects;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigDecimal;

@Document
@Getter
@Setter
public class Review {
    private String id;
    private Film film;
    private BigDecimal rating;
    private String note;

    public Review(String id, BigDecimal rating, String note){
        this.id = id;
        this.rating = rating;
        this.note = note;
    }


}
