package io.planit.cancerlibrary.service;

import io.planit.cancerlibrary.domain.Category;
import io.planit.cancerlibrary.domain.Item;
import io.planit.cancerlibrary.domain.UserCategory;
import io.planit.cancerlibrary.repository.CategoryRepository;
import io.planit.cancerlibrary.repository.ItemRepository;
import io.planit.cancerlibrary.repository.UserCategoryRepository;
import java.time.Instant;
import java.util.List;
import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SqlBuilderService {

    private Logger log = LoggerFactory.getLogger(SqlBuilderService.class);

    private final CategoryRepository categoryRepository;

    private final ItemRepository itemRepository;

    private final UserCategoryRepository userCategoryRepository;

    public SqlBuilderService(CategoryRepository categoryRepository, ItemRepository itemRepository,
        UserCategoryRepository userCategoryRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.userCategoryRepository = userCategoryRepository;
    }

    public SQL getSelectAllQueryByUserIdAndCategoryId(Long userId, Long categoryId) {
        List<Item> itemList = itemRepository.findAllByGroupCategoryId(categoryId);
        Category category = categoryRepository.findById(categoryId)
            .orElseThrow(() -> new RuntimeException("Category not found"));

        List<UserCategory> userCategories = userCategoryRepository.findAllByUserIdAndAndCategoryIdCurrentTime(userId,
            categoryId, Instant.now());

        SQL result = new SQL() {{
            itemList.forEach(item -> {
                SELECT(item.getTitle().toUpperCase());
            });
            FROM(category.getTitle().toUpperCase());
            userCategories.forEach(userCategory -> {
                WHERE("TERM_START <= " + userCategory.getTermStart());
                WHERE("TERM_END >= " + userCategory.getTermEnd());
            });
        }};
        return result;
    }
}
