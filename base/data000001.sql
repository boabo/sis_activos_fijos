
/***********************************I-DAT-RAC-AF-0-12/03/2014*****************************************/


INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('AF', 'Activos Fijos', '2013-02-06', 'AF', 'activo', 'activos_fijos', NULL);

--

----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------

select pxp.f_insert_tgui ('SISTEMA DE ACTIVOS FIJOS', 
                          '', 
                          'AF', 
                          'si', 
                          1, 
                          '', 
                          1, 
                          '', 
                          '', 
                          'AF');
                          
                          
select pxp.f_insert_tgui ('Preingreso',  
                          'Preingreso de Activos Fijos', 
                          'PREIACT', 
                          'si', 
                          1, 
                          'sis_almacenes/vista/preingreso/PreingresoAct.php', 
                          2, 
                          '', 
                          'PreingresoAct', 
                          'AF');
                          
                          
select pxp.f_insert_testructura_gui ('AF', 'SISTEMA');
select pxp.f_insert_testructura_gui ('PREIACT', 'AF');

/***********************************F-DAT-RAC-AF-0-12/03/2014*****************************************/
