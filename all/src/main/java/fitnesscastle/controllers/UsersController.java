package fitnesscastle.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fitnesscastle.models.User;
import fitnesscastle.services.CloudinaryService;
import fitnesscastle.services.UserService;
import fitnesscastle.validator.UserValidator;

//.. don't forget to inlcude all your imports! ..

@Controller
public class UsersController {

	@Autowired
	private UserService userService;

	@Autowired
	private CloudinaryService cloudinaryService;

	@Autowired
	private UserValidator userValidator;

	@GetMapping("/")
	public String redirect() {
		return "redirect:/login";
	}

	@GetMapping("/registration")
	public String registerForm(@Valid @ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}

	@PostMapping("/registration")
	public String registration(@RequestParam("file") MultipartFile file, @Valid @ModelAttribute("user") User user,
			BindingResult result, Model model, RedirectAttributes ra) {
		userValidator.validate(user, result);
		List<User> allUsers = userService.allUsers();
		if (result.hasErrors()) {
			return "registrationPage.jsp";
		}
		String url = null;
		if (!file.isEmpty()) {
			url = cloudinaryService.uploadFile(file);
		}
		if (allUsers.size() == 0) {
			userService.saveUserWithAdminRole(user, url);
		} else {
			userService.saveWithUserRole(user, url);
		}
		ra.addFlashAttribute("registerSuccess", "Registration successful! Login in below!");
		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}
		return "loginPage.jsp";
	}

	@RequestMapping("/users/{id}")
	public String login(@PathVariable("id") Long id, Model model, Principal principal, RedirectAttributes ra,
			HttpServletRequest request) {
		User loggedUser = userService.findByEmail(principal.getName());
		User thisUser = userService.findUserById(id);
		if (loggedUser.getId() == id || request.isUserInRole("ROLE_ADMIN")) {
			model.addAttribute("thisUser", thisUser);
			model.addAttribute("loggedUser", loggedUser);
			return "profilePage.jsp";
		} else {
			ra.addFlashAttribute("error", "Not authorized!");
			return "redirect:/programs";
		}

	}

	@GetMapping("/info")
	public String index(Model model, Principal principal) {
		User loggedUser = userService.findByEmail(principal.getName());

		model.addAttribute("loggedUser", loggedUser);
		return "info.jsp";
	}

	@PostMapping("/users/add_info")
	public String addInfo(@RequestParam("age") Double age, @RequestParam("height") Double height,
			@RequestParam("weight") Float weight, Principal principal, RedirectAttributes redirectAttributes) {

		if (age < 18 || height < 50 || weight < 30) {
			if (age < 18) {
				redirectAttributes.addFlashAttribute("ageError", "Age must be at least 18 years!");

			}
			if (height < 50) {
				redirectAttributes.addFlashAttribute("heightError", "Height must be at least 50 cm!");

			}
			if (age < 40) {
				redirectAttributes.addFlashAttribute("weightError", "Weight must be at least 30 kg!");

			}
			return "redirect:/info";
		}

		User loggedUser = userService.findByEmail(principal.getName());
		userService.addInfoToUser(loggedUser, age, height, weight);
		return String.format("redirect:/users/%d", loggedUser.getId());
	}

	@GetMapping("/users/{userId}/edit")
	public String editForm(@PathVariable("userId") Long id, Principal principal, Model model,
			HttpServletRequest request) {
		User loggedUser = userService.findByEmail(principal.getName());
		if (loggedUser.getId() == id || request.isUserInRole("ROLE_ADMIN")) {
			User thisuser = userService.findUserById(id);
			model.addAttribute("user", thisuser);
			model.addAttribute("loggedUser", loggedUser);
			return "editprofile.jsp";
		} else {
			return "redirect/programs";
		}

	}

	@PutMapping("/users/{id}/edit")
	public String update(@RequestParam("file") MultipartFile file, @Valid @ModelAttribute("user") User user,
			BindingResult result, @PathVariable("id") Long id, Model model) {
		if (result.hasErrors()) {
			return "editprofile.jsp";
		}
		String url = null;
		if (!file.isEmpty()) {
			url = cloudinaryService.uploadFile(file);
		}
		userService.updateuser(user, url);
		return String.format("redirect:/users/%d", id);

	}

	@GetMapping("/admin/dashboard")
	public String dashboard(Principal principal, Model model) {
		User loggedUser = userService.findByEmail(principal.getName());
		List<User> allUsers = userService.allUsers();
		model.addAttribute("loggedUser", loggedUser);
		model.addAttribute("allUsers", allUsers);
		return "adminDashboard.jsp";

	}

	@PutMapping("/users/{id}")
	public String admin(@PathVariable("id") Long id) {

		userService.makeAdmin(id);
		return "redirect:/admin/dashboard";

	}

}
