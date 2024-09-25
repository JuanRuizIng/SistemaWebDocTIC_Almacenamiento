package com.example.apiDocsTICS.Service;

import com.example.apiDocsTICS.Service.IMiraService;
import com.example.apiDocsTICS.Model.MiraModel;
import com.example.apiDocsTICS.Model.DocumentoModel;
import com.example.apiDocsTICS.Model.UsuarioModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.apiDocsTICS.Repository.IMiraRepository;
import com.example.apiDocsTICS.Repository.IDocumentoRepository;
import com.example.apiDocsTICS.Repository.IUsuarioRepository;
import com.example.apiDocsTICS.Exception.RecursoNoEncontradoException;
import com.example.apiDocsTICS.Exception.RecursoExistente;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class MiraServiceImp  implements IMiraService {
    @Autowired
    IUsuarioRepository usuarioRepository;
    @Autowired
    IMiraRepository miraRepository;

    @Override
    public List<MiraModel> obtenerMira(){
        return miraRepository.findAll();
    }

    @Override
    public List<MiraModel> obtenerMiraByUsuario(Integer idUsuario) {
        int idU;
        idU = idUsuario;
        Optional<UsuarioModel> usuarioOpt = usuarioRepository.findById(idU);
        if (usuarioOpt.isPresent()) {
            String nombreUsuario = usuarioOpt.get().getNombreUsuario();
            Optional<MiraModel> miraOpt = miraRepository.findByIdUsuario(new UsuarioModel(idU));
            return miraOpt.map(Collections::singletonList).orElse(Collections.emptyList());
        } else {
            throw new RecursoNoEncontradoException("No se encuentra el usuario" + idU);
        }
    }

    @Autowired
    IDocumentoRepository documentoRepository;

    @Override
    public List<MiraModel> obtenerMiraByDocumento(Integer idDocumento){
            int idDoc;
            idDoc = idDocumento;
            Optional<DocumentoModel> documentoOpt = documentoRepository.findById(idDoc);
            if (documentoOpt.isPresent()) {
                String nombreDocumento = documentoOpt.get().getTituloDoc();
                Optional<MiraModel> miraOpt = miraRepository.findByIdDocumento(new DocumentoModel(idDoc));
                return miraOpt.map(Collections::singletonList).orElse(Collections.emptyList());
            }else{
                throw new RecursoNoEncontradoException("No se encuentra el documento" + idDoc);
            }
        }

    @Override
    public String crearMira(MiraModel mira) {
        String nombreDocumento;
        String nombreUsuario;
        int idUsuario;
        int idDocumento;
        nombreDocumento = documentoRepository.findById(mira.getIdDocumento().getIdDocumento()).get().getTituloDoc();
        nombreUsuario = usuarioRepository.findById(mira.getIdUsuario().getIdUsuario()).get().getNombreUsuario();
        idUsuario = mira.getIdUsuario().getIdUsuario();
        idDocumento = mira.getIdDocumento().getIdDocumento();

        Optional<MiraModel> miraOpt = miraRepository.findByIdDocumentoAndIdUsuario(new UsuarioModel(idUsuario), new DocumentoModel(idDocumento));
        if (miraOpt.isPresent()) {
            throw  new RecursoExistente("El Documento "+ nombreDocumento+ " ya ha sido observado por"+ nombreUsuario );
        }
        miraRepository.save(mira);
        return "Se ha creado exitosamente el registro de mira";
    }
    }
