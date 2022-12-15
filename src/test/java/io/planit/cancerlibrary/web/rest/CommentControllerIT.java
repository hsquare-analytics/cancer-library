package io.planit.cancerlibrary.web.rest;


import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Comment;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.CommentRepository;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class CommentControllerIT {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restCommentMockMvc;

    private Comment comment;

    private Category category;

    private static final String ENTITY_API_URL = "/api/comments";

    @BeforeEach
    public void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic);
        categoryRepository.saveAndFlush(category);

        comment = CommentResourceIT.createEntity(em, category);
    }

    @Test
    @Transactional
    void test_fetch_comment_by_category_id_and_row_id() throws Exception {
        commentRepository.saveAndFlush(comment);

        restCommentMockMvc
            .perform(get(ENTITY_API_URL + "/categories/{categoryId}/rows/{rowId}", comment.getCategory().getId(), comment.getRowId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(comment.getId().intValue()))
            .andExpect(jsonPath("$.ptNo").value(comment.getPtNo()))
            .andExpect(jsonPath("$.rowId").value(comment.getRowId()))
            .andExpect(jsonPath("$.comment").value(comment.getComment()))
            .andExpect(jsonPath("$.category.id").value(comment.getCategory().getId().intValue()));
        ;
    }
}
