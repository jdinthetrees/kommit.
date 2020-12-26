package com.johndang.springproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johndang.springproject.models.Comment;

import com.johndang.springproject.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	
	public List<Comment> findAllComments() {
		return commentRepository.findAll();
	}
	
	public void createComment(Comment comment) {
		commentRepository.save(comment);
	}
}