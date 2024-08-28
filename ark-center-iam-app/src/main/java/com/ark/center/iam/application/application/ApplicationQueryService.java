package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import com.ark.center.iam.infra.application.db.ApplicationDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ApplicationQueryService {

    private final ApplicationDAO applicationDAO;
    private final ApplicationAssembler applicationAssembler;

    public List<ApplicationDTO> queryList(ApplicationQuery query) {
        return applicationDAO
                .lambdaQuery()
                .list()
                .stream()
                .map(applicationAssembler::toApplicationDTO)
                .collect(Collectors.toList());
    }

}
