package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.constant.PatientStatus;
import io.planit.cancerlibrary.domain.Patient;
import io.planit.cancerlibrary.domain.embedded.PatientDetail;
import io.planit.cancerlibrary.repository.PatientDetailRepository;
import io.planit.cancerlibrary.repository.PatientRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
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
    private static final Timestamp DEFAULT_IDX_DT = Timestamp.from(Instant.ofEpochMilli(0L));
    private static final PatientDetail DEFAULT_PATIENT_DETAIL = new PatientDetail().comment("AAAAAAAAAA")
        .declineReason("AAAAAAAAAA").status(PatientStatus.REVIEW_SUBMITTED).standardDate(Instant.now())
        .createdBy("AAAAAAAAAA").createdDate(Instant.now()).lastModifiedBy("AAAAAAAAAA").lastModifiedDate(Instant.now());

    private static final String UPDATED_PT_NO = "BBBBBBBBBB";
    private static final String UPDATED_PT_NM = "BBBBBBBBBB";
    private static final String UPDATED_SEX_TP_CD = "BBBBBBBBBB";
    private static final String UPDATED_PT_BRDY_DT = "BBBBBBBBBB";
    private static final String UPDATED_HSP_TP_CD = "BBBBBBBBBB";
    private static final Timestamp UPDATED_IDX_DT = Timestamp.from(Instant.ofEpochMilli(0L));
    private static final PatientDetail UPDATED_PATIENT_DETAIL = new PatientDetail().comment("BBBBBBBBBB")
        .declineReason("BBBBBBBBBB").status(PatientStatus.REVIEW_APPROVED).standardDate(Instant.now())
        .createdBy("BBBBBBBBBB").createdDate(Instant.now()).lastModifiedBy("BBBBBBBBBB").lastModifiedDate(Instant.now().plus(1, ChronoUnit.DAYS));

    private static final String ENTITY_API_URL = "/api/patients";

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private PatientDetailRepository patientDetailRepository;

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
            .detail(DEFAULT_PATIENT_DETAIL);
    }

    public static Patient createUpdatedPatientDTO() {
        return new Patient()
            .ptNo(UPDATED_PT_NO)
            .ptNm(UPDATED_PT_NM)
            .sexTpCd(UPDATED_SEX_TP_CD)
            .ptBrdyDt(UPDATED_PT_BRDY_DT)
            .hspTpCd(UPDATED_HSP_TP_CD)
            .idxDt(UPDATED_IDX_DT)
            .detail(UPDATED_PATIENT_DETAIL);
    }

    @BeforeEach
    void initTest() {
        patient = createPatientDTO();
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    void testCreatePatient() throws Exception {
        int databaseSizeBeforeCreate = patientRepository.findAll().size();
        restPatientMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON)
                .content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isCreated());

        List<Patient> patientList = patientRepository.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeCreate + 1);
        Patient testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.getPtNo()).isEqualTo(DEFAULT_PT_NO);
        assertThat(testPatient.getPtNm()).isEqualTo(DEFAULT_PT_NM);
        assertThat(testPatient.getSexTpCd()).isEqualTo(DEFAULT_SEX_TP_CD);
        assertThat(testPatient.getPtBrdyDt()).isEqualTo(DEFAULT_PT_BRDY_DT);
        assertThat(testPatient.getHspTpCd()).isEqualTo(DEFAULT_HSP_TP_CD);

        assertThat(testPatient.getDetail().getStatus()).isEqualTo(DEFAULT_PATIENT_DETAIL.getStatus());
        assertThat(testPatient.getDetail().getComment()).isEqualTo(DEFAULT_PATIENT_DETAIL.getComment());
        assertThat(testPatient.getDetail().getDeclineReason()).isEqualTo(DEFAULT_PATIENT_DETAIL.getDeclineReason());
        assertThat(testPatient.getDetail().getStandardDate()).isEqualTo(DEFAULT_PATIENT_DETAIL.getStandardDate().toString());
        assertThat(testPatient.getDetail().getCreatedBy()).isEqualTo(DEFAULT_PATIENT_DETAIL.getCreatedBy());
        assertThat(testPatient.getDetail().getLastModifiedBy()).isEqualTo(DEFAULT_PATIENT_DETAIL.getLastModifiedBy());
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    void testGetAllPatient() throws Exception {
        patientRepository.insert(patient);
        patientDetailRepository.insert(patient.getPtNo(), patient.getDetail());

        restPatientMockMvc
            .perform(get(ENTITY_API_URL))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].ptNo").value(hasItem(DEFAULT_PT_NO)))
            .andExpect(jsonPath("$.[*].ptNm").value(hasItem(DEFAULT_PT_NM)))
            .andExpect(jsonPath("$.[*].sexTpCd").value(hasItem(DEFAULT_SEX_TP_CD)))
            .andExpect(jsonPath("$.[*].ptBrdyDt").value(hasItem(DEFAULT_PT_BRDY_DT)))
            .andExpect(jsonPath("$.[*].hspTpCd").value(hasItem(DEFAULT_HSP_TP_CD)))
            .andExpect(jsonPath("$.[*].detail.comment").value(hasItem(DEFAULT_PATIENT_DETAIL.getComment())))
            .andExpect(jsonPath("$.[*].detail.declineReason").value(hasItem(DEFAULT_PATIENT_DETAIL.getDeclineReason())))
            .andExpect(jsonPath("$.[*].detail.status").value(hasItem(DEFAULT_PATIENT_DETAIL.getStatus().name())))
            .andExpect(jsonPath("$.[*].detail.standardDate").value(hasItem(DEFAULT_PATIENT_DETAIL.getStandardDate().toString())))
            .andExpect(jsonPath("$.[*].detail.createdBy").value(hasItem(DEFAULT_PATIENT_DETAIL.getCreatedBy())))
            .andExpect(jsonPath("$.[*].detail.createdDate").value(hasItem(DEFAULT_PATIENT_DETAIL.getCreatedDate().toString())))
            .andExpect(jsonPath("$.[*].detail.lastModifiedBy").value(hasItem(DEFAULT_PATIENT_DETAIL.getLastModifiedBy())))
            .andExpect(jsonPath("$.[*].detail.lastModifiedDate").value(hasItem(DEFAULT_PATIENT_DETAIL.getLastModifiedDate().toString())));
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    void testUpdatePartialPatientUpdate() throws Exception {
        // given
        patientRepository.insert(patient);
        int databaseSizeBeforeUpdate = patientRepository.findAll().size();

        // when
        patient.setPtNm(UPDATED_PT_NM);
        patient.detail(UPDATED_PATIENT_DETAIL);
        restPatientMockMvc.perform(patch(ENTITY_API_URL + "/{ptNo}", patient.getPtNo())
                .contentType("application/merge-patch+json")
                .content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isOk());

        // then
        List<Patient> patientList = patientRepository.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeUpdate);
        Patient testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.getPtNm()).isNotEqualTo(UPDATED_PT_NM);
        assertThat(testPatient.getDetail().getStatus()).isEqualTo(UPDATED_PATIENT_DETAIL.getStatus());
        assertThat(testPatient.getDetail().getComment()).isEqualTo(UPDATED_PATIENT_DETAIL.getComment());
        assertThat(testPatient.getDetail().getDeclineReason()).isEqualTo(UPDATED_PATIENT_DETAIL.getDeclineReason());
    }

    @Test
    @Transactional("jdbcTemplateTransactionManager")
    void testGetPatientDTO() throws Exception {
        // given
        patientRepository.insert(patient);

        // when, then
        restPatientMockMvc.perform(get(ENTITY_API_URL + "/{ptNo}", patient.getPtNo()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.ptNo").value(DEFAULT_PT_NO))
            .andExpect(jsonPath("$.ptNm").value(DEFAULT_PT_NM));
    }
}
