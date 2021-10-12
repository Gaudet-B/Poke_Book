package com.gaudetb.pokebook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaudetb.pokebook.models.Expense;
import com.gaudetb.pokebook.repos.ExpenseRepo;

@Service
public class ExpenseService {

	@Autowired
	ExpenseRepo expenseRepo;

	// ---------------------------
	// Methods:
	public List<Expense> findAll() {
		return expenseRepo.findAll();
	}
	
	public Expense save(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public Expense findOne(Long id) {
		Optional<Expense> expenseOptional = expenseRepo.findById(id);
		if (expenseOptional.isPresent()) return expenseOptional.get();
		else return null;
	}
	
	public void delete(Long id) {
		expenseRepo.deleteById(id);
	}
	

}
