<?php
/**
*@package pXP
*@file gen-ACTClasificacion.php
*@author  (admin)
*@date 08-10-2013 14:41:56
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/
require_once(dirname(__FILE__).'/../reportes/RDetalleDepreciacionPDF.php');
class ACTClasificacion extends ACTbase{    
			
	function listarClasificacion(){
		$this->objParam->defecto('ordenacion','id_clasificacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODClasificacion','listarClasificacion');
		} else{
			$this->objFunc=$this->create('MODClasificacion');
			
			$this->res=$this->objFunc->listarClasificacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarClasificacion(){
		$this->objFunc=$this->create('MODClasificacion');	
		if($this->objParam->insertar('id_clasificacion')){
			$this->res=$this->objFunc->insertarClasificacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarClasificacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarClasificacion(){
			$this->objFunc=$this->create('MODClasificacion');	
		$this->res=$this->objFunc->eliminarClasificacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}

	function reporteDepreciacion(){

		$this->objFunc=$this->create('MODReporte');
		$this->res=$this->objFunc->reporteDepreciacion($this->objParam);
		//obtener titulo del reporte
		
		$titulo = 'Detalle de Depreciación';
		//Genera el nombre del archivo (aleatorio + titulo)
		$nombreArchivo=uniqid(md5(session_id()).$titulo);
		$nombreArchivo.='.pdf';
		$this->objParam->addParametro('orientacion','L');
		$this->objParam->addParametro('tamano','LETTER');
		$this->objParam->addParametro('nombre_archivo',$nombreArchivo);
		//Instancia la clase de pdf

		$this->objReporteFormato=new RDetalleDepreciacionPDF ($this->objParam);
		$this->objReporteFormato->setDatos($this->res->datos);
		$this->objReporteFormato->generarReporte();
		$this->objReporteFormato->output($this->objReporteFormato->url_archivo,'F');


		$this->mensajeExito=new Mensaje();
		$this->mensajeExito->setMensaje('EXITO','Reporte.php','Reporte generado',
			'Se generó con éxito el reporte: '.$nombreArchivo,'control');
		$this->mensajeExito->setArchivoGenerado($nombreArchivo);
		$this->mensajeExito->imprimirRespuesta($this->mensajeExito->generarJson());
	}
			
}

?>