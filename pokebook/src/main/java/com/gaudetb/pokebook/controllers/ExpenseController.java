package com.gaudetb.pokebook.controllers;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gaudetb.pokebook.models.Expense;
import com.gaudetb.pokebook.services.ExpenseService;

@RequestMapping("/expenses")
@Controller
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	// ---------------------------
	// Constructors:
	
	
	// ---------------------------
	// Routes:
	
	@GetMapping("")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		
		ArrayList<Expense> expenses = (ArrayList<Expense>) expenseService.findAll();
		model.addAttribute("expenses", expenses);
		
		return "index.jsp";
	}
	
	@PostMapping("/create")
	public String newExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			
			ArrayList<Expense> expenses = (ArrayList<Expense>) expenseService.findAll();
			model.addAttribute("expenses", expenses);
			
			return "index.jsp";
			
		} else {
			expenseService.save(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@ModelAttribute("expense") Expense expense, Model model, @PathVariable("id") Long id) {
		
//		Expense expense = expenseService.findOne(id);
		model.addAttribute("expense", expenseService.findOne(id));
		
		return "edit.jsp";
	}
	
	@PutMapping("/update/{id}")
	public String updateExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, @PathVariable("id") Long id) {
		
		if (result.hasErrors()) {
			
//			Expense originalExpense = expenseService.findOne(id);
//			model.addAttribute("expense", originalExpense);
			
			return "edit.jsp";
			
		} else {
			Expense e = expenseService.findOne(id);
			e.setName(expense.getName());
			e.setVendor(expense.getVendor());
			e.setAmount(expense.getAmount());
			e.setDescription(expense.getDescription());
			expenseService.save(e);
			return "redirect:/expenses";
//			return "redirect:/expenses/edit/" + id;
		}
		
	}
	
	@GetMapping("/view/{id}")
	public String viewExpense(@PathVariable("id") Long id, Model model) {
		
		model.addAttribute("expense", expenseService.findOne(id));
		
		return "view.jsp";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		expenseService.delete(id);
		return "redirect:/expenses";
	}


}
