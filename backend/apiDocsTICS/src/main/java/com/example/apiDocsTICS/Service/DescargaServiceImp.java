package com.example.apiDocsTICS.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.apiDocsTICS.Exception.RecursoNoEncontradoException;
import com.example.apiDocsTICS.Model.DescargaModel;
import com.example.apiDocsTICS.Repository.IDescargaRepository;

@Service
public class DescargaServiceImp implements IDescargaService {
    @Autowired
    IDescargaRepository descargaRepository;

    @Override
    public String crearDescarga(DescargaModel descarga) {
        descarga.setFechaDescarga(LocalDateTime.now());
        descargaRepository.save(descarga);
        return "Descarga creada exitosamente";
    }

    @Override
    public DescargaModel obtenerDescargaPorId(int idDescarga) {
        return descargaRepository.findById(idDescarga)
                .orElseThrow(() -> new RecursoNoEncontradoException("Descarga no encontrada"));
    }

    @Override
    public List<DescargaModel> obtenerDescargas() {
        return descargaRepository.findAll();
    }
}
