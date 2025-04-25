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

    public void setFilm(Film film) {
        this.film = film;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getNote() {
        return note;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public Film getFilm() {
        return film;
    }

    private String note;
}