USE Venturi 
GO
IF OBJECT_ID('tempdb..@TMPFACTURA') IS NOT NULL
			--DROP TABLE @TMPFACTURA

DECLARE @TMPFACTURA TABLE(

  G            nvarchar(5)null,
  TYP		   nvarchar(max)null,
  NUM		   nvarchar(max)null,
  FCY		   nvarchar(max)null,
  JOU		   nvarchar(max)null,
  ACCDAT	   nvarchar(max)null,
  DESVCR	   nvarchar(max)null,
  CUR		   nvarchar(max)null,
  DACDIA	   nvarchar(max)null,
  RATMLT	   nvarchar(max)null,
  DUDDAT	   nvarchar(max)null,
  FLGPAZ	   nvarchar(max)null,
  FLGFUP	   nvarchar(max)null,
  REF		   nvarchar(max)null,
  BPRVCR	   nvarchar(max)null,
  ENTDAT	   nvarchar(max)null,
  RATDAT	   nvarchar(max)null,
  
  D            nvarchar (5)null,
  TYP1		   nvarchar (max)null,
  NUM1		   nvarchar (max)null,
  LIN		   nvarchar (max)null,
  LEDTYP	   nvarchar (max)null,
  IDTLIN	   nvarchar (max)null,
  FCYLIN	   nvarchar (max)null,
  SAC		   nvarchar (max)null,
  ACC		   nvarchar (max)null,
  BPR		   nvarchar (max)null,
  DES1		   nvarchar (max)null,
  SNS		   nvarchar (max)null,
  AMTCUR	   nvarchar (max)null,
  CUR1		   nvarchar (max)null
  
  			   
)
--============================================================================================================
INSERT INTO @TMPFACTURA

SELECT DISTINCT TOP 100
     'G'     AS  'G',
     'VMI'   AS  'TYP',                                                     --Tipo de asiento

     'VMI'+'-'+C.CO_CODIGO+C.CO_SUCURS+C.CO_NUMERO AS  'NUM',          --Número de asiento

     c.CO_SUCURS  AS  'FCY',                                --Planta
     'VMI'        AS  'JOU',                                --Diario
     '01-01-2022' AS  'ACCDAT',                             --Fecha contable
     'IMPORTACIÓN DE PRUEBA FACTURA DE VENTA'      AS  'DESVCR',                             --Descripción 
     'ARS'        AS  'CUR',                                --Divisa de asiento
     'STDCO'      AS  'DACDIA',                             --Transacción
     '1'          AS  'RATMLT',                             --Cambio multiplicador
     c.CO_FECHA   AS  'DUDDAT',                             --Fecha de vencimiento
     '4'     AS  'FLGPAZ',                             --Autorización de pago 
     ''      AS  'FLGFUP',                             --Reclamación
	 ''      AS  'REF',                                --Referencia
     c.CO_CODIGO+c.CO_SUCURS+c.CO_NUMERO     AS  'BPRVCR',                             --Documento de origen
     ''      AS  'ENTDAT',                             --Fecha de entrada 
     ''      AS  'RATDAT',                             --Fecha de cambio
	 
    

     --	========================================================================================------
	
	 'D'      AS  'D',                                 --Indicador D
     'VMI'      AS  'TYP',                                --Tipo de asiento
     'VMI'+'-'+C.CO_CODIGO+C.CO_SUCURS+C.CO_NUMERO      AS  'NUM',								   --Número de asiento
     RIGHT( Row_number () Over(order by (select c.CO_CODIGO)ASC),5)      AS  'LIN',                                --Número de linea
     '1'      AS  'LEDTYP',                             --Tipo de referencia
     RIGHT( Row_number () Over(order by (select c.CO_CODIGO)ASC),5)      AS  'IDTLIN',                             --Identificador 
     c.CO_SUCURS      AS  'FCYLIN',                             --Planta
     'MVD'            AS  'SAC',                                --CTA.CTROL              ES FIJO EN LA PRIMERA LINEA 1 DISTINTO EN LA SEGUNDA
     ''       AS  'ACC',                                --Cuentas generales      ES FIJO EN LA PRIMERA LINEA 1 DISTINTO EN LA SEGUNDA
     ''/*cl.CL_CODIGO  */    AS  'BPR',                                --Tercero   ---CLIENTES 
     'IMPORTACIÓN DE FACTURA DE VENTA PRUEBA'      AS  'DES',                                --Descripción 
     ''      AS  'SNS',								   --Signo                        DEBE HABER
     ''      AS  'AMTCUR',                             --Importe de asiento
     'ARS'   AS  'CUR'                              --Divisa de asiento
		     
		     


FROM COMPROBANTES C
LEFT JOIN CLIENTES cl
ON cl.CL_CODIGO=C.CL_CODIGO








--===========================================================================================================================================--



	iF OBJECT_ID('tempdb..#TMP_G') IS NOT NULL
		DROP TABLE #TMP_G

		CREATE TABLE #TMP_G (
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
		Dato18 NVARCHAR(MAX) NULL
		
	)

	iF OBJECT_ID('tempdb..#TMP_D') IS NOT NULL
		DROP TABLE #TMP_D

		CREATE TABLE #TMP_D (
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
		Dato18 NVARCHAR(MAX) NULL
		
	)


--INDICADOR G
INSERT INTO #TMP_G (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17,Dato18)

SELECT TF.G,TF.TYP,TF.NUM,TF.FCY,TF.JOU,TF.ACCDAT,TF.DESVCR,TF.CUR,TF.DACDIA,TF.RATMLT,TF.DUDDAT,TF.FLGPAZ,TF.FLGFUP,TF.REF,TF.BPRVCR,TF.ENTDAT,TF.RATDAT,TF.LIN

FROM @TMPFACTURA TF


--INDICADOR D

INSERT INTO #TMP_D(Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17,Dato18)

SELECT TF.D,TF.TYP1,TF.NUM1,TF.LIN,TF.LEDTYP,TF.IDTLIN,TF.FCYLIN,TF.SAC,TF.ACC,TF.BPR,TF.DES1,TF.SNS,TF.AMTCUR,TF.CUR1,'','','',TF.LIN

FROM @TMPFACTURA TF

GO



;WITH cteFactura(Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17,Dato18)
 as (
     SELECT DISTINCT Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17,Dato18
	 FROM #TMP_G

	 UNION ALL

	 SELECT   Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17,Dato18
	 FROM #TMP_D
	 
	 )
SELECT   * FROM cteFactura ct 
ORDER BY Dato18

 


