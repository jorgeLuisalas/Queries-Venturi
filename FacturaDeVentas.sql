use Venturi
go


declare @TMP_factura TABLE
(
   G		 VARCHAR(MAX)NULL,
   TYP		 VARCHAR(MAX)NULL,
   NUM		 VARCHAR(MAX)NULL,
   FCY		 VARCHAR(MAX)NULL,
   JOU		 VARCHAR(MAX)NULL,
   ACCDAT	 VARCHAR(MAX)NULL,
   DESVCR	 VARCHAR(MAX)NULL,
   CUR		 VARCHAR(MAX)NULL,
   DACDIA	 VARCHAR(MAX)NULL,
   RATMLT	 VARCHAR(MAX)NULL,
   DUDDAT	 VARCHAR(MAX)NULL,
   FLGPAZ	 VARCHAR(MAX)NULL,
   FLGFUP	 VARCHAR(MAX)NULL,
   REF		 VARCHAR(MAX)NULL,
   BPRVCR	 VARCHAR(MAX)NULL,
   ENTDAT	 VARCHAR(MAX)NULL,
   RATDAT    VARCHAR(MAX)NULL,

   D         VARCHAR(MAX)NULL,
   TYP1		 VARCHAR(MAX)NULL,
   NUM1		 VARCHAR(MAX)NULL,
   LIN		 VARCHAR(MAX)NULL,
   LEDTYP	 VARCHAR(MAX)NULL,
   IDTLIN	 VARCHAR(MAX)NULL,
   FCYLIN	 VARCHAR(MAX)NULL,
   SAC		 VARCHAR(MAX)NULL,
   ACC		 VARCHAR(MAX)NULL,
   BPR		 VARCHAR(MAX)NULL,
   DES1		 VARCHAR(MAX)NULL,
   SNS		 VARCHAR(MAX)NULL,
   AMTCUR	 VARCHAR(MAX)NULL,
   CUR1      VARCHAR(MAX)NULL

   



)


INSERT INTO @TMP_factura

SELECT   
     'G'     AS  'G',
     'VMI'   AS  'TYP',                                          --Tipo de asiento

     ct.COMPROBANTE AS  'NUM',                                   --Número de asiento

     '0001'  AS  'FCY',                                          --Planta
     'VMI'        AS  'JOU',                                     --Diario
     '20220101' AS  'ACCDAT',                                    --Fecha contable
     'IMPORTACIÓN DE PRUEBA FACTURA DE VENTA'      AS  'DESVCR', --Descripción 
     'ARS'        AS  'CUR',                                     --Divisa de asiento
     'STDCO'      AS  'DACDIA',                                  --Transacción
     '1'          AS  'RATMLT',                                  --Cambio multiplicador
     ct.fecha AS  'DUDDAT' ,                                     --Fecha de vencimiento
     '4'     AS  'FLGPAZ',                                       --Autorización de pago 
     ''      AS  'FLGFUP',                                       --Reclamación
	 ''      AS  'REF',                                          --Referencia
     replace(ct.COMPROBANTE,'VMI-','')     AS  'BPRVCR',         --Documento de origen
     ''      AS  'ENTDAT',                                       --Fecha de entrada 
     ''      AS  'RATDAT',                                       --Fecha de cambio
	 
    

     --	========================================================================================------
	
	 'D'      AS  'D',                                          --Indicador D
     'VMI'      AS  'TYP',                                      --Tipo de asiento
     ct.COMPROBANTE       AS  'NUM',   --Número de asiento
     cc.id       AS  'LIN',                                     --Número de linea
     '1'      AS  'LEDTYP',                                     --Tipo de referencia
     cc.id        AS  'IDTLIN',                                 --Identificador 
     '0000'      AS  'FCYLIN',                                  --Planta
     'CCC'            AS  'SAC',                                --CTA.CTROL              ES FIJO EN LA PRIMERA LINEA 1 DISTINTO EN LA SEGUNDA
     cc.cuenta        AS  'ACC',                                --Cuentas generales      ES FIJO EN LA PRIMERA LINEA 1 DISTINTO EN LA SEGUNDA
     ct.codigoCliente AS  'BPR',                                --Tercero   ---CLIENTES 
     'IMPORTACIÓN DE FACTURA DE VENTA PRUEBA'      AS  'DES',   --Descripción 
     cc.signo      AS  'SNS',								    --Signo                  DEBE HABER
     ct.importe     AS  'AMTCUR',                               --Importe de asiento
     'ARS'   AS  'CUR'                                          --Divisa de asiento


	 --	========================================================================================------

	 

 

 
from ComprobantesTemporarios ct
cross join 
ctaControl cc




IF OBJECT_ID('tempdb..##TMP_GRID') IS NOT NULL
			DROP TABLE ##TMP_GRID

 CREATE TABLE ##TMP_GRID(
    Dato1 NVARCHAR(MAX) NULL,
	Dato2 NVARCHAR(MAX) NULL,
	Dato3 NVARCHAR(MAX) NULL,
	Dato4 NVARCHAR(MAX) NULL,
	Dato5 NVARCHAR(MAX) NULL,
	Dato6 NVARCHAR(MAX) NULL,
	Dato7 NVARCHAR(MAX) NULL,
	Dato8 NVARCHAR(MAX) NULL,
	Dato9 NVARCHAR(MAX) NULL,
	Dato10 NVARCHAR(MAX) NULL,
	Dato11 NVARCHAR(MAX) NULL,
	Dato12 NVARCHAR(MAX) NULL,
	Dato13 NVARCHAR(MAX) NULL,
	Dato14 NVARCHAR(MAX) NULL,
	Dato15 NVARCHAR(MAX) NULL,
	Dato16 NVARCHAR(MAX) NULL,
	Dato17 NVARCHAR(MAX) NULL,
	Dato18 NVARCHAR(MAX) NULL,
	Dato19 NVARCHAR(MAX) NULL,
	Dato20 NVARCHAR(MAX) NULL,
	Dato21 NVARCHAR(MAX) NULL,
	Dato22 NVARCHAR(MAX) NULL,
	Dato23 NVARCHAR(MAX) NULL,
	Dato24 NVARCHAR(MAX) NULL,
	Dato25 NVARCHAR(MAX) NULL


	
	)

	DECLARE @categoria nvarchar (20)
	DECLARE @codigoCliente NVARCHAR(MAX)
	DECLARE @sigla NVARCHAR(MAX) 
	DECLARE @familiaEstadististica NVARCHAR(MAX)

	SET @categoria= ''
	SET @codigoCliente = ''
	SET @sigla = ''
	SET @familiaEstadististica = ''
	/* IMPLEMENTAR UNA TABLA TEMPORAL QUE REGISTRE EN BASE A LA QUERY DE COMPROBANTES "NO PAGO",GENERAR UNA TABLA APARTE CON LOS DATOS DEL CLIENTE CL-CODIGO 
	   Y EL NUMERO DE COMPROBANTES NO PAGO .CREANDO LAS VARIABLES  EN LA QUERY PRINCIPAL  Y  ASIGNANDOLA   EN EL CURSOR COMPARANDO LAS 2 TABLAS */

	DECLARE FACTURA CURSOR FAST_FORWARD
	FOR
        SELECT   *
		FROM Venturi.dbo.cMF
		
		

	OPEN FACTURA

	FETCH   FACTURA INTO @categoria,@codigoCliente, @sigla, @familiaEstadististica

	WHILE(@@FETCH_STATUS=0)
	BEGIN

	INSERT INTO ##TMP_GRID
	 SELECT  DISTINCT
	 TF.G,TF.TYP,TF.NUM,TF.FCY,TF.JOU,TF.ACCDAT,TF.DESVCR,TF.CUR,TF.DACDIA,TF.RATMLT,REPLACE (TF.DUDDAT,'-',''),TF.FLGPAZ,TF.FLGFUP,TF.REF,TF.BPRVCR,TF.ENTDAT,TF.RATDAT,'','','','','','','',''
	 FROM @TMP_factura TF,
	 Venturi.dbo.cMF clientesSiglas
	 WHERE TF.BPR = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente  
	
	 
     INSERT INTO ##TMP_GRID
	 SELECT DISTINCT  
	 TF.D,TF.TYP1,TF.NUM1,TF.LIN,TF.LEDTYP,TF.IDTLIN,TF.FCYLIN,TF.SAC,TF.ACC,clientesSiglas.codigoCliente,TF.DES1,TF.SNS,TF.AMTCUR,TF.CUR1,'','','','','','','','','','',''
	 FROM @TMP_factura TF,
	 Venturi.dbo.cMF clientesSiglas
	 WHERE TF.BPR = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 


	
        FETCH FACTURA INTO @categoria,@codigoCliente, @sigla, @familiaEstadististica
        END
        CLOSE FACTURA
        DEALLOCATE FACTURA
		



		SELECT	isnull(tmpGrid.Dato1,  ''), isnull(tmpGrid.Dato2, ''),  isnull(tmpGrid.Dato3, ''),  isnull(tmpGrid.Dato4, ''),  isnull(tmpGrid.Dato5, ''),
		        isnull(tmpGrid.Dato6,  ''), isnull(tmpGrid.Dato7, ''),  isnull(tmpGrid.Dato8, ''),  isnull(tmpGrid.Dato9, ''),  isnull(tmpGrid.Dato10, ''),
		        isnull(tmpGrid.Dato11, ''), isnull(tmpGrid.Dato12, ''), isnull(tmpGrid.Dato13, ''), isnull(tmpGrid.Dato14, ''), isnull(tmpGrid.Dato15, ''),
		        isnull(tmpGrid.Dato16, ''), isnull(tmpGrid.Dato17, ''), isnull(tmpGrid.Dato18, ''), isnull(tmpGrid.Dato19, ''), isnull(tmpGrid.Dato20, ''),
				isnull(tmpGrid.Dato21, ''),isnull(tmpGrid.Dato22, ''),isnull(tmpGrid.Dato23, ''),isnull(tmpGrid.Dato24, ''),isnull(tmpGrid.Dato25, '')

		FROM	##TMP_GRID tmpGrid
	

	






