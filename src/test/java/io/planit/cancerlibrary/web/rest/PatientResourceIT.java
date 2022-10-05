package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.mapper.PatientMapper;
import io.planit.cancerlibrary.service.dto.PatientDTO;
import java.time.Instant;
import java.util.Date;
import java.util.List;
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
public class PatientResourceIT {

    private static final String DEFAULT_PACT_ID = "AAAAAAAAAA";
    private static final String DEFAULT_PT_NO = "AAAAAAAAAA";
    private static final String DEFAULT_PT_NM = "AAAAAAAAAA";
    private static final String DEFAULT_SEX_TP_CD = "AAAAAAAAAA";
    private static final String DEFAULT_PT_BRDY_DT = "AAAAAAAAAA";
    private static final String DEFAULT_HSP_TP_CD = "AAAAAAAAAA";
    private static final Date DEFAULT_IDX_DT = Date.from(Instant.ofEpochMilli(0L));
    private static final String DEFAULT_STATUS = "AAAAAAAAAA";
    private static final String DEFAULT_CREATED_BY = "AAAAAAAAAA";
    private static final Instant DEFAULT_CREATED_DATE = Instant.now();
    private static final String DEFAULT_LAST_MODIFIED_BY = "AAAAAAAAAA";
    private static final Instant DEFAULT_LAST_MODIFIED_DATE = Instant.now();

    private static final String ENTITY_API_URL = "/api/patients";

    @Autowired
    private PatientMapper patientMapper;

    @Autowired
    private MockMvc restPatientMockMvc;

    private PatientDTO patient;

    public static PatientDTO createEntity() {
        return new PatientDTO().pactId(DEFAULT_PACT_ID)
            .ptNo(DEFAULT_PT_NO)
            .ptNm(DEFAULT_PT_NM)
            .sexTpCd(DEFAULT_SEX_TP_CD)
            .ptBrdyDt(DEFAULT_PT_BRDY_DT)
            .hspTpCd(DEFAULT_HSP_TP_CD)
            .idxDt(DEFAULT_IDX_DT)
            .status(DEFAULT_STATUS)
            .createdBy(DEFAULT_CREATED_BY)
            .createdDate(DEFAULT_CREATED_DATE)
            .lastModifiedBy(DEFAULT_LAST_MODIFIED_BY)
            .lastModifiedDate(DEFAULT_LAST_MODIFIED_DATE);
    }

    @BeforeEach
    void initTest() {
        patient = createEntity();
    }

    @Test
    @Transactional
    void createPatient() throws Exception {
        int databaseSizeBeforeCreate = patientMapper.findAll().size();
        restPatientMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isCreated());

        List<PatientDTO> patientList = patientMapper.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeCreate + 1);
        PatientDTO testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.getPactId()).isEqualTo(DEFAULT_PACT_ID);
        assertThat(testPatient.getPtNo()).isEqualTo(DEFAULT_PT_NO);
        assertThat(testPatient.getPtNm()).isEqualTo(DEFAULT_PT_NM);
        assertThat(testPatient.getSexTpCd()).isEqualTo(DEFAULT_SEX_TP_CD);
        assertThat(testPatient.getPtBrdyDt()).isEqualTo(DEFAULT_PT_BRDY_DT);
        assertThat(testPatient.getHspTpCd()).isEqualTo(DEFAULT_HSP_TP_CD);

        assertThat(testPatient.getStatus()).isEqualTo(DEFAULT_STATUS);
        assertThat(testPatient.getCreatedBy()).isEqualTo(DEFAULT_CREATED_BY);
        assertThat(testPatient.getLastModifiedBy()).isEqualTo(DEFAULT_LAST_MODIFIED_BY);
    }

    @Test
    @Transactional
    void getAllPatient() throws Exception {
        patientMapper.insert(patient);

        restPatientMockMvc
            .perform(get(ENTITY_API_URL))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].pactId").value(hasItem(DEFAULT_PACT_ID)))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(DEFAULT_PT_NO)))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(DEFAULT_PT_NM)))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(DEFAULT_SEX_TP_CD)))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(DEFAULT_PT_BRDY_DT)))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(DEFAULT_HSP_TP_CD)))
            .andExpect(jsonPath("$.[*].status").value(hasItem(DEFAULT_STATUS)))
            .andExpect(jsonPath("$.[*].createdBy").value(hasItem(DEFAULT_CREATED_BY)))
            .andExpect(jsonPath("$.[*].createdDate").value(hasItem(DEFAULT_CREATED_DATE.toString())))
            .andExpect(jsonPath("$.[*].lastModifiedBy").value(hasItem(DEFAULT_LAST_MODIFIED_BY)))
            .andExpect(jsonPath("$.[*].lastModifiedDate").value(hasItem(DEFAULT_LAST_MODIFIED_DATE.toString())));
    }
}
