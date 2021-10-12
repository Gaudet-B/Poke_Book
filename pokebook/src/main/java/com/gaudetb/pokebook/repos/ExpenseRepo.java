package com.gaudetb.pokebook.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.gaudetb.pokebook.models.Expense;


public interface ExpenseRepo extends CrudRepository<Expense, Long> {
	
	List<Expense> findAll();
	
}
