CREATE OR REPLACE FUNCTION "af"."ft_clasificacion_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Sistema de Activos Fijos
 FUNCION: 		af.ft_clasificacion_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'af.tclasificacion'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'af.ft_clasificacion_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'AF_CLAS_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		08-10-2013 14:41:56
	***********************************/

	if(p_transaccion='AF_CLAS_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						clas.id_clasificacion,
						clas.estado,
						clas.sw_dep,
						clas.tipo,
						clas.codigo,
						clas.correlativo_act,
						clas.descripcion,
						clas.estado_reg,
						clas.id_clasificacion_fk,
						clas.nivel,
						clas.vida_util,
						clas.ini_correlativo,
						clas.id_metodo_depreciacion,
						clas.id_usuario_reg,
						clas.fecha_reg,
						clas.fecha_mod,
						clas.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from af.tclasificacion clas
						inner join segu.tusuario usu1 on usu1.id_usuario = clas.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = clas.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'AF_CLAS_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		08-10-2013 14:41:56
	***********************************/

	elsif(p_transaccion='AF_CLAS_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_clasificacion)
					    from af.tclasificacion clas
					    inner join segu.tusuario usu1 on usu1.id_usuario = clas.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = clas.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
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
ALTER FUNCTION "af"."ft_clasificacion_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
