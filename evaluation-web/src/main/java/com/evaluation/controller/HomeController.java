package com.evaluation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@GetMapping(path = { "/", "/home" })
	public String home() {
		return "home";
	}
	
	@GetMapping(path = { "/get-winning-numbers" }, produces= { "application/json;charset=utf-8" })
	@ResponseBody
	public String getWinningNumbers() {
		
		int[] numbers = new int[6];
		int average = 0;
		
		while (true) {
		
			for (int i = 0; i < numbers.length; i++) {
				numbers[i] = (int)(Math.random() * 45) + 1;
				for (int j = 0; j < i; j++) {
					if (numbers[i] == numbers[j]) {
						i = -1;
						break;
					}
				}
			}
			
			int sum = 0;
			for (int number : numbers) {
				sum += number;
			}
			average = sum / numbers.length;
			
			if (average > 20 && average < 26) {
				break;
			}
		}
		
		StringBuilder result = new StringBuilder();
		result.append("[");
		for (int number : numbers) {
			result.append(String.valueOf(number));
			result.append(",");
		}
		result.append(average);
		result.append("]");
		return result.toString();
	}
	
}
