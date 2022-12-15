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
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
public class CommentResourceIT {

    private static final Integer DEFAULT_ORDER_NO = 1;
    private static final Integer UPDATED_ORDER_NO = 2;

    private static final String DEFAULT_PTNO = "AAAAAAAAAA";
    private static final String UPDATED_PTNO = "BBBBBBBBBB";

    private static final String DEFAULT_ROWID = "AAAAAAAAAA";
    private static final String UPDATED_ROWID = "BBBBBBBBBB";

    private static final String DEFAULT_COMMENT = "AAAAAAAAAA";
    private static final String UPDATED_COMMENT = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/comments";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

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

    public static Comment createEntity(EntityManager em, Category category) {
        Comment comment = new Comment()
            .ptNo(DEFAULT_PTNO).rowId(DEFAULT_ROWID).comment(DEFAULT_COMMENT).category(category);
        return comment;
    }

    public static Comment createUpdatedEntity(EntityManager em, Category category) {
        Comment comment = new Comment()
            .ptNo(DEFAULT_PTNO).rowId(DEFAULT_ROWID).comment(DEFAULT_COMMENT).category(category);
        return comment;
    }

    @BeforeEach
    public void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);

        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);

        category = CategoryResourceIT.createEntity(em, topic);
        categoryRepository.saveAndFlush(category);

        comment = createEntity(em, category);
    }

    @Test
    @Transactional
    void createComment() throws Exception {
        int databaseSizeBeforeCreate = commentRepository.findAll().size();
        restCommentMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(comment)))
            .andExpect(status().isCreated());

        List<Comment> commentList = commentRepository.findAll();
        assertThat(commentList).hasSize(databaseSizeBeforeCreate + 1);
        Comment testComment = commentList.get(commentList.size() - 1);
        assertThat(testComment.getPtNo()).isEqualTo(DEFAULT_PTNO);
        assertThat(testComment.getRowId()).isEqualTo(DEFAULT_ROWID);
        assertThat(testComment.getComment()).isEqualTo(DEFAULT_COMMENT);
        assertThat(testComment.getCategory().getId()).isEqualTo(category.getId());

    }

//    @Test
//    @Transactional
//    void createCommentWithExistingId() throws Exception {
//        comment.setId(1L);
//
//        int databaseSizeBeforeCreate = commentRepository.findAll().size();
//
//        restCommentMockMvc
//            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(comment)))
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeCreate);
//    }
//
//    @Test
//    @Transactional
//    void createCommentWithNonExistSubject() throws Exception {
//        int databaseSizeBeforeCreate = commentRepository.findAll().size();
//        comment.setSubject(null);
//
//        restCommentMockMvc
//            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(comment)))
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeCreate);
//    }
//
//    @Test
//    @Transactional
//    void checkNameIsRequired() throws Exception {
//        int databaseSizeBeforeTest = commentRepository.findAll().size();
//        comment.setTitle(null);
//
//        restCommentMockMvc
//            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(comment)))
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeTest);
//    }
//
//    @Test
//    @Transactional
//    void getAllComments() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        restCommentMockMvc
//            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
//            .andExpect(status().isOk())
//            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
//            .andExpect(jsonPath("$.[*].id").value(hasItem(comment.getId().intValue())))
//            .andExpect(jsonPath("$.[*].orderNo").value(hasItem(DEFAULT_ORDER_NO)))
//            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_PTNO)))
//            .andExpect(jsonPath("$.[*].activated").value(hasItem(DEFAULT_ACTIVATED)))
//            .andExpect(jsonPath("$.[*].subject.id").value(hasItem(comment.getSubject().getId().intValue())));
//    }
//
//    @Test
//    @Transactional
//    void getComment() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        restCommentMockMvc
//            .perform(get(ENTITY_API_URL_ID, comment.getId()))
//            .andExpect(status().isOk())
//            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
//            .andExpect(jsonPath("$.id").value(comment.getId().intValue()))
//            .andExpect(jsonPath("$.orderNo").value(comment.getOrderNo().intValue()))
//            .andExpect(jsonPath("$.title").value(DEFAULT_PTNO))
//            .andExpect(jsonPath("$.activated").value(DEFAULT_ACTIVATED))
//            .andExpect(jsonPath("$.subject.id").value(comment.getSubject().getId().intValue()));
//        ;
//    }
//
//    @Test
//    @Transactional
//    void getNonExistingComment() throws Exception {
//        // Get the comment
//        restCommentMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
//    }
//
//    @Test
//    @Transactional
//    void putNewComment() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//
//        Comment updatedComment = commentRepository.findById(comment.getId()).get();
//        Subject updatedSubject = SubjectResourceIT.createUpdatedEntity(em);
//        subjectRepository.saveAndFlush(updatedSubject);
//        em.detach(updatedComment);
//        updatedComment.orderNo(UPDATED_ORDER_NO).title(UPDATED_PTNO).activated(UPDATED_ACTIVATED).subject(updatedSubject);
//
//        restCommentMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, updatedComment.getId())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(updatedComment))
//            )
//            .andExpect(status().isOk());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//        Comment testComment = commentList.get(commentList.size() - 1);
//        assertThat(testComment.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);
//        assertThat(testComment.getTitle()).isEqualTo(UPDATED_PTNO);
//        assertThat(testComment.getActivated()).isEqualTo(UPDATED_ACTIVATED);
//        assertThat(testComment.getSubject().getId()).isEqualTo(updatedSubject.getId());
//    }
//
//    @Test
//    @Transactional
//    void putNonExistingComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, comment.getId())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(comment))
//            )
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void putWithIdMismatchComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(
//                put(ENTITY_API_URL_ID, count.incrementAndGet())
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .content(TestUtil.convertObjectToJsonBytes(comment))
//            )
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void putWithMissingIdPathParamComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(comment)))
//            .andExpect(status().isMethodNotAllowed());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void partialUpdateCommentWithPatch() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//
//        Comment partialUpdatedComment = new Comment();
//        partialUpdatedComment.setId(comment.getId());
//
//        partialUpdatedComment.activated(UPDATED_ACTIVATED);
//
//        restCommentMockMvc
//            .perform(
//                patch(ENTITY_API_URL_ID, partialUpdatedComment.getId())
//                    .contentType("application/merge-patch+json")
//                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedComment))
//            )
//            .andExpect(status().isOk());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//        Comment testComment = commentList.get(commentList.size() - 1);
//        assertThat(testComment.getTitle()).isEqualTo(DEFAULT_PTNO);
//        assertThat(testComment.getActivated()).isEqualTo(UPDATED_ACTIVATED);
//    }
//
//    @Test
//    @Transactional
//    void fullUpdateCommentWithPatch() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//
//        Comment partialUpdatedComment = new Comment();
//        partialUpdatedComment.setId(comment.getId());
//
//        partialUpdatedComment.title(UPDATED_PTNO).activated(UPDATED_ACTIVATED);
//
//        restCommentMockMvc
//            .perform(
//                patch(ENTITY_API_URL_ID, partialUpdatedComment.getId())
//                    .contentType("application/merge-patch+json")
//                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedComment))
//            )
//            .andExpect(status().isOk());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//        Comment testComment = commentList.get(commentList.size() - 1);
//        assertThat(testComment.getTitle()).isEqualTo(UPDATED_PTNO);
//        assertThat(testComment.getActivated()).isEqualTo(UPDATED_ACTIVATED);
//    }
//
//    @Test
//    @Transactional
//    void patchNonExistingComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(
//                patch(ENTITY_API_URL_ID, comment.getId())
//                    .contentType("application/merge-patch+json")
//                    .content(TestUtil.convertObjectToJsonBytes(comment))
//            )
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void patchWithIdMismatchComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(
//                patch(ENTITY_API_URL_ID, count.incrementAndGet())
//                    .contentType("application/merge-patch+json")
//                    .content(TestUtil.convertObjectToJsonBytes(comment))
//            )
//            .andExpect(status().isBadRequest());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void patchWithMissingIdPathParamComment() throws Exception {
//        int databaseSizeBeforeUpdate = commentRepository.findAll().size();
//        comment.setId(count.incrementAndGet());
//
//        restCommentMockMvc
//            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(comment)))
//            .andExpect(status().isMethodNotAllowed());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeUpdate);
//    }
//
//    @Test
//    @Transactional
//    void deleteComment() throws Exception {
//        commentRepository.saveAndFlush(comment);
//
//        int databaseSizeBeforeDelete = commentRepository.findAll().size();
//
//        restCommentMockMvc
//            .perform(delete(ENTITY_API_URL_ID, comment.getId()).accept(MediaType.APPLICATION_JSON))
//            .andExpect(status().isNoContent());
//
//        List<Comment> commentList = commentRepository.findAll();
//        assertThat(commentList).hasSize(databaseSizeBeforeDelete - 1);
//    }
}
