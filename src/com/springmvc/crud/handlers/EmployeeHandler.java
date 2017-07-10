package com.springmvc.crud.handlers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.crud.dao.DepartmentDao;
import com.springmvc.crud.dao.EmployeeDao;
import com.springmvc.crud.entities.Employee;

@Controller
public class EmployeeHandler {

	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private DepartmentDao departmentDao;

	@ModelAttribute
	public void getEmployee(@RequestParam(value = "id", required = false) Integer id, Map<String, Object> map) {
		if (id != null) {
			map.put("employee", employeeDao.get(id));
		}
	}

	@RequestMapping(value = "/emp", method = RequestMethod.PUT)
	public String update(Employee employee) {
		employeeDao.save(employee);
		return "redirect:/emps";
	}

	@RequestMapping(value = "emp/{id}", method = RequestMethod.GET)
	public String input(@PathVariable(value = "id") Integer id, Map<String, Object> map) {
		map.put("employee", employeeDao.get(id));
		map.put("departments", departmentDao.getDepartments());
		return "input";
	}

	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id) {
		employeeDao.delete(id);
		return "redirect:/emps";
	}

	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public String save(@Valid Employee employee, BindingResult result, Map<String, Object> map) {
		System.out.println("save: " + employee);
		if (result.getErrorCount() > 0) {
			System.out.println("出错了！");
			for (FieldError error : result.getFieldErrors()) {
				System.out.println(error.getField() + ":" + error.getDefaultMessage());
			}
			map.put("departments", departmentDao.getDepartments());
			return "input";
		}
		employeeDao.save(employee);
		return "redirect:/emps";
	}

	@RequestMapping(value = "/emp", method = RequestMethod.GET)
	public String input(Map<String, Object> map) {
		map.put("departments", departmentDao.getDepartments());
		map.put("employee", new Employee()); // 不需要表单回显，故新建个对象
		// Map<String,String> genders = new HashMap<>();
		// genders.put("1","Male");
		// genders.put("0","Female");
		// map.put("genders", genders);
		return "input";
	}

	@RequestMapping("/emps")
	public String list(Map<String, Object> map) {
		map.put("employees", employeeDao.getAll());
		return "list";
	}

	// @InitBinder
	// public void initBinder(WebDataBinder webDataBinder){
	// webDataBinder.setDisallowedFields("lastName"); //不进行赋值
	// }
}
