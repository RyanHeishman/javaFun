package com.codingdojo.projectmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.Task;
import com.codingdojo.projectmanager.models.User;
//.. imports .. //

@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
 
List<Task> findAll();

Project findByIdIs(Long id);

}
