package fitnesscastle.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import fitnesscastle.models.Program;
import fitnesscastle.models.Role;
import fitnesscastle.models.User;
import fitnesscastle.repositories.RoleRepository;
import fitnesscastle.repositories.UserRepository;

@Service
public class UserService {
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public UserService(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	// 1
	public void saveWithUserRole(User user, String image) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName("ROLE_USER"));
		user.setImage(image);
		userRepository.save(user);
	}

	// 2
	public void saveUserWithAdminRole(User user, String image) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
		user.setImage(image);
		userRepository.save(user);
	}

	// 3
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findUserById(Long id) {
		Optional<User> u = userRepository.findById(id);
		if (u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}

	public User updateuser(User user, String image) {
		User user1 = userRepository.findById(user.getId()).orElse(null);
		assert user1 != null;
		user1.setFirstName(user.getFirstName());
		user1.setLastName(user.getLastName());
		user1.setEmail(user.getEmail());
		if (image != null) {
			user1.setImage(image);
		}

		return userRepository.save(user1);
	}

	public void subscribeToProgram(String userEmail, Program program) {
		User loggedUser = this.findByEmail(userEmail);

		loggedUser.setSubscribedProgram(program);
		userRepository.save(loggedUser);
	}

	public void addInfoToUser(User loggedUser, double age, double height, Float weight) {
		loggedUser.setAge(age);
		loggedUser.setHeight(height);
		loggedUser.setWeight(weight);
		double bmi = weight / (Math.pow((height / 100), 2));
		loggedUser.setBmi(bmi);
		userRepository.save(loggedUser);
	}

	public List<User> allUsers() {
		return userRepository.findAll();

	}

	public void makeAdmin(Long id) {
		User user = this.findUserById(id);
		List<Role> adminRole = roleRepository.findByName("ROLE_ADMIN");
		user.setRoles(adminRole);
		userRepository.save(user);
	}

}
