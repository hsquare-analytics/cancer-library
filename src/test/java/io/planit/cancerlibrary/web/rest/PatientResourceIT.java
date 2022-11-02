package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.ReviewConstants;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.mapper.PatientMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
public class PatientResourceIT {

    private static final String DEFAULT_PT_NO = "AAAAAAAAAA";
    private static final String DEFAULT_PT_NM = "AAAAAAAAAA";
    private static final String DEFAULT_SEX_TP_CD = "AAAAAAAAAA";
    private static final String DEFAULT_PT_BRDY_DT = "AAAAAAAAAA";
    private static final String DEFAULT_HSP_TP_CD = "AAAAAAAAAA";
    private static final Date DEFAULT_IDX_DT = Date.from(Instant.ofEpochMilli(0L));
    private static final String DEFAULT_STATUS = ReviewConstants.SUBMITTED;
    private static final String DEFAULT_CREATED_BY = "AAAAAAAAAA";
    private static final Instant DEFAULT_CREATED_DATE = Instant.now();
    private static final String DEFAULT_LAST_MODIFIED_BY = "AAAAAAAAAA";
    private static final Instant DEFAULT_LAST_MODIFIED_DATE = Instant.now();
    private static final String DEFAULT_COMMENT = "AAAAAAAAAA";
    private static final String DEFAULT_DECLINE_REASON = "AAAAAAAAAA";

    private static final String UPDATED_PT_NO = "BBBBBBBBBB";
    private static final String UPDATED_PT_NM = "BBBBBBBBBB";
    private static final String UPDATED_SEX_TP_CD = "BBBBBBBBBB";
    private static final String UPDATED_PT_BRDY_DT = "BBBBBBBBBB";
    private static final String UPDATED_HSP_TP_CD = "BBBBBBBBBB";
    private static final Date UPDATED_IDX_DT = Date.from(Instant.ofEpochMilli(0L));
    private static final String UPDATED_STATUS = ReviewConstants.APPROVED;
    private static final String UPDATED_CREATED_BY = "BBBBBBBBBB";
    private static final Instant UPDATED_CREATED_DATE = Instant.now();
    private static final String UPDATED_LAST_MODIFIED_BY = "BBBBBBBBBB";
    private static final Instant UPDATED_LAST_MODIFIED_DATE = Instant.now().plus(1, ChronoUnit.DAYS);
    private static final String UPDATED_COMMENT = "BBBBBBBBBB";
    private static final String UPDATED_DECLINE_REASON = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/patients";

    @Autowired
    private PatientMapper patientMapper;

    @Autowired
    private MockMvc restPatientMockMvc;

    private Patient patient;

    public static Patient createPatientDTO() {
        return new Patient()
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
            .lastModifiedDate(DEFAULT_LAST_MODIFIED_DATE)
            .comment(DEFAULT_COMMENT)
            .declineReason(DEFAULT_DECLINE_REASON);
    }

    public static Patient createUpdatedPatientDTO() {
        return new Patient()
            .ptNo(UPDATED_PT_NO)
            .ptNm(UPDATED_PT_NM)
            .sexTpCd(UPDATED_SEX_TP_CD)
            .ptBrdyDt(UPDATED_PT_BRDY_DT)
            .hspTpCd(UPDATED_HSP_TP_CD)
            .idxDt(UPDATED_IDX_DT)
            .status(UPDATED_STATUS)
            .createdBy(UPDATED_CREATED_BY)
            .createdDate(UPDATED_CREATED_DATE)
            .lastModifiedBy(UPDATED_LAST_MODIFIED_BY)
            .lastModifiedDate(UPDATED_LAST_MODIFIED_DATE)
            .comment(UPDATED_COMMENT)
            .declineReason(UPDATED_DECLINE_REASON);
    }

    @BeforeEach
    void initTest() {
        patient = createPatientDTO();
    }

    @Test
    @Transactional
    void testCreatePatient() throws Exception {
        int databaseSizeBeforeCreate = patientMapper.findAll().size();
        restPatientMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isCreated());

        List<Patient> patientList = patientMapper.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeCreate + 1);
        Patient testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.getPtNo()).isEqualTo(DEFAULT_PT_NO);
        assertThat(testPatient.getPtNm()).isEqualTo(DEFAULT_PT_NM);
        assertThat(testPatient.getSexTpCd()).isEqualTo(DEFAULT_SEX_TP_CD);
        assertThat(testPatient.getPtBrdyDt()).isEqualTo(DEFAULT_PT_BRDY_DT);
        assertThat(testPatient.getHspTpCd()).isEqualTo(DEFAULT_HSP_TP_CD);

        assertThat(testPatient.getStatus()).isEqualTo(DEFAULT_STATUS);
        assertThat(testPatient.getCreatedBy()).isEqualTo(DEFAULT_CREATED_BY);
        assertThat(testPatient.getLastModifiedBy()).isEqualTo(DEFAULT_LAST_MODIFIED_BY);
        assertThat(testPatient.getComment()).isEqualTo(DEFAULT_COMMENT);
        assertThat(testPatient.getDeclineReason()).isEqualTo(DEFAULT_DECLINE_REASON);
    }

    @Test
    @Transactional
    void testGetAllPatient() throws Exception {
        patientMapper.insert(patient);

        restPatientMockMvc
            .perform(get(ENTITY_API_URL))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(DEFAULT_PT_NO)))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(DEFAULT_PT_NM)))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(DEFAULT_SEX_TP_CD)))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(DEFAULT_PT_BRDY_DT)))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(DEFAULT_HSP_TP_CD)))
            .andExpect(jsonPath("$.[*].status").value(hasItem(DEFAULT_STATUS)))
            .andExpect(jsonPath("$.[*].createdBy").value(hasItem(DEFAULT_CREATED_BY)))
            .andExpect(jsonPath("$.[*].createdDate").value(hasItem(DEFAULT_CREATED_DATE.toString())))
            .andExpect(jsonPath("$.[*].lastModifiedBy").value(hasItem(DEFAULT_LAST_MODIFIED_BY)))
            .andExpect(jsonPath("$.[*].lastModifiedDate").value(hasItem(DEFAULT_LAST_MODIFIED_DATE.toString())))
            .andExpect(jsonPath("$.[*].comment").value(hasItem(DEFAULT_COMMENT)))
            .andExpect(jsonPath("$.[*].declineReason").value(hasItem(DEFAULT_DECLINE_REASON)))
        ;
    }

    @Test
    @Transactional
    void testUpdatePartialPatientUpdate() throws Exception {
        // given
        patientMapper.insert(patient);
        int databaseSizeBeforeUpdate = patientMapper.findAll().size();

        // when
        patient.setPtNm(UPDATED_PT_NM);
        patient.setStatus(UPDATED_STATUS);
        patient.setComment(UPDATED_COMMENT);
        patient.setDeclineReason(UPDATED_DECLINE_REASON);
        restPatientMockMvc.perform(patch(ENTITY_API_URL + "/{ptNo}", patient.getPtNo())
                .contentType("application/merge-patch+json")
                .content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isOk());

        // then
        List<Patient> patientList = patientMapper.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeUpdate);
        Patient testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.getStatus()).isEqualTo(UPDATED_STATUS);
        assertThat(testPatient.getComment()).isEqualTo(UPDATED_COMMENT);
        assertThat(testPatient.getPtNm()).isNotEqualTo(UPDATED_PT_NM);
        assertThat(testPatient.getDeclineReason()).isEqualTo(UPDATED_DECLINE_REASON);
    }

    @Test
    @Transactional
    void testGetPatientDTO() throws Exception {
        // given
        patientMapper.insert(patient);

        // when, then
        restPatientMockMvc.perform(get(ENTITY_API_URL + "/{ptNo}", patient.getPtNo()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.ptNo").value(DEFAULT_PT_NO))
            .andExpect(jsonPath("$.ptNm").value(DEFAULT_PT_NM)) ;
    }
}
