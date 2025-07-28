package fitnesscastle.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fitnesscastle.models.Program;
import fitnesscastle.models.User;
import fitnesscastle.services.CloudinaryService;
import fitnesscastle.services.ProgramService;
import fitnesscastle.services.UserService;
//.. don't forget to  all your imports! ..

@Controller
public class ProgramController {

	@Autowired
	private ProgramService programServ;

	@Autowired
	private CloudinaryService cloudinaryService;
	@Autowired
	private UserService userServ;

	@GetMapping("/programs")
	public String index(Model model, Principal principal) {
		List<Program> programs = programServ.allPrograms();
		User loggedUser = userServ.findByEmail(principal.getName());
		model.addAttribute("programs", programs);
		model.addAttribute("loggedUser", loggedUser);
		return "programs.jsp";

	}

	@GetMapping("/programs/{id}/schedule")
	public String schedule(@PathVariable("id") Long id, Model model, Principal principal) {
		Program program = programServ.findProgramById(id);
		User loggedUser = userServ.findByEmail(principal.getName());
		model.addAttribute("program", program);
		model.addAttribute("loggedUser", loggedUser);
		return "Schedule.jsp";

	}

	@GetMapping("/exercises")
	public String exercises(Model model, Principal principal) {
		User loggedUser = userServ.findByEmail(principal.getName());
		model.addAttribute("loggedUser", loggedUser);
		return "Exercises.jsp";

	}

	@GetMapping("/admin/programs/new")
	public String renderNewForm(@ModelAttribute("newProgram") Program newProject, Model model, Principal principal) {
		User loggedUser = userServ.findByEmail(principal.getName());
		model.addAttribute("loggedUser", loggedUser);
		return "newProgram.jsp";

	}

	@PostMapping("/admin/programs")
	public String createProgram(@RequestParam("file") MultipartFile file,
			@Valid @ModelAttribute("newProgram") Program newProgram, BindingResult result, Model model,
			Principal principal) {
		if (result.hasErrors()) {
			return "newProgram.jsp";
		} else {
			String url = null;
			if (!file.isEmpty()) {
				url = cloudinaryService.uploadFile(file);
			}
			String email = principal.getName();
			programServ.createProgram(email, newProgram, url);
			return "redirect:/programs";
		}

	}

	@PutMapping("/programs/{id}/subscribe")
	public String subscribe(@PathVariable("id") Long id, Principal principal, HttpServletRequest request) {
		if (request.isUserInRole("ROLE_USER")) {
			Program program = programServ.findProgramById(id);
			String email = principal.getName();
			userServ.subscribeToProgram(email, program);

		}
		return String.format("redirect:/programs/%d/schedule", id);
	}

	@GetMapping("/aboutus")
	public String aboutus(Model model, Principal principal) {

		if (principal != null) {
			User loggedUser = userServ.findByEmail(principal.getName());
			model.addAttribute("loggedUser", loggedUser);
		}

		return "aboutus.jsp";

	}

	@GetMapping("/admin/{programsid}/edit")
	public String editprog(@PathVariable("programsid") Long id, Principal principal, Model model,
			HttpServletRequest request) {
		User loggedUser = userServ.findByEmail(principal.getName());
		if (loggedUser.getId() == id || request.isUserInRole("ROLE_ADMIN")) {
			Program thisprog = programServ.findProgramById(id);
			model.addAttribute("program", thisprog);
			model.addAttribute("loggedUser", loggedUser);

			return "editprog.jsp";
		} else {
			return "redirect/";
		}

	}

	@PutMapping("/admin/{id}/edit")
	public String update(@RequestParam("file") MultipartFile file, @Valid @ModelAttribute("prog") Program program,
			BindingResult result, @PathVariable("id") Long id, Model model) {
		if (result.hasErrors()) {
			return "editprog.jsp";
		}
		String url = null;
		if (!file.isEmpty()) {
			url = cloudinaryService.uploadFile(file);
		}
		programServ.updateprog(program, url);
		return "redirect:/admin/dashboard";

	}

	@DeleteMapping("/programs/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		programServ.deleteProgam(id);
		return "redirect:/admin/dashboard";
	}

}
