<?php
/**
 *@package pXP
 *@file    ActivosReporte.php
 *@author  Espinoza Alvarez Franklin
 *@date    01-12-2014
 *@description Archivo con la interfaz para generación de reporte
 */
header("content-type: text/javascript; charset=UTF-8");
?>
<script>
    Phx.vista.ActivosReporte = Ext.extend(Phx.frmInterfaz, {

        Atributos : [

            {
                config:{
                    name : 'id_gestion',
                    origen : 'GESTION',
                    fieldLabel : 'Gestion',
                    allowBlank : false,
                    width:230,
                    listWidth:'230'
                },
                type : 'ComboRec',
                id_grupo : 0,
                form : true
            },
            {
                config:{
                    name : 'id_periodo',
                    origen : 'PERIODO',
                    fieldLabel : 'Periodo',
                    allowBlank : true,
                    pageSize:12,
                    width:230,
                    listWidth:'230',
                    disabled:true
                },
                type : 'ComboRec',
                id_grupo : 0,
                form : true
            },
            {
                config: {
                    name: 'clasificacion',
                    fieldLabel: 'Clasificacion',
                    typeAhead: false,
                    forceSelection: false,
                    hiddenName: 'clasificacion',
                    allowBlank: true,
                    emptyText: 'Elija una Opción...',
                    store: new Ext.data.JsonStore({
                        url: '../../sis_activos_fijos/control/Clasificacion/listarClasificacion',
                        id: 'clasificacion',
                        root: 'datos',
                        sortInfo: {
                            field: 'codigo',
                            direction: 'ASC'
                        },
                        totalProperty: 'total',
                        fields: ['codigo','descripcion', 'nivel', 'tipo'],
                        remoteSort: true,
                        baseParams: {par_filtro: 'codigo#descripcion#tipo'}
                    }),
                    valueField: 'codigo',
                    displayField: 'descripcion',
                    triggerAction: 'all',
                    lazyRender: true,
                    mode: 'remote',
                    pageSize: 15,
                    queryDelay: 200,
                    listWidth:230,
                    minChars: 25,
                    width:230,
                    tpl: '<tpl for="."><div class="x-combo-list-item"><p><b>Nivel:</b><strong style= "color : green;"> {tipo}</strong></p><p><b>Nombre:</b><strong style= "color : green;"> {descripcion}</strong></p> <p><b>Codigo:</b><strong style= "color : green;"> {codigo}</strong></p></div></tpl>'
                },
                type: 'ComboBox',
                id_grupo: 0,
                form: true
            },
            {
                config:{
                    name:'revalorizaciones',
                    fieldLabel:'Revalorizaciones',
                    typeAhead: true,
                    allowBlank:true,
                    triggerAction: 'all',
                    emptyText:'Elija una Opción...',
                    selectOnFocus:true,
                    mode:'local',
                    store:new Ext.data.ArrayStore({
                        fields: ['ID', 'valor'],
                        data :	[['todo','Activos Ajustes y Revalorizaciones'],
                                 ['activos','Solo Activos'],
                                 ['activos_ajustes','Activos y Ajustes'],
                                 ['ajustes','Solo Ajustes'],
                                 ['revalorizaciones','Solo Revalorizaciones'],
                                 ['activos_ajustados','Activos Ajustados'],
                                 ['activos_revalorizados','Activos Revalorizados'],
                                 ['activos_renovados','Activos Renovados'],
                                 ['renovaciones','Renovaciones'],
                                ]
                    }),
                    valueField:'ID',
                    displayField:'valor',
                    width:230

                },
                type:'ComboBox',
                id_grupo:0,
                form:true
            }
            /*,
            {
                config:{
                    name:'Nombre/Descripc',
                    fieldLabel:'nombre_desc',
                    typeAhead: true,
                    allowBlank:true,
                    triggerAction: 'all',
                    emptyText:'Elija una Opción...',
                    selectOnFocus:true,
                    mode:'local',
                    store:[
                        'Nombre',
                        'Descripcion'
                    ],
                    valueField:'ID',
                    displayField:'valor',
                    width:150

                },
                type:'ComboBox',
                id_grupo:0,
                form:true
            }*/
            /*,
            {
                config:{
                    name: 'fecha_hasta',
                    fieldLabel: 'Hasta',
                    allowBlank: false,

                    width: 200,
                    format: 'd/m/Y',
                    renderer:function (value,p,record){return value?value.dateFormat('d/m/Y'):''}
                },
                type:'DateField',
                filters:{pfiltro:'fecha_hasta',type:'date'},
                id_grupo:0,
                form:true
            },
            {
                config:{
                    name:'formato_reporte',
                    fieldLabel:'Formato del Reporte',
                    typeAhead: true,
                    allowBlank:true,
                    triggerAction: 'all',
                    emptyText:'Formato...',
                    selectOnFocus:true,
                    mode:'local',
                    store:new Ext.data.ArrayStore({
                        fields: ['ID', 'valor'],
                        data :	[['1','PDF'],
                            ['2','Excel']]
                    }),
                    valueField:'ID',
                    displayField:'valor',
                    width:200,

                },
                type:'ComboBox',
                id_grupo:0,
                form:true
            }*/
            ],
        title : 'Reporte Detalle Depreciación',
        ActSave : '../../sis_activos_fijos/control/Reporte/reporteDepreciacionXLS',
        

        topBar : true,
        botones : false,
        labelSubmit : 'Imprimir',
        tooltipSubmit : '<b>Generar Reporte Detalle Depreciación</b>',

        constructor : function(config) {
            Phx.vista.ActivosReporte.superclass.constructor.call(this, config);
            this.init();
            this.iniciarEventos();
        },

        iniciarEventos:function(){

            /*this.cmpFechaHasta = this.getComponente('fecha_hasta');
            this.cmpFormato = this.getComponente('formato_reporte');
            this.cmpNombreDesc = this.getComponente('nombre_desc');*/
            
            /*this.cmpFormatoReporte = this.getComponente('formato_reporte');
            this.cmpFechaIni = this.getComponente('fecha_ini');
            this.cmpFechaFin = this.getComponente('fecha_fin');
            this.cmpIdCuentaBancaria = this.getComponente('id_cuenta_bancaria');
            this.cmpEstado = this.getComponente('estado');
            this.cmpTipo = this.getComponente('tipo');
            this.cmpNombreBanco = this.getComponente('nombre_banco');
            this.cmpNroCuenta = this.getComponente('nro_cuenta');

            this.getComponente('finalidad').hide(true);
            this.cmpNroCuenta.hide(true);
            this.getComponente('id_finalidad').on('change',function(c,r,n){
                this.getComponente('finalidad').setValue(c.lastSelectionText);
            },this);

            this.cmpIdCuentaBancaria.on('select',function(c,r,n){
                this.cmpNombreBanco.setValue(r.data.nombre_institucion);
                this.cmpNroCuenta.setValue(c.lastSelectionText);
                this.getComponente('id_finalidad').reset();
                this.getComponente('id_finalidad').store.baseParams={id_cuenta_bancaria:c.value, vista: 'reporte'};
                this.getComponente('id_finalidad').modificado=true;
            },this);*/

            this.Cmp.id_gestion.on('select', function (cmb, record, index) {
                this.Cmp.id_periodo.reset();
                this.Cmp.id_periodo.setDisabled(false);
                this.Cmp.id_periodo.store.baseParams.id_gestion = record.data.id_gestion;
                this.Cmp.id_periodo.modificado = true;

            }, this);
            //this.Cmp.id_periodo.setDisabled(true);
        },

        onSubmit:function(o){
           /* if(this.cmpFormatoReporte.getValue()==2){
                var data = 'FechaIni=' + this.cmpFechaIni.getValue().format('d-m-Y');
                data = data + '&FechaFin=' + this.cmpFechaFin.getValue().format('d-m-Y');
                data = data + '&IdCuentaBancaria=' + this.cmpIdCuentaBancaria.getValue();
                data = data + '&Estado=' + this.cmpEstado.getValue();
                data = data + '&Tipo=' + this.cmpTipo.getValue();
                data = data + '&NombreBanco=' + this.cmpNombreBanco.getValue();
                data = data + '&NumeroCuenta=' + this.cmpNroCuenta.getValue();

                console.log(data);
                window.open('http://sms.obairlines.bo/LibroBancos/Home/VerLibroBancos?'+data);
                //window.open('http://localhost:2309/Home/VerLibroBancos?'+data);
            }else{*/

                Phx.vista.ActivosReporte.superclass.onSubmit.call(this,o);

        },

        tipo : 'reporte',
        clsSubmit : 'bprint'
    })
</script>