package fitnesscastle.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "programs")
public class Program {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message = "Name is required!")
	@Size(min = 2, message = "Name must be at least 2 characters!")
	private String name;

	@NotNull(message = "Description is required!")
	@Size(min = 10, message = "Description must be at least 10 characters!")
	private String description;

	@NotNull(message = "Day 1 details are required!")
	@Size(min = 10, message = "Day 1 details must be at least 10 characters!")
	private String day1;

	@NotNull(message = "Day 2 details are required!")
	@Size(min = 10, message = "Day 2 details must be at least 10 characters!")
	private String day2;

	@NotNull(message = "Day 3 details are required!")
	@Size(min = 10, message = "Day 3 details must be at least 10 characters!")
	private String day3;

	@NotNull(message = "Day 4 details are required!")
	@Size(min = 10, message = "Day 4 details must be at least 10 characters!")
	private String day4;

	@NotNull(message = "Day 5 details are required!")
	@Size(min = 10, message = "Day 5 details must be at least 10 characters!")
	private String day5;

	@NotNull(message = "Day 6 details are required!")
	@Size(min = 10, message = "Day 6 details must be at least 10 characters!")
	private String day6;

	@NotNull(message = "Day 7 details are required!")
	@Size(min = 10, message = "Day 7 details must be at least 10 characters!")
	private String day7;

	private String image;

	@NotNull(message = "Minimum bmi is required!")
	@Range(min = 10, max = 60, message = "Please enter a valid bmi!")
	double minBmi;

	@NotNull(message = "Maximum bmi is required!")
	@Range(min = 10, max = 60, message = "Please enter a valid bmi!")
	double maxBmi;

	@NotEmpty(message = "Category is required!")
	private String category;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "creator_id")
	private User creator;

	@OneToMany(mappedBy = "subscribedProgram", fetch = FetchType.LAZY)
	private List<User> subscribers;

	public Program() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDay1() {
		return day1;
	}

	public void setDay1(String day1) {
		this.day1 = day1;
	}

	public String getDay2() {
		return day2;
	}

	public void setDay2(String day2) {
		this.day2 = day2;
	}

	public String getDay3() {
		return day3;
	}

	public void setDay3(String day3) {
		this.day3 = day3;
	}

	public String getDay4() {
		return day4;
	}

	public void setDay4(String day4) {
		this.day4 = day4;
	}

	public String getDay5() {
		return day5;
	}

	public void setDay5(String day5) {
		this.day5 = day5;
	}

	public String getDay6() {
		return day6;
	}

	public void setDay6(String day6) {
		this.day6 = day6;
	}

	public String getDay7() {
		return day7;
	}

	public void setDay7(String day7) {
		this.day7 = day7;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public List<User> getSubscribers() {
		return subscribers;
	}

	public void setSubscribers(List<User> subscribers) {
		this.subscribers = subscribers;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
	
	public double getMinBmi() {
		return minBmi;
	}

	public void setMinBmi(double minBmi) {
		this.minBmi = minBmi;
	}

	public double getMaxBmi() {
		return maxBmi;
	}

	public void setMaxBmi(double maxBmi) {
		this.maxBmi = maxBmi;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
