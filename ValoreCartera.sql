use Venturi
go

use venturiFabrica
go

IF OBJECT_ID('tempdb..@CHEQUES') IS NOT NULL
              

DECLARE @CHEQUES TABLE


(
P           NVARCHAR(MAX),
NUM 		NVARCHAR(MAX),	      --Nº Pago
PAYTYP		NVARCHAR(MAX),        --Transacción
CHQTYP		NVARCHAR(MAX),	      --Tipo de cheque
BPR	        NVARCHAR(MAX),        --Tercero
ACC	        NVARCHAR(MAX),        --Cuenta
CHQBAN	    NVARCHAR(MAX),        --Establec. Pagador
CHQNUM	    NVARCHAR(MAX),        --Número de cheque
PAM	        NVARCHAR(MAX),        --Forma de pago
FCY	        NVARCHAR(MAX),        --Planta
BAN	        NVARCHAR(MAX),        --Banco
SNS	        NVARCHAR(MAX),        --Sentido
CUR	        NVARCHAR(MAX),        --Divisa
AMTCUR	    NVARCHAR(MAX),        --Importe
ACCDAT	    NVARCHAR(MAX),        --Fecha Contable
DUDDAT	    NVARCHAR(MAX) ,       --Fecha Vencimiento
STA  	    NVARCHAR(MAX),        --Estado
[DES]       NVARCHAR(MAX),        --Descripción

 --█████████████████████████████████████████████████████████████████████████████████

D			NVARCHAR(MAX) ,	                  
LIN	        NVARCHAR(MAX),                 --Nro. Línea
DENCOD	    NVARCHAR(MAX),                 --Destino
ACCD	    NVARCHAR(MAX),                 --Cuentas generales
BPRLIN	    NVARCHAR(MAX),                 --Cliente
VCRTYP	    NVARCHAR(MAX),                 --Tipo Asiento
VCRNUM	    NVARCHAR(MAX),                 --Asiento
PAYMENTD1	NVARCHAR(MAX), 	               --
PAYMENTD2	NVARCHAR(MAX), 	               --
PAYMENTD3	NVARCHAR(MAX), 	               --
PAYMENTD4	NVARCHAR(MAX), 	               --
CURLIN	    NVARCHAR(MAX),                 --Divisa
AMTLIN	    NVARCHAR(MAX),                 --Importe
QTYLIN	    NVARCHAR(MAX),                 --Cantidad 
DSP	        NVARCHAR(MAX)                  --Distribución


)

INSERT INTO @CHEQUES
--la query se acomoda de manera manual en el excel para poder realizar modificaciones correspondiente y evitar errores
SELECT 
 'P'   AS 'P',
 ''   AS 'NUM ',
 'CCHD'   AS 'PAYTYP' ,
 '1'   AS 'CHQTYP' ,
  C.codigoCliente  AS 'BPR',              --averiguar nombre del terceroo de la  query que devuelve zeus y vincular el codigo que esta en la tabla cheques creada para buscar el codigodel sage
 '99999997'   AS 'ACC',            --averiguar que cuenta control es 
 DC.BA_CODIGO+dc.DO_PLAZA 'CHQBAN',  --ARREGLARLO CON LAS SUCURSALES DEL SAGE 
 DC.DO_NUMERO   AS 'CHQNUM',
 ''   AS 'PAM',
 ''   AS 'FCY',
 ''   AS 'BAN',
 '2'   AS 'SNS',
 'ARS'  AS 'CUR',
 dc.DO_IMPORT  AS 'AMTCUR' ,
 REPLACE(CONVERT(DATE,dc.DO_FECEMI,23),'-','')  AS 'ACCDAT',
 REPLACE(CONVERT(DATE,dc.DO_FECHA,23),'-','')   AS 'DUDDAT',
 '3'   AS 'STA',
 dc.DO_TITULA   AS '[DES]',
 
 --██████████████████████████████████████████████████████████████████████████████████████████████████████████████


'D'    AS  'D',
'1'     AS  'LIN',
'COBRO'    AS  'DENCOD' ,
'99999997'    AS  'ACCD	',       --averiguar que cuenta control es 
C.codigoCliente    AS  'BPRLIN',          --averiguar nombre del terceroo de la  query que devuelve zeus y vincular el codigo que esta en la tabla cheques creada para buscar el codigodel sage
''    AS  'VCRTYP' ,
''    AS  'VCRNUM' ,
''    AS  'PAYMENT1',
''    AS  'PAYMENT2',
''    AS  'PAYMENT3',
''    AS  'PAYMENT4',
'ARS'    AS  'CURLIN',
dc.DO_IMPORT    AS  'AMTLIN',
''    AS  'QTYLIN',
''    AS  'DSP'



FROM  DOC_CARTERA dc, [Venturi].[dbo].[COMPROBANTES] COM,Venturi..cMF C
WHERE dc.DO_ESTADO = 'C'  
AND  dc.CA_TIPO   = 'C' 
AND  dc.CA_CODIGO = '01'
AND dc.CO_NUMERO = COM.CO_NUMERO
AND dc.CO_CODIGO = COM.CO_CODIGO
AND dc.CO_SUCURS = COM.CO_SUCURS
AND COM.CL_CODIGO=C.sigla




 --███████████████████████████████████████████████████████████████████████████████████████████████████████████████████

IF OBJECT_ID('tempdb..#TMP_P') IS NOT NULL
		DROP TABLE #TMP_P
		
	CREATE TABLE #TMP_P (
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
		Dato19 NVARCHAR(MAX) NULL
	
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
		Dato18 NVARCHAR(MAX) NULL,
		Dato19 NVARCHAR(MAX) NULL
	
		)

		--██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

		INSERT INTO #TMP_P (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18,Dato19)
		
		SELECT CH.P,  CH.NUM,CH.PAYTYP,CH.CHQTYP, CH.BPR ,CH.ACC, CH.CHQBAN , CH.CHQNUM , CH.PAM  ,CH.FCY ,CH.BAN,CH.SNS,CH.CUR,CH.AMTCUR,CH.ACCDAT,CH.DUDDAT,CH.STA,CH.[DES],CH.BPR
		FROM @CHEQUES CH

		--██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

		INSERT INTO #TMP_D (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18,Dato19)

		SELECT CH.D, CH.LIN , CH.DENCOD ,CH.ACCD ,CH.BPRLIN, CH.VCRTYP ,CH.VCRNUM ,CH.PAYMENTD1, CH.PAYMENTD2 ,CH.PAYMENTD3, CH.PAYMENTD4, CH.CURLIN ,CH.AMTLIN ,CH.QTYLIN ,CH.DSP,'','','',CH.BPR
		FROM @CHEQUES CH
		


		
		--██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████


		;WITH cteCheques(Dato19, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18)
as(
	select distinct Dato19, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18
	from #TMP_P
	

	union all

	select Dato19, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18
	from #TMP_D
	

	
)
select  * from cteCheques 




