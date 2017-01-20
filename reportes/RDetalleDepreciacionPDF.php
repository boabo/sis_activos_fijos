<?php

class RDetalleDepreciacionPDF extends ReportePDF  {
    var $datos ;
    var $ancho_hoja;
    var $gerencia;
    var $numeracion;
    var $ancho_sin_totales;
    var $cantidad_columnas_estaticas;

    function Header(){

        $height = 5;
        $height2 = 40;
        $this->Image(dirname(__FILE__) . '/../../lib' . $_SESSION['_DIR_LOGO'], 5, 8, 60, 15);
        $this->SetFont('helvetica', 'B', 13);
        $this->Write(0, 'BOLIVIANA DE AVIACION', '', 0, 'C', true, 0, false, false, 0);
        $this->Write(0, 'DETALLE DEPRECIACION DE ACTIVOS FIJOS', '', 0, 'C', true, 0, false, false, 0);
        //$this->ln(0,5);
        $this->SetFont('helvetica','B',8);
        $this->Write(0, ' Al '.$this->objParam->getParametro('fecha_hasta'),'',0, 'C', true, 0, false, false, 0);
        $this->Write(0,/*$this->objParam->getParametro('oficina')*/' Expresado ', '', 0, 'C', true, 0, false, false,0);
        $this->Ln();
        $this->SetFont('helvetica','B',6);


        $height = 3;
        $blackAll = array('LTRB' =>array('width' => 0.3, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(0, 0, 0)));
        $this->SetFillColor(250,250,250, true);
        $this->setTextColor(0,0,0);


        $this->Cell(20, $height, 'Codigo', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(40, $height, 'Descripcion', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(13, $height, 'Inicio Dep.', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(18, $height, 'Compra (100%)', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(18, $height, 'Compra (80%)', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(18, $height, 'Inc. x Actualiz.', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(11, $height, 'Usada', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(11, $height, 'Residual', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(15, $height, 'Dep. Acum', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(15, $height, 'Act. Deprec', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(15, $height, 'Dep. Acum', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(15, $height, 'Dep. Gestion', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(15, $height, 'Dep. Acum.', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');
        $this->Cell(16, $height, 'Valor Residual', $blackAll, 0, 'C', true, '', 1, false, 'T', 'C');


    }

    function setDatos($datos) {
        /*var_dump($datos);
        exit;*/
        $this->datos = $datos;
    }
    function generarReporte() {



       /* $this->setFontSubsetting(false);
         $this->AddPage();
         $this->Ln(10);
         $this->SetFont('','B',9);

         $conf_det_tablewidths=array(18,20,45,30,30,20,20,25,40);
         $conf_det_tablealigns=array('C','C','C','C','C','C','C','C','C');

         $this->tablewidths=$conf_det_tablewidths;
         $this->tablealigns=$conf_det_tablealigns;


         $RowArray = array(

             'FRD',
             'Preimpreso',
             'Nombre y Apellido',
             'Datos de Contacto',
             'Motivo de Reclamo',
             'Fecha de Incidente',
             'Fecha de Recepcion',
             'Fecha Envio Oficina Central',
             'Detalle de Reclamo'
         );
         $this-> MultiRow($RowArray,false,1);
         $this->SetFont('','',8);
         $conf_det_tablewidths=array(18,20,45,30,30,20,20,25,40);
         $conf_det_tablealigns=array('C','C','L','C','C','C','C','C','J');
         $this->tablewidths=$conf_det_tablewidths;
         $this->tablealigns=$conf_det_tablealigns;

         foreach ($this->datos as $Row) {

             $RowArray = array(
                 'FRD' => $Row['nro_frd'],
                 'Preimpreso'=> $Row['correlativo_preimpreso_frd'],
                 'Nombre y Apellido' => $Row['nombre'],
                 'Datos de Contacto' => $Row['celular']."\n".$Row['telefono'],
                 'Motivo de Reclamo' => $Row['nombre_incidente']."\n".$Row['sub_incidente'],
                 'Fecha de Incedenteo' => date("d-M-Y", strtotime($Row['fecha_hora_incidente'])) ,
                 'Fecha de Recepcion' =>  date("d-M-Y", strtotime($Row['fecha_hora_recepcion'])),
                 'Fecha Envio Oficina Central' =>  $Row['fecha_hora_recepcion_sac'], // cambiar formato recordatorio
                 'Observaciones' => $Row['detalle_incidente']."\n",


             );

             $this-> MultiRow($RowArray);

         }*/
        //$this->Ln(10);
    }
}
?>