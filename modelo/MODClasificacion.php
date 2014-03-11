<?php
/**
*@package pXP
*@file gen-MODClasificacion.php
*@author  (admin)
*@date 08-10-2013 14:41:56
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODClasificacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarClasificacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='af.ft_clasificacion_sel';
		$this->transaccion='AF_CLAS_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_clasificacion','int4');
		$this->captura('estado','varchar');
		$this->captura('sw_dep','varchar');
		$this->captura('tipo','varchar');
		$this->captura('codigo','varchar');
		$this->captura('correlativo_act','int4');
		$this->captura('descripcion','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_clasificacion_fk','int4');
		$this->captura('nivel','int4');
		$this->captura('vida_util','int4');
		$this->captura('ini_correlativo','int4');
		$this->captura('id_metodo_depreciacion','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarClasificacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='af.ft_clasificacion_ime';
		$this->transaccion='AF_CLAS_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado','estado','varchar');
		$this->setParametro('sw_dep','sw_dep','varchar');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('correlativo_act','correlativo_act','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_clasificacion_fk','id_clasificacion_fk','int4');
		$this->setParametro('nivel','nivel','int4');
		$this->setParametro('vida_util','vida_util','int4');
		$this->setParametro('ini_correlativo','ini_correlativo','int4');
		$this->setParametro('id_metodo_depreciacion','id_metodo_depreciacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarClasificacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='af.ft_clasificacion_ime';
		$this->transaccion='AF_CLAS_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_clasificacion','id_clasificacion','int4');
		$this->setParametro('estado','estado','varchar');
		$this->setParametro('sw_dep','sw_dep','varchar');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('correlativo_act','correlativo_act','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_clasificacion_fk','id_clasificacion_fk','int4');
		$this->setParametro('nivel','nivel','int4');
		$this->setParametro('vida_util','vida_util','int4');
		$this->setParametro('ini_correlativo','ini_correlativo','int4');
		$this->setParametro('id_metodo_depreciacion','id_metodo_depreciacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarClasificacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='af.ft_clasificacion_ime';
		$this->transaccion='AF_CLAS_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_clasificacion','id_clasificacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>