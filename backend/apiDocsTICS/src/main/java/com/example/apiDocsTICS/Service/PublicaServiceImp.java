package com.example.apiDocsTICS.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.example.apiDocsTICS.Exception.RecursoExistente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.apiDocsTICS.Exception.RecursoNoEncontradoException;
import com.example.apiDocsTICS.Model.PublicaModel;
import com.example.apiDocsTICS.Repository.IPublicaRepository;
import com.example.apiDocsTICS.Repository.IUsuarioRepository;
import com.example.apiDocsTICS.Repository.IDocumentoRepository;
@Service
public class PublicaServiceImp implements IPublicaService {

    @Autowired
    IPublicaRepository publicaRepository;
    @Autowired
    IUsuarioRepository usuarioRepository;
    @Autowired
    IDocumentoRepository documentoRepository;

    @Override
    public String crearPublicacion(PublicaModel publicacion) {
        if(!documentoRepository.existsById(publicacion.getDocumento().getIdDocumento())) {
            throw new RecursoNoEncontradoException("El documento con id "+publicacion.getDocumento().getIdDocumento()+" No existe");
        }
        if (!usuarioRepository.existsById(publicacion.getUsuario().getIdUsuario())) {
            throw new RecursoNoEncontradoException("El usuario con id "+publicacion.getUsuario().getIdUsuario()+" No existe");
        }
        if (publicaRepository.existsById(publicacion.getIdPublica())) {
            throw new RecursoExistente("La publicacion con id "+publicacion.getIdPublica()+" ya existe");
        }
        publicacion.setFechaPublicacion(LocalDateTime.now());
        publicaRepository.save(publicacion);
        return "Publicación creada exitosamente";
    }

    @Override
    public String eliminarPublicacionPorId(int idPublica) {
        PublicaModel publicacion = publicaRepository.findById(idPublica)
                .orElseThrow(()-> new RecursoNoEncontradoException("El publicacion con id "+idPublica+" no existe"));
        publicaRepository.deleteById(idPublica);
        return "Publicación eliminada exitosamente";
    }

    @Override
    public String modificarPublicacionPorId(int idPublica, PublicaModel publicacion) {
        Optional<PublicaModel> publicacionOptional = publicaRepository.findById(idPublica);
        if (publicacionOptional.isPresent()) {
            publicaRepository.save(publicacion);
            return "Publicación modificada exitosamente";
        }
        throw new RecursoNoEncontradoException("Publicación no encontrada");
    }

    @Override
    public PublicaModel obtenerPublicacionPorId(int idPublica) {
        return publicaRepository.findById(idPublica)
                .orElseThrow(() -> new RecursoNoEncontradoException("Publicación no encontrada"));
    }

    @Override
    public List<PublicaModel> obtenerPublicaciones() {
        return publicaRepository.findAll();
    }
}
