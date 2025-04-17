package org.example.objects.DTO;

import lombok.Getter;
import lombok.Setter;
import org.example.objects.Film;

import java.math.BigDecimal;

@Getter
@Setter
public class ReviewDTO {
    private Film film;
    private BigDecimal rating;
    private String note;
}
