package com.codingdojo.projectmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.User;
//.. imports .. //

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
 
List<Project> findAll();

Project findByIdIs(Long id);

List<Project> findAllByUsers(User user);

List<Project> findByUsersNotContains(User user);
}

