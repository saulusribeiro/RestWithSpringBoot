package br.com.srdeveloper.file.importer.contract;

import br.com.srdeveloper.data.dto.PersonDTO;

import java.io.InputStream;
import java.util.List;

public interface FileImporter {

    List<PersonDTO> importFile(InputStream inputStream) throws Exception;
}
