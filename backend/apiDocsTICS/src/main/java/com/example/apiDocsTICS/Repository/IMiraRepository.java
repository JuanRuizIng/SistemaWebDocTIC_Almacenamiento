package com.example.apiDocsTICS.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.apiDocsTICS.Model.MiraModel;
import com.example.apiDocsTICS.Model.UsuarioModel;
import com.example.apiDocsTICS.Model.DocumentoModel;

public interface IMiraRepository extends JpaRepository<MiraModel, Integer> {
Optional<MiraModel> findByIdUsuario(UsuarioModel idUsuario);
Optional<MiraModel> findByIdDocumento(DocumentoModel idDocumento);
Optional<MiraModel> findByIdDocumentoAndIdUsuario(UsuarioModel idUsuario, DocumentoModel idDocumento);
}
