package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.Subject;
import io.planit.cancerlibrary.domain.Topic;
import io.planit.cancerlibrary.repository.SubjectRepository;
import io.planit.cancerlibrary.repository.TopicRepository;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class TopicResourceIT {

    private static final Integer DEFAULT_ORDER_NO = 1;
    private static final Integer UPDATED_ORDER_NO = 2;

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final boolean DEFAULT_ACTIVATED = true;
    private static final boolean UPDATED_ACTIVATED = false;

    private static final String ENTITY_API_URL = "/api/topics";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restTopicMockMvc;

    private Topic topic;

    private Subject subject;

    public static Topic createEntity(EntityManager em, Subject subject) {
        Topic topic = new Topic().orderNo(DEFAULT_ORDER_NO).title(DEFAULT_TITLE).activated(DEFAULT_ACTIVATED).subject(subject);
        return topic;
    }

    public static Topic createUpdatedEntity(EntityManager em, Subject subject) {
        Topic topic = new Topic().orderNo(UPDATED_ORDER_NO).title(UPDATED_TITLE).activated(UPDATED_ACTIVATED).subject(subject);
        return topic;
    }

    @BeforeEach
    public void initTest() {
        subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);
        topic = createEntity(em, subject);
    }

    @Test
    @Transactional
    void createTopic() throws Exception {
        int databaseSizeBeforeCreate = topicRepository.findAll().size();
        restTopicMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isCreated());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeCreate + 1);
        Topic testTopic = topicList.get(topicList.size() - 1);
        assertThat(testTopic.getOrderNo()).isEqualTo(DEFAULT_ORDER_NO);
        assertThat(testTopic.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testTopic.getActivated()).isEqualTo(DEFAULT_ACTIVATED);
        assertThat(testTopic.getSubject().getId()).isEqualTo(subject.getId());
    }

    @Test
    @Transactional
    void createTopicWithExistingId() throws Exception {
        topic.setId(1L);

        int databaseSizeBeforeCreate = topicRepository.findAll().size();

        restTopicMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void createTopicWithNonExistSubject() throws Exception {
        int databaseSizeBeforeCreate = topicRepository.findAll().size();
        topic.setSubject(null);

        restTopicMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = topicRepository.findAll().size();
        topic.setTitle(null);

        restTopicMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllTopics() throws Exception {
        topicRepository.saveAndFlush(topic);

        restTopicMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(topic.getId().intValue())))
            .andExpect(jsonPath("$.[*].orderNo").value(hasItem(DEFAULT_ORDER_NO)))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].activated").value(hasItem(DEFAULT_ACTIVATED)))
            .andExpect(jsonPath("$.[*].subject.id").value(hasItem(topic.getSubject().getId().intValue())));
    }

    @Test
    @Transactional
    void getTopic() throws Exception {
        topicRepository.saveAndFlush(topic);

        restTopicMockMvc
            .perform(get(ENTITY_API_URL_ID, topic.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(topic.getId().intValue()))
            .andExpect(jsonPath("$.orderNo").value(topic.getOrderNo().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.activated").value(DEFAULT_ACTIVATED))
            .andExpect(jsonPath("$.subject.id").value(topic.getSubject().getId().intValue()));
        ;
    }

    @Test
    @Transactional
    void getNonExistingTopic() throws Exception {
        // Get the topic
        restTopicMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewTopic() throws Exception {
        topicRepository.saveAndFlush(topic);

        int databaseSizeBeforeUpdate = topicRepository.findAll().size();

        Topic updatedTopic = topicRepository.findById(topic.getId()).get();
        Subject updatedSubject = SubjectResourceIT.createUpdatedEntity(em);
        subjectRepository.saveAndFlush(updatedSubject);
        em.detach(updatedTopic);
        updatedTopic.orderNo(UPDATED_ORDER_NO).title(UPDATED_TITLE).activated(UPDATED_ACTIVATED).subject(updatedSubject);

        restTopicMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedTopic.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedTopic))
            )
            .andExpect(status().isOk());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
        Topic testTopic = topicList.get(topicList.size() - 1);
        assertThat(testTopic.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);
        assertThat(testTopic.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testTopic.getActivated()).isEqualTo(UPDATED_ACTIVATED);
        assertThat(testTopic.getSubject().getId()).isEqualTo(updatedSubject.getId());
    }

    @Test
    @Transactional
    void putNonExistingTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(
                put(ENTITY_API_URL_ID, topic.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(topic))
            )
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(topic))
            )
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isMethodNotAllowed());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateTopicWithPatch() throws Exception {
        topicRepository.saveAndFlush(topic);

        int databaseSizeBeforeUpdate = topicRepository.findAll().size();

        Topic partialUpdatedTopic = new Topic();
        partialUpdatedTopic.setId(topic.getId());

        partialUpdatedTopic.activated(UPDATED_ACTIVATED);

        restTopicMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedTopic.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedTopic))
            )
            .andExpect(status().isOk());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
        Topic testTopic = topicList.get(topicList.size() - 1);
        assertThat(testTopic.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testTopic.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void fullUpdateTopicWithPatch() throws Exception {
        topicRepository.saveAndFlush(topic);

        int databaseSizeBeforeUpdate = topicRepository.findAll().size();

        Topic partialUpdatedTopic = new Topic();
        partialUpdatedTopic.setId(topic.getId());

        partialUpdatedTopic.title(UPDATED_TITLE).activated(UPDATED_ACTIVATED);

        restTopicMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedTopic.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedTopic))
            )
            .andExpect(status().isOk());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
        Topic testTopic = topicList.get(topicList.size() - 1);
        assertThat(testTopic.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testTopic.getActivated()).isEqualTo(UPDATED_ACTIVATED);
    }

    @Test
    @Transactional
    void patchNonExistingTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, topic.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(topic))
            )
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(topic))
            )
            .andExpect(status().isBadRequest());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamTopic() throws Exception {
        int databaseSizeBeforeUpdate = topicRepository.findAll().size();
        topic.setId(count.incrementAndGet());

        restTopicMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(topic)))
            .andExpect(status().isMethodNotAllowed());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteTopic() throws Exception {
        topicRepository.saveAndFlush(topic);

        int databaseSizeBeforeDelete = topicRepository.findAll().size();

        restTopicMockMvc
            .perform(delete(ENTITY_API_URL_ID, topic.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        List<Topic> topicList = topicRepository.findAll();
        assertThat(topicList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
