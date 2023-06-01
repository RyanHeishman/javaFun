package com.codingdojo.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.studentroster.models.Student;
import com.codingdojo.studentroster.repositories.StudentRepository;

@Service
public class StudentService {
    // adding the book repository as a dependency
    private final StudentRepository studentRepository;
    
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }
    // returns all the books
    public List<Student> allStudents() {
        return studentRepository.findAll();
    }
    
    public Student createStudent(Student student) {
    	return studentRepository.save(student);
    }
    
    public Student findStudent(Long id) {
		Optional<Student> optionalStudent = studentRepository.findById(id);
		if(optionalStudent.isPresent()) {
			return optionalStudent.get();
		}
		else {
			return null;
		}
	}
    
    public void deleteStudent(Long id) {
		Optional<Student> optionalStudent = studentRepository.findById(id);
		if(optionalStudent.isPresent()) {
			studentRepository.deleteById(id);
		}
    }
}


