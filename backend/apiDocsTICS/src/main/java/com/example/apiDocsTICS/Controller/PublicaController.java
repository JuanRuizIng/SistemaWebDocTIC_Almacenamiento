package com.example.apiDocsTICS.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.apiDocsTICS.Model.PublicaModel;
import com.example.apiDocsTICS.Service.IPublicaService;
import java.util.List;

@RestController
@RequestMapping("/publicaciones")
public class PublicaController {

    @Autowired
    private IPublicaService publicaService;

    @PostMapping("/crear")
    public ResponseEntity<String> crearPublicacion(@RequestBody PublicaModel publicacion) {
        return new ResponseEntity<>(publicaService.crearPublicacion(publicacion), HttpStatus.CREATED);
    }

    @GetMapping("/obtener/{id}")
    public ResponseEntity<PublicaModel> obtenerPublicacionPorId(@PathVariable int id) {
        return new ResponseEntity<>(publicaService.obtenerPublicacionPorId(id), HttpStatus.OK);
    }

    @GetMapping("/todas")
    public ResponseEntity<List<PublicaModel>> obtenerPublicaciones() {
        return new ResponseEntity<>(publicaService.obtenerPublicaciones(), HttpStatus.OK);
    }

    @PutMapping("/modificar/{id}")
    public ResponseEntity<String> modificarPublicacion(@PathVariable int id, @RequestBody PublicaModel publicacion) {
        return new ResponseEntity<>(publicaService.modificarPublicacionPorId(id, publicacion), HttpStatus.OK);
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<String> eliminarPublicacion(@PathVariable int id) {
        return new ResponseEntity<>(publicaService.eliminarPublicacionPorId(id), HttpStatus.OK);
    }
}
