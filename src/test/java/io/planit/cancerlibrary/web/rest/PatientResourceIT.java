package io.planit.cancerlibrary.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import io.planit.cancerlibrary.IntegrationTest;
import io.planit.cancerlibrary.mapper.PatientMapper;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    private static final String DEFAULT_IDX_DT = "2020-01-01";
    private static final String DEFAULT_STATUS = "AAAAAAAAAA";
    private static final String DEFAULT_CREATED_BY = "AAAAAAAAAA";
    private static final String DEFAULT_CREATED_DATE = "2020-08-25T01:49:06.000Z";
    private static final String DEFAULT_LAST_MODIFIED_BY = "AAAAAAAAAA";
    private static final String DEFAULT_LAST_MODIFIED_DATE = "2020-08-25T01:49:06.000Z";

    private static final String ENTITY_API_URL = "/api/patients";

    @Autowired
    private PatientMapper patientMapper;

    @Autowired
    private MockMvc restPatientMockMvc;

    private Map<String, Object> patient;

    public static Map<String, Object> createEntity() {
        return new HashMap<>() {{
            put("pactId", DEFAULT_PACT_ID);
            put("ptNo", DEFAULT_PT_NO);
            put("ptNm", DEFAULT_PT_NM);
            put("sexTpCd", DEFAULT_SEX_TP_CD);
            put("ptBrdyDt", DEFAULT_PT_BRDY_DT);
            put("hspTpCd", DEFAULT_HSP_TP_CD);
            put("idxDt", DEFAULT_IDX_DT);
            put("status", DEFAULT_STATUS);
            put("createdBy", DEFAULT_CREATED_BY);
            put("createdDate", DEFAULT_CREATED_DATE);
            put("lastModifiedBy", DEFAULT_LAST_MODIFIED_BY);
            put("lastModifiedDate", DEFAULT_LAST_MODIFIED_DATE);
        }};
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
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(patient)))
            .andExpect(status().isCreated());

        List<Map> patientList = patientMapper.findAll();
        assertThat(patientList).hasSize(databaseSizeBeforeCreate + 1);
        Map<String, Object> testPatient = patientList.get(patientList.size() - 1);
        assertThat(testPatient.get("pact_id")).isEqualTo(DEFAULT_PACT_ID);
        assertThat(testPatient.get("pt_no")).isEqualTo(DEFAULT_PT_NO);
        assertThat(testPatient.get("pt_nm")).isEqualTo(DEFAULT_PT_NM);
        assertThat(testPatient.get("sex_tp_cd")).isEqualTo(DEFAULT_SEX_TP_CD);
        assertThat(testPatient.get("pt_brdy_dt")).isEqualTo(DEFAULT_PT_BRDY_DT);
        assertThat(testPatient.get("hsp_tp_cd")).isEqualTo(DEFAULT_HSP_TP_CD);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        assertThat(dateFormat.format(testPatient.get("idx_dt"))).isEqualTo(DEFAULT_IDX_DT);
        assertThat(testPatient.get("status")).isEqualTo(DEFAULT_STATUS);
        assertThat(testPatient.get("created_by")).isEqualTo(DEFAULT_CREATED_BY);
        assertThat(testPatient.get("last_modified_by")).isEqualTo(DEFAULT_LAST_MODIFIED_BY);
    }
}
