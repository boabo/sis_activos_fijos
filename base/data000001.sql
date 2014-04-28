
/***********************************I-DAT-RAC-AF-0-12/03/2014*****************************************/


INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('AF', 'Activos Fijos', '2013-02-06', 'AF', 'activo', 'activos_fijos', NULL);

--

----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------

select pxp.f_insert_tgui ('SISTEMA DE ACTIVOS FIJOS', '', 'AF', 'si', , '', 1, '', '', 'AF');
select pxp.f_insert_tgui ('Preingreso', 'Preingreso de Activos Fijos', 'PREIACT', 'si', 1, 'sis_almacenes/vista/preingreso/PreingresoAct.php', 2, '', 'PreingresoAct', 'AF');
select pxp.f_insert_testructura_gui ('AF', 'SISTEMA');
select pxp.f_insert_testructura_gui ('PREIACT', 'AF');

/***********************************F-DAT-RAC-AF-0-12/03/2014*****************************************/


/***********************************I-DAT-JRR-AF-0-24/04/2014*****************************************/
select pxp.f_insert_tgui ('Chequear documento del WF', 'Chequear documento del WF', 'PREIACT.1', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 3, '', '90%', 'AF');
select pxp.f_insert_tgui ('Detalle Preingreso', 'Detalle Preingreso', 'PREIACT.2', 'no', 0, 'sis_almacenes/vista/preingreso_det/PreingresoDet.php', 3, '', '50%', 'AF');
select pxp.f_insert_tgui ('Catálogo', 'Catálogo', 'PREIACT.3', 'no', 0, 'sis_parametros/vista/catalogo/Catalogo.php', 3, '', 'Catalogo', 'AF');
select pxp.f_insert_tgui ('Subir Archivo', 'Subir Archivo', 'PREIACT.1.1', 'no', 0, 'sis_workflow/vista/documento_wf/SubirArchivoWf.php', 4, '', 'SubirArchivoWf', 'AF');
select pxp.f_insert_tgui ('Estados por momento', 'Estados por momento', 'PREIACT.1.2', 'no', 0, 'sis_workflow/vista/tipo_documento_estado/TipoDocumentoEstadoWF.php', 4, '', 'TipoDocumentoEstadoWF', 'AF');
select pxp.f_insert_tgui ('Items', 'Items', 'PREIACT.2.1', 'no', 0, 'sis_almacenes/vista/item/BuscarItem.php', 4, '', 'BuscarItem', 'AF');
select pxp.f_insert_tgui ('Catálogo', 'Catálogo', 'PREIACT.2.2', 'no', 0, 'sis_parametros/vista/catalogo/Catalogo.php', 4, '', 'Catalogo', 'AF');
select pxp.f_insert_tgui ('Existencia de Materiales por Almacén', 'Existencia de Materiales por Almacén', 'PREIACT.2.1.1', 'no', 0, 'sis_almacenes/vista/item/ItemExistenciaAlmacen.php', 5, '', '30%', 'AF');
select pxp.f_insert_tfuncion ('af.ft_clasificacion_sel', 'Funcion para tabla     ', 'AF');
select pxp.f_insert_tfuncion ('af.ft_clasificacion_ime', 'Funcion para tabla     ', 'AF');
select pxp.f_insert_tprocedimiento ('AF_CLAS_SEL', 'Consulta de datos', 'si', '', '', 'af.ft_clasificacion_sel');
select pxp.f_insert_tprocedimiento ('AF_CLAS_CONT', 'Conteo de registros', 'si', '', '', 'af.ft_clasificacion_sel');
select pxp.f_insert_tprocedimiento ('AF_CLAS_INS', 'Insercion de registros', 'si', '', '', 'af.ft_clasificacion_ime');
select pxp.f_insert_tprocedimiento ('AF_CLAS_MOD', 'Modificacion de registros', 'si', '', '', 'af.ft_clasificacion_ime');
select pxp.f_insert_tprocedimiento ('AF_CLAS_ELI', 'Eliminacion de registros', 'si', '', '', 'af.ft_clasificacion_ime');
select pxp.f_insert_testructura_gui ('PREIACT.1', 'PREIACT');
select pxp.f_insert_testructura_gui ('PREIACT.2', 'PREIACT');
select pxp.f_insert_testructura_gui ('PREIACT.3', 'PREIACT');
select pxp.f_insert_testructura_gui ('PREIACT.1.1', 'PREIACT.1');
select pxp.f_insert_testructura_gui ('PREIACT.1.2', 'PREIACT.1');
select pxp.f_insert_testructura_gui ('PREIACT.2.1', 'PREIACT.2');
select pxp.f_insert_testructura_gui ('PREIACT.2.2', 'PREIACT.2');
select pxp.f_insert_testructura_gui ('PREIACT.2.1.1', 'PREIACT.2.1');
select pxp.f_insert_tprocedimiento_gui ('WF_GATNREP_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ALM_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DEPFILUSU_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREING_INS', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREING_MOD', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREING_ELI', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREING_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_INGRES_GEN', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREING_REV', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DEPUSUCOMB_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_MONEDA_SEL', 'PREIACT', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DWF_MOD', 'PREIACT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DWF_ELI', 'PREIACT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DWF_SEL', 'PREIACT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_CABMOM_IME', 'PREIACT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DOCWFAR_MOD', 'PREIACT.1.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_TIPPROC_SEL', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_TIPES_SEL', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DES_INS', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DES_MOD', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DES_ELI', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('WF_DES_SEL', 'PREIACT.1.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ITEMNOTBASE_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ALM_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('AF_CLAS_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_DEPUSUCOMB_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREDET_INS', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREDET_MOD', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREDET_ELI', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_PREDET_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'PREIACT.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('ALM_CLA_ARB_SEL', 'PREIACT.2.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ARB_SEL', 'PREIACT.2.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ITMSRCHARB_SEL', 'PREIACT.2.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SAL_ITMALM_SEL', 'PREIACT.2.1.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_SUBSIS_SEL', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_PACATI_SEL', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_INS', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_MOD', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_ELI', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_SEL', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'PREIACT.2.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_SUBSIS_SEL', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_PACATI_SEL', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_INS', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_MOD', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_ELI', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_SEL', 'PREIACT.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'PREIACT.3', 'no');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'WF_DES_SEL', 'PREIACT.1.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'WF_DWF_SEL', 'PREIACT.1');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SEG_SUBSIS_SEL', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_PACATI_SEL', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_SEL', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CATCMB_SEL', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_INS', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_MOD', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_ELI', 'PREIACT.3');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SEG_SUBSIS_SEL', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_PACATI_SEL', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_SEL', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CATCMB_SEL', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_INS', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_MOD', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CAT_ELI', 'PREIACT.2.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_ITMALM_SEL', 'PREIACT.2.1.1');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'ALM_CLA_ARB_SEL', 'PREIACT.2.1');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_ARB_SEL', 'PREIACT.2.1');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_ITMSRCHARB_SEL', 'PREIACT.2.1');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'PM_CATCMB_SEL', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_ITEMNOTBASE_SEL', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_ALM_SEL', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_PREDET_SEL', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_PREDET_INS', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_PREDET_MOD', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'SAL_PREDET_ELI', 'PREIACT.2');
select pxp.f_insert_trol_procedimiento_gui ('ADQ - Preingreso AF', 'AF_CLAS_SEL', 'PREIACT.2');

/***********************************F-DAT-JRR-AF-0-24/04/2014*****************************************/