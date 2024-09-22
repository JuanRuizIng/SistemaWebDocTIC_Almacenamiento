package com.example.apiDocsTICS.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.apiDocsTICS.Exception.RecursoNoEncontradoException;
import com.example.apiDocsTICS.Model.PublicaModel;
import com.example.apiDocsTICS.Repository.IPublicaRepository;

@Service
public class PublicaServiceImp implements IPublicaService {

    @Autowired
    IPublicaRepository publicaRepository;

    @Override
    public String crearPublicacion(PublicaModel publicacion) {
        publicacion.setFechaPublicacion(LocalDateTime.now());
        publicaRepository.save(publicacion);
        return "Publicación creada exitosamente";
    }

    @Override
    public String eliminarPublicacionPorId(int idPublica) {
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
