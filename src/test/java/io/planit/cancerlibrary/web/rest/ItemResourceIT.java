package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.domain.*;
import io.planit.cancerlibrary.domain.embedded.ItemAttribute;
import io.planit.cancerlibrary.domain.embedded.ItemProperty;
import io.planit.cancerlibrary.repository.*;
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
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for the {@link ItemResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
public class ItemResourceIT {

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final Boolean DEFAULT_ACTIVATED = true;
    private static final Boolean UPDATED_ACTIVATED = false;

    private static final Integer DEFAULT_ORDER_NO = 1;
    private static final Integer UPDATED_ORDER_NO = 2;

    private static final String ENTITY_API_URL = "/api/items";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static final ItemAttribute DEFAULT_ITEM_ATTRIBUTE = new ItemAttribute().dataType("string").caption("AAAAAAAAAA").required(true).format("AAAAAAAAAA").maxLength(1).allowEditing(true);
    private static final ItemAttribute UPDATED_ITEM_ATTRIBUTE = new ItemAttribute().dataType("number").caption("BBBBBBBBBB").required(false).format("BBBBBBBBBB").maxLength(2).allowEditing(false);

    private static final ItemProperty DEFAULT_ITEM_PROPERTY = new ItemProperty().sortIndex(1).sortDirection("AAAAAAAAAA").visible(true).labelColumn("AAAAAAAAAA").cssClass("AAAAAAAAAA");
    private static final ItemProperty UPDATED_ITEM_PROPERTY = new ItemProperty().sortIndex(2).sortDirection("BBBBBBBBBB").visible(false).labelColumn("BBBBBBBBBB").cssClass("BBBBBBBBBB");

    private static final Random random = new Random();
    private static final AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private DataTypeRepository dataTypeRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restItemMockMvc;

    private Category category;

    private Item item;

    public static Item createEntity(EntityManager em, Category category) {
        return new Item().title(DEFAULT_TITLE).description(DEFAULT_DESCRIPTION).activated(DEFAULT_ACTIVATED)
            .orderNo(DEFAULT_ORDER_NO).category(category).property(DEFAULT_ITEM_PROPERTY)
            .attribute(DEFAULT_ITEM_ATTRIBUTE);
    }

    public static Item createUpdatedEntity(EntityManager em, Category category) {
        return new Item().title(UPDATED_TITLE).description(UPDATED_DESCRIPTION).activated(UPDATED_ACTIVATED)
            .orderNo(UPDATED_ORDER_NO).category(category).property(UPDATED_ITEM_PROPERTY)
            .attribute(UPDATED_ITEM_ATTRIBUTE);
    }

    @BeforeEach
    public void initTest() {
        Subject subject = SubjectResourceIT.createEntity(em);
        subjectRepository.saveAndFlush(subject);
        Topic topic = TopicResourceIT.createEntity(em, subject);
        topicRepository.saveAndFlush(topic);
        category = CategoryResourceIT.createEntity(em, topic);
        categoryRepository.saveAndFlush(category);

        dataTypeRepository.save(new DataType().name("string"));
        dataTypeRepository.save(new DataType().name("number"));
        item = createEntity(em, category);
    }

    @Test
    @Transactional
    void createItem() throws Exception {
        int databaseSizeBeforeCreate = itemRepository.findAll().size();

        restItemMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(item)))
            .andExpect(status().isCreated());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeCreate + 1);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testItem.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
        assertThat(testItem.getActivated()).isEqualTo(DEFAULT_ACTIVATED);
        assertThat(testItem.getOrderNo()).isEqualTo(DEFAULT_ORDER_NO);
        assertThat(testItem.getAttribute().getDataType()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.getDataType());
        assertThat(testItem.getAttribute().getCaption()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.getCaption());
        assertThat(testItem.getAttribute().isRequired()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.isRequired());
        assertThat(testItem.getAttribute().getFormat()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.getFormat());
        assertThat(testItem.getAttribute().getMaxLength()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.getMaxLength());
        assertThat(testItem.getAttribute().isAllowEditing()).isEqualTo(DEFAULT_ITEM_ATTRIBUTE.isAllowEditing());
        assertThat(testItem.getProperty().getSortIndex()).isEqualTo(DEFAULT_ITEM_PROPERTY.getSortIndex());
        assertThat(testItem.getProperty().getSortDirection()).isEqualTo(DEFAULT_ITEM_PROPERTY.getSortDirection());
        assertThat(testItem.getProperty().isVisible()).isEqualTo(DEFAULT_ITEM_PROPERTY.isVisible());
        assertThat(testItem.getProperty().getLabelColumn()).isEqualTo(DEFAULT_ITEM_PROPERTY.getLabelColumn());
        assertThat(testItem.getProperty().getCssClass()).isEqualTo(DEFAULT_ITEM_PROPERTY.getCssClass());
    }


    @Test
    @Transactional
    void createItemWithExistingId() throws Exception {
        item.setId(1L);

        int databaseSizeBeforeCreate = itemRepository.findAll().size();

        restItemMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(item)))
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = itemRepository.findAll().size();
        item.setTitle(null);

        restItemMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(item)))
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllItems() throws Exception {
        itemRepository.saveAndFlush(item);

        restItemMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(item.getId().intValue())))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
            .andExpect(jsonPath("$.[*].orderNo").value(hasItem(DEFAULT_ORDER_NO)))
            .andExpect(jsonPath("$.[*].attribute.caption").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.getCaption())))
            .andExpect(jsonPath("$.[*].attribute.required").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.isRequired())))
            .andExpect(jsonPath("$.[*].attribute.format").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.getFormat())))
            .andExpect(jsonPath("$.[*].attribute.dataType").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.getDataType())))
            .andExpect(jsonPath("$.[*].attribute.maxLength").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.getMaxLength())))
            .andExpect(jsonPath("$.[*].attribute.allowEditing").value(hasItem(DEFAULT_ITEM_ATTRIBUTE.isAllowEditing())))
            .andExpect(jsonPath("$.[*].property.sortIndex").value(hasItem(DEFAULT_ITEM_PROPERTY.getSortIndex())))
            .andExpect(jsonPath("$.[*].property.sortDirection").value(hasItem(DEFAULT_ITEM_PROPERTY.getSortDirection())))
            .andExpect(jsonPath("$.[*].property.visible").value(hasItem(DEFAULT_ITEM_PROPERTY.isVisible())))
            .andExpect(jsonPath("$.[*].property.labelColumn").value(hasItem(DEFAULT_ITEM_PROPERTY.getLabelColumn())))
            .andExpect(jsonPath("$.[*].property.cssClass").value(hasItem(DEFAULT_ITEM_PROPERTY.getCssClass())));
    }

    @Test
    @Transactional
    void getItem() throws Exception {
        itemRepository.saveAndFlush(item);

        restItemMockMvc
            .perform(get(ENTITY_API_URL_ID, item.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(item.getId().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION))
            .andExpect(jsonPath("$.orderNo").value(DEFAULT_ORDER_NO))
            .andExpect(jsonPath("$.attribute.caption").value(DEFAULT_ITEM_ATTRIBUTE.getCaption()))
            .andExpect(jsonPath("$.attribute.required").value(DEFAULT_ITEM_ATTRIBUTE.isRequired()))
            .andExpect(jsonPath("$.attribute.format").value(DEFAULT_ITEM_ATTRIBUTE.getFormat()))
            .andExpect(jsonPath("$.attribute.dataType").value(DEFAULT_ITEM_ATTRIBUTE.getDataType()))
            .andExpect(jsonPath("$.attribute.maxLength").value(DEFAULT_ITEM_ATTRIBUTE.getMaxLength()))
            .andExpect(jsonPath("$.attribute.allowEditing").value(DEFAULT_ITEM_ATTRIBUTE.isAllowEditing()))
            .andExpect(jsonPath("$.property.sortIndex").value(DEFAULT_ITEM_PROPERTY.getSortIndex()))
            .andExpect(jsonPath("$.property.sortDirection").value(DEFAULT_ITEM_PROPERTY.getSortDirection()))
            .andExpect(jsonPath("$.property.visible").value(DEFAULT_ITEM_PROPERTY.isVisible()))
            .andExpect(jsonPath("$.property.labelColumn").value(DEFAULT_ITEM_PROPERTY.getLabelColumn()))
            .andExpect(jsonPath("$.property.cssClass").value(DEFAULT_ITEM_PROPERTY.getCssClass()));

    }

    @Test
    @Transactional
    void getNonExistingItem() throws Exception {
        restItemMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewItem() throws Exception {
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeUpdate = itemRepository.findAll().size();

        Item updatedItem = itemRepository.findById(item.getId())
            .orElseThrow(() -> new RuntimeException("Item not found"));
        em.detach(updatedItem);
        updatedItem.title(UPDATED_TITLE).orderNo(UPDATED_ORDER_NO).property(UPDATED_ITEM_PROPERTY)
            .attribute(UPDATED_ITEM_ATTRIBUTE);

        restItemMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedItem.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedItem))
            )
            .andExpect(status().isOk());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testItem.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);
        assertThat(testItem.getAttribute().getCaption()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.getCaption());
        assertThat(testItem.getAttribute().isRequired()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.isRequired());
        assertThat(testItem.getAttribute().getFormat()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.getFormat());
        assertThat(testItem.getAttribute().getDataType()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.getDataType());
        assertThat(testItem.getAttribute().getMaxLength()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.getMaxLength());
        assertThat(testItem.getAttribute().isAllowEditing()).isEqualTo(UPDATED_ITEM_ATTRIBUTE.isAllowEditing());
        assertThat(testItem.getProperty().getSortIndex()).isEqualTo(UPDATED_ITEM_PROPERTY.getSortIndex());
        assertThat(testItem.getProperty().getSortDirection()).isEqualTo(UPDATED_ITEM_PROPERTY.getSortDirection());
        assertThat(testItem.getProperty().isVisible()).isEqualTo(UPDATED_ITEM_PROPERTY.isVisible());
        assertThat(testItem.getProperty().getLabelColumn()).isEqualTo(UPDATED_ITEM_PROPERTY.getLabelColumn());
        assertThat(testItem.getProperty().getCssClass()).isEqualTo(UPDATED_ITEM_PROPERTY.getCssClass());
    }


    @Test
    @Transactional
    void putNonExistingItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(
                put(ENTITY_API_URL_ID, item.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(item))
            )
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(item))
            )
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(item)))
            .andExpect(status().isMethodNotAllowed());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateItemWithPatch() throws Exception {
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeUpdate = itemRepository.findAll().size();

        Item partialUpdatedItem = new Item();
        partialUpdatedItem.setId(item.getId());

        partialUpdatedItem.orderNo(UPDATED_ORDER_NO);

        restItemMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedItem.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedItem))
            )
            .andExpect(status().isOk());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testItem.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);

    }

    @Test
    @Transactional
    void fullUpdateItemWithPatch() throws Exception {
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeUpdate = itemRepository.findAll().size();

        Item partialUpdatedItem = new Item();
        partialUpdatedItem.setId(item.getId());

        partialUpdatedItem.title(UPDATED_TITLE).orderNo(UPDATED_ORDER_NO);

        restItemMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedItem.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedItem))
            )
            .andExpect(status().isOk());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
        Item testItem = itemList.get(itemList.size() - 1);
        assertThat(testItem.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testItem.getOrderNo()).isEqualTo(UPDATED_ORDER_NO);
    }

    @Test
    @Transactional
    void patchNonExistingItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, item.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(item))
            )
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(item))
            )
            .andExpect(status().isBadRequest());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamItem() throws Exception {
        int databaseSizeBeforeUpdate = itemRepository.findAll().size();
        item.setId(count.incrementAndGet());

        restItemMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json")
                .content(TestUtil.convertObjectToJsonBytes(item)))
            .andExpect(status().isMethodNotAllowed());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteItem() throws Exception {
        itemRepository.saveAndFlush(item);

        int databaseSizeBeforeDelete = itemRepository.findAll().size();

        restItemMockMvc
            .perform(delete(ENTITY_API_URL_ID, item.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        List<Item> itemList = itemRepository.findAll();
        assertThat(itemList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
