package fitnesscastle.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitnesscastle.models.Program;
import fitnesscastle.models.User;
import fitnesscastle.repositories.ProgramRepository;

@Service
public class ProgramService {

	@Autowired
	private ProgramRepository programRepo;

	@Autowired
	private UserService userServ;

	public void createProgram(String userEmail, Program newProgram, String imageUrl) {
		User user = userServ.findByEmail(userEmail);
		newProgram.setCreator(user);
		newProgram.setImage(imageUrl);
		programRepo.save(newProgram);

	}

	public Program findProgramById(Long id) {
		Optional<Program> p = programRepo.findById(id);
		if (p.isPresent()) {
			return p.get();
		} else {
			return null;
		}
	}

	public List<Program> allPrograms() {
		return programRepo.findAll();
	}

	public Program updateprog(Program program, String image) {
		Program prog1 = this.findProgramById(program.getId());
		assert prog1 != null;
		prog1.setName(program.getName());
		prog1.setDescription(program.getDescription());
		prog1.setDay1(program.getDay1());
		prog1.setDay2(program.getDay2());
		prog1.setDay3(program.getDay3());
		prog1.setDay4(program.getDay4());
		prog1.setDay5(program.getDay5());
		prog1.setDay6(program.getDay6());
		prog1.setDay7(program.getDay7());
		prog1.setCategory(program.getCategory());
		prog1.setCreator(program.getCreator());
		prog1.setImage(program.getImage());
		prog1.setMinBmi(program.getMinBmi());
		prog1.setMaxBmi(program.getMaxBmi());

		if (image != null) {
			prog1.setImage(image);
		}

		return programRepo.save(prog1);
	}

	public void deleteProgam(Long id) {
		Program program = this.findProgramById(id);
		programRepo.delete(program);

	}

}