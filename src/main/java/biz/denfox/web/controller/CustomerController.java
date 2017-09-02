package biz.denfox.web.controller;

import biz.denfox.web.entity.Customer;
import biz.denfox.web.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    private CustomerService customerService;

    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/list")
    public String customerList(Model model) {

        List<Customer> customerList = customerService.getCustomers();

//        customerList.sort(Comparator.comparing(Customer::getLastName));

        model.addAttribute("customers", customerList);

        return "customer/list";

    }

    @RequestMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {

        model.addAttribute("customer", new Customer());

        return "customer/add";
    }

    @PostMapping("/add")
    public String addCustomer(@ModelAttribute("customer") Customer customer) {

        System.out.println("Adding customer: " + customer);
        customerService.addCustomer(customer);

        return "redirect:/customer/list";
    }

    @RequestMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("id") int id, Model model) {
        model.addAttribute("customer", customerService.getCustomer(id));

        return "customer/update";
    }

    @RequestMapping("/update")
    public String updateCustomer(@ModelAttribute("customer") Customer customer) {

        System.out.println("Update customer: " + customer);

        customerService.updateCustomer(customer);

        return "redirect:/customer/list";
    }

    @RequestMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable("id") int id) {

        customerService.deleteCustomer(id);

        return "redirect:/customer/list";
    }

}
