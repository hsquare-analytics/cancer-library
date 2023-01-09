package io.planit.cancerlibrary.web.rest;

import io.planit.cancerlibrary.config.audit.AuditEventConverter;
import io.planit.cancerlibrary.repository.PersistenceAuditEventRepository;
import org.springframework.boot.actuate.audit.AuditEvent;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/management/audits")
public class AuditResource {

    private final PersistenceAuditEventRepository persistenceAuditEventRepository;

    private final AuditEventConverter auditEventConverter;

    public AuditResource(PersistenceAuditEventRepository persistenceAuditEventRepository, AuditEventConverter auditEventConverter) {
        this.persistenceAuditEventRepository = persistenceAuditEventRepository;
        this.auditEventConverter = auditEventConverter;
    }

    @GetMapping
    public ResponseEntity<List<AuditEvent>> getAll() {
        List<AuditEvent> result = persistenceAuditEventRepository.findAll().stream().map(auditEventConverter::convertToAuditEvent).collect(Collectors.toList());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
