package br.com.srdeveloper.repository;

import br.com.srdeveloper.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {}