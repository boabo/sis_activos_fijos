CREATE OR REPLACE FUNCTION "af"."ft_clasificacion_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Activos Fijos
 FUNCION: 		af.ft_clasificacion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'af.tclasificacion'
 AUTOR: 		 (admin)
 FECHA:	        08-10-2013 14:41:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_clasificacion	integer;
			    
BEGIN

    v_nombre_funcion = 'af.ft_clasificacion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'AF_CLAS_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-10-2013 14:41:56
	***********************************/

	if(p_transaccion='AF_CLAS_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into af.tclasificacion(
			estado,
			sw_dep,
			tipo,
			codigo,
			correlativo_act,
			descripcion,
			estado_reg,
			id_clasificacion_fk,
			nivel,
			vida_util,
			ini_correlativo,
			id_metodo_depreciacion,
			id_usuario_reg,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.estado,
			v_parametros.sw_dep,
			v_parametros.tipo,
			v_parametros.codigo,
			v_parametros.correlativo_act,
			v_parametros.descripcion,
			'activo',
			v_parametros.id_clasificacion_fk,
			v_parametros.nivel,
			v_parametros.vida_util,
			v_parametros.ini_correlativo,
			v_parametros.id_metodo_depreciacion,
			p_id_usuario,
			now(),
			null,
			null
							
			)RETURNING id_clasificacion into v_id_clasificacion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificación almacenado(a) con exito (id_clasificacion'||v_id_clasificacion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacion',v_id_clasificacion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'AF_CLAS_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-10-2013 14:41:56
	***********************************/

	elsif(p_transaccion='AF_CLAS_MOD')then

		begin
			--Sentencia de la modificacion
			update af.tclasificacion set
			estado = v_parametros.estado,
			sw_dep = v_parametros.sw_dep,
			tipo = v_parametros.tipo,
			codigo = v_parametros.codigo,
			correlativo_act = v_parametros.correlativo_act,
			descripcion = v_parametros.descripcion,
			id_clasificacion_fk = v_parametros.id_clasificacion_fk,
			nivel = v_parametros.nivel,
			vida_util = v_parametros.vida_util,
			ini_correlativo = v_parametros.ini_correlativo,
			id_metodo_depreciacion = v_parametros.id_metodo_depreciacion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario
			where id_clasificacion=v_parametros.id_clasificacion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificación modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacion',v_parametros.id_clasificacion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'AF_CLAS_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-10-2013 14:41:56
	***********************************/

	elsif(p_transaccion='AF_CLAS_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from af.tclasificacion
            where id_clasificacion=v_parametros.id_clasificacion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificación eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacion',v_parametros.id_clasificacion::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "af"."ft_clasificacion_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
