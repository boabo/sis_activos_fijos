/***********************************I-SCP-RCM-AF-1-04/10/2013****************************************/
CREATE TABLE af.tclasificacion (
  id_clasificacion SERIAL NOT NULL, 
  codigo VARCHAR(20) NOT NULL, 
  descripcion VARCHAR(200), 
  sw_dep VARCHAR(2) DEFAULT 'no'::character varying NOT NULL, 
  estado VARCHAR(10) DEFAULT 'activo'::character varying NOT NULL, 
  id_metodo_depreciacion INTEGER, 
  vida_util INTEGER, 
  id_clasificacion_fk INTEGER, 
  tipo VARCHAR(20), 
  nivel INTEGER, 
  correlativo_act INTEGER, 
  ini_correlativo INTEGER, 
  CONSTRAINT tclasificacion_codigo_key UNIQUE(codigo), 
  CONSTRAINT tclasificacion_pkey PRIMARY KEY(id_clasificacion), 
  CONSTRAINT tclasificacion_fijo_estado_check CHECK ((((estado)::text = 'activo'::text) OR ((estado)::text = 'inactivo'::text)) OR ((estado)::text = 'eliminado'::text)), 
  CONSTRAINT tclasificacion_sw_dep_check CHECK (((sw_dep)::text = 'si'::text) OR ((sw_dep)::text = 'no'::text)), 
  CONSTRAINT tclasificacion_tipo_check CHECK ((((tipo)::text = ('tipo'::character varying)::text) OR ((tipo)::text = ('subtipo'::character varying)::text)) OR ((tipo)::text = ('rama'::character varying)::text))
) INHERITS (pxp.tbase) 
WITHOUT OIDS;
/***********************************F-SCP-RCM-AF-1-04/10/2013****************************************/

