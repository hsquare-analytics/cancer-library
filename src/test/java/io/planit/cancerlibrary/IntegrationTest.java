package io.planit.cancerlibrary;

import io.planit.cancerlibrary.CancerLibraryApp;
import io.planit.cancerlibrary.config.AsyncSyncConfiguration;
import io.planit.cancerlibrary.config.EmbeddedSQL;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;

/**
 * Base composite annotation for integration tests.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@SpringBootTest(classes = { CancerLibraryApp.class, AsyncSyncConfiguration.class }, properties = "jasypt.encryptor.password=test1127!@")
@EmbeddedSQL
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
public @interface IntegrationTest {
}
