package fitnesscastle.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fitnesscastle.models.User;
import fitnesscastle.services.UserService;

@Component
public class UserValidator implements Validator {

	@Autowired
	private UserService userService;

	// 1
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	// 2
	@Override
	public void validate(Object object, Errors errors) {
		User user = (User) object;
		User possibleUser = userService.findByEmail(user.getEmail());
		if (possibleUser != null) {
			errors.rejectValue("email", "Unique");
		}
		if (!user.getConfirm().equals(user.getPassword())) {
			// 3
			errors.rejectValue("confirm", "Match");
		}

	}
}
