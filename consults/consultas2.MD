## 1. Obtener  la valoracion promedio de un documento
```sql
SELECT AVG(v.valoracion) AS ValoracionPromedio
FROM Valora v
WHERE v.idDocumento = [ID_DEL_DOCUMENTO];

```

## 2. Mostrar todos los documentos que pertenencen a una categoria especifica

```sql
SELECT 
    d.idDocumento, 
    d.tituloDoc, 
    c.nombre AS nombreCategoria
FROM 
    Documento d
JOIN 
    Categoria c ON d.idDocumento = c.idDocumento
WHERE 
    c.idCategoria = [idCategoria];

```
## 2.Alternativa
```sql
SELECT 
    d.idDocumento, 
    d.tituloDoc, 
    c.nombre AS nombreCategoria
FROM 
    Documento d
JOIN 
    Categoria c ON d.idDocumento = c.idDocumento
WHERE 
    c.idCategoria = [idCategoria];

```

## 3. Mostrar los 10 documentos mas descargados 
```sql
SELECT 
    d.idDocumento AS idDocumento, 
    d.tituloDoc AS titulo, 
    COUNT(de.idDocumento) AS Descargas
FROM 
    Documento d, Descarga
JOIN 
    Descarga de ON d.idDocumento = de.idDocumento
GROUP BY 
    d.idDocumento, d.tituloDoc
LIMIT 10;
```

## 4. Mostrar los ultimos Documentos vistos por el usuario

```sql
SELECT 
    d.tituloDoc AS nombreDocumento, 
    u.nombreUsuario, 
    m.fechaMira
FROM 
    Usuario u
JOIN 
    Mira m ON u.idUsuario = m.idUsuario
JOIN 
    Documento d ON m.idDocumento = d.idDocumento
WHERE 
    u.idUsuario = [idUsuario]
ORDER BY 
    m.fechaMira DESC
LIMIT 10;
```

## 5. Mostrar las categorias de los Documentos que mas se miran

```sql
SELECT 
    c.nombre AS nombreCategoria, 
    COUNT(m.idMira) AS totalVistas
FROM 
    Mira m
JOIN 
    Documento d ON m.idDocumento = d.idDocumento
JOIN 
    Categoria c ON d.idDocumento = c.idDocumento
GROUP BY 
    c.nombre
ORDER BY 
    totalVistas DESC;
```


## 6.  Mostrar los documentos publicos con mas descargas
```sql
SELECT 
    d.tituloDoc AS nombreDocumento, 
    d.visibilidad, 
    COUNT(de.idDescarga) AS totalDescargas
FROM 
    Documento d
JOIN 
    Descarga de ON d.idDocumento = de.idDocumento
WHERE 
    d.visibilidad = 'publico'
GROUP BY 
    d.idDocumento, d.tituloDoc, d.visibilidad
ORDER BY 
    totalDescargas DESC
LIMIT 10;
```

## 7. Mostrar los documentos privados con mas descargas
```sql
SELECT 
    d.tituloDoc AS nombreDocumento, 
    d.visibilidad, 
    COUNT(de.idDescarga) AS totalDescargas
FROM 
    Documento d
JOIN 
    Descarga de ON d.idDocumento = de.idDocumento
WHERE 
    d.visibilidad = 'privado'
GROUP BY 
    d.idDocumento, d.tituloDoc, d.visibilidad
ORDER BY 
    totalDescargas DESC
LIMIT 10;
```

## 8. Mostrar el promedio de valoracion de los documentos de un usuario
```sql
SELECT 
    u.nombreUsuario, 
    AVG(v.valoracion) AS promedioValoracion
FROM 
    Usuario u, Documento d
JOIN 
    Valora v ON d.idDocumento = v.idDocumento
WHERE 
    u.idUsuario = [idUsuario]
GROUP BY 
    u.nombreUsuario;
```

## 9. Mostrar el numero de comentarios que tiene un comentario
```sql
SELECT c.comentario AS comentario, u.nombre AS usuario, count(c.subIdComentario) AS numero_comentarios
FROM Comentario c
JOIN Usiario u ON  c.idUsuario = u.idUsuario
GROUP BY c.comentario
```

## 10. Mostrar los usuarios con los las valoraciones promedio mas altas

```sql
SELECT 
    u.nombreUsuario, 
    AVG(v.valoracion) AS promedioValoracion
FROM 
    Usuario u, Documento d
JOIN 
    Valora v ON d.idDocumento = v.idDocumento
GROUP BY 
    u.nombreUsuario
HAVING 
    AVG(v.valoracion) IS NOT NULL
ORDER BY 
    promedioValoracion DESC
LIMIT 10;
```

## 11. Mostrar el numero de comentarios promedio que tienen Documentos mas valorados
```sql
SELECT 
    AVG(comentarios.totalComentarios) AS promedioComentarios
FROM 
    (SELECT 
        d.idDocumento, 
        COUNT(c.idComentario) AS totalComentarios
     FROM 
        Documento d
     JOIN 
        Valora v ON d.idDocumento = v.idDocumento
     LEFT JOIN 
        Comentario c ON d.idDocumento = c.idDocumento
     GROUP BY 
        d.idDocumento
     HAVING 
        AVG(v.valoracion) = (SELECT MAX(avgValor) 
                             FROM (SELECT AVG(valoracion) as avgValor 
                                   FROM Valora 
                                   GROUP BY idDocumento) as maxVal)
     ) AS comentarios;
```

## 12. Mostrar el numero de documentos que tiene cada categoria
```sql
SELECT 
    c.nombre AS nombreCategoria, 
    COUNT(d.idDocumento) AS numeroDocumentos
FROM 
    Categoria c
LEFT JOIN 
    Documento d ON c.idDocumento = d.idDocumento
GROUP BY 
    c.nombre;
```
