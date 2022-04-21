USE VenturiFabrica
GO

IF OBJECT_ID('tempdb..@TMPVENTAS') IS NOT NULL
			--DROP TABLE @TMPVENTAS

declare @TMPVENTAS table(
		
		
		
		E			nvarchar(5) null,										--	INDICADOR E
		SALFCY		nvarchar(5) null,										--	Planta venta
		SOHTYP		nvarchar(5) null,										--	Tipo pedido
		SOHNUM		nvarchar(20) null,										--	Nº pedido
		BPCORD		nvarchar(5) null,										--	Cliente pedido
		ORDDAT		nvarchar(max) null,										--	Fecha pedido			AAAAMMDD
		CUSORDREF	nvarchar(20) null,										--	Referencia de pedido
		STOFCY		nvarchar(5) null,										--	Planta expedición
		CUR			nvarchar(3) null,										--	Divisa
		PJT			nvarchar(max) null,										--	Proyecto
		PTE			nvarchar(5) null,										--	Condición de pago
		E_BPAADD	nvarchar(3) null,										--	Dirección entrega
		E71		    nvarchar(180) null,										--	Texto cabecera
		E72		    nvarchar(180) null,										--	Texto cabecera
		E81		    nvarchar(180) null,										--	Texto pie
		E82		    nvarchar(180) null,										--	Texto pie
		L			nvarchar(5) null,										--	INDICADOR L
		ITMREF		nvarchar(20) null,										--	Artículo
		SAU			nvarchar(3) null,										--	Unidad venta
		QTY			nvarchar(10) null,										--	Cantidad pedida
		GROPRI		nvarchar(10) null,										--	Precio bruto
		DISCRGVAL1	nvarchar(3)  null,										--	Descuento/gasto 1
		DISCRGVAL2	nvarchar(3)  null,										--	Descuento/gasto 2
		DISCRGVAL3	nvarchar(3)  null,										--	Descuento/gasto 3
		DISCRGVAL4	nvarchar(3)  null,										--	Descuento/gasto 4
		DISCRGVAL5	nvarchar(3)  null,										--	Descuento/gasto 5
		DISCRGVAL6	nvarchar(3)  null,										--	Descuento/gasto 6
		DISCRGVAL7	nvarchar(3)  null,										--	Descuento/gasto 7
		DISCRGVAL8	nvarchar(3)  null,										--	Descuento/gasto 8
		DISCRGVAL9	nvarchar(3)  null,										--	Descuento/gasto 9
		REP1		nvarchar(5)  null,										--	Representante
		REP2		nvarchar(5)  null,										--	Representante
		SHIDAT		nvarchar(max) null,										--	Fecha de expedición		AAAAMMDD
		L_BPAADD	nvarchar(3)   null,										--	Dirección entrega
		DVLPIO		nvarchar(max) null,										--	Prioridad				MENU
		L91			nvarchar(180) null,										--	Texto línea
		L92			nvarchar(180) null,										--	Texto línea
		LC			nvarchar(5) null,										--	INDICADOR LC
		DIE0		nvarchar(5) null,										--	Código eje
		DIE1		nvarchar(5) null,										--	Código eje
		DIE2		nvarchar(5) null,										--	Código eje
		DIE3		nvarchar(5) null,										--	Código eje
		DIE4		nvarchar(5) null,										--	Código eje
		DIE5		nvarchar(5) null,										--	Código eje
		DIE6		nvarchar(5) null,										--	Código eje
		DIE7		nvarchar(5) null,										--	Código eje
		DIE8		nvarchar(5) null,										--	Código eje
		CCE0		nvarchar(5) null,										--	Sección analítica
		CCE1		nvarchar(5) null,										--	Sección analítica
		CCE2		nvarchar(5) null,										--	Sección analítica
		CCE3		nvarchar(5) null,										--	Sección analítica
		CCE4		nvarchar(5) null,										--	Sección analítica
		CCE5		nvarchar(5) null,										--	Sección analítica
		CCE6		nvarchar(5) null,										--	Sección analítica
		CCE7		nvarchar(5) null,										--	Sección analítica
		CCE8		nvarchar(5) null										--	Sección analítica
)

		--	=======================================================================================================================
INSERT INTO @TMPVENTAS
	SELECT 
		'E'									AS			'Indicador_E',							--	INDICADOR E
		LEFT (pd.SU_CODIGO,5)				AS			'SALFCY',								--	Planta venta			*OBL
		
		--LEFT(CASE S.SU_CODIGO
		--		WHEN '12' THEN '0017'
		--		WHEN '13' THEN '0011'
		--		WHEN '14' THEN '0012'
		--		WHEN '15' THEN '0019'
		--		WHEN '16' THEN '0013'
		--		WHEN '17' THEN '0015'
		--		WHEN '18' THEN '0018'
		--		WHEN '19' THEN '0014'
		--		WHEN '21' THEN '0016'
		--		ELSE ''
		--	END ,5)
											
		LEFT('',5)				            AS			'SOHTYP',								--	Tipo pedido				*OBL
		PD.PM_NUMERO						AS			'SOHNUM',								--	Nº pedido
		LEFT(C.CL_CODIGO,5)					AS			'BPCORD',								--	Cliente pedido			*OBL
		REPLACE(CONVERT(DATE,PD.PM_FECHA,23),'-','')	AS			'ORDDAT',					--	Fecha pedido			AAAAMMDD ????????????
		LEFT('',20)							AS			'CUSORDREF',							--	Referencia de pedido
		LEFT (pd.SU_CODIGO,5)				AS			'STOFCY',								--	Planta expedición		*OBL
				--WHEN '12' THEN '0017'
				--WHEN '13' THEN '0011'
				--WHEN '14' THEN '0012'
				--WHEN '15' THEN '0019'
				--WHEN '16' THEN '0013'
				--WHEN '17' THEN '0015'
				--WHEN '18' THEN '0018'
				--WHEN '19' THEN '0014'
				--WHEN '21' THEN '0016'
				--ELSE 'S/D'
		
		'ARS'								AS			'CUR',									--	Divisa
		''									AS			'PJT',									--	Proyecto
		(CASE (LEFT(C.CVE_CODIGO,5)) 
			WHEN '001' THEN '001'
			WHEN '004' THEN '002'
			WHEN '008' THEN '004'
			WHEN '014' THEN '005'
			WHEN ''    THEN '001'
			else '001'
		END)								AS			'PTE',									--	Condición de pago		*OBL
	   'PRI'								AS			'BPAADD',								--	Dirección entrega		*OBL
		LEFT('',180)						AS			'71',									--	Texto cabecera
		LEFT('',180)						AS			'72',									--	Texto cabecera
		LEFT('',180)						AS			'81',									--	Texto pie
		LEFT('',180)						AS			'82',									--	Texto pie
	--	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		'L'									AS			'Indicador_L',							--	INDICADOR L				**HASTA 10 ARTICULOS
		LEFT(a.codArt,20)				    AS			'ITMREF',								--	Artículo				*OBL
		'UN'								AS			'SAU',									--	Unidad venta			*OBL
		'1'									AS			'QTY',									--	Cantidad pedida			*OBL
		LEFT('',10)							AS			'GROPRI',								--	Precio bruto
		LEFT('',3)							AS			'DISCRGVAL1',							--	Descuento/gasto 1
		LEFT('',3)							AS			'DISCRGVAL2',							--	Descuento/gasto 2
		LEFT('',3)							AS			'DISCRGVAL3',							--	Descuento/gasto 3
		LEFT('',3)							AS			'DISCRGVAL4',							--	Descuento/gasto 4
		LEFT('',3)							AS			'DISCRGVAL5',							--	Descuento/gasto 5
		LEFT('',3)							AS			'DISCRGVAL6',							--	Descuento/gasto 6
		LEFT('',3)							AS			'DISCRGVAL7',							--	Descuento/gasto 7
		LEFT('',3)							AS			'DISCRGVAL8',							--	Descuento/gasto 8
		LEFT('',3)							AS			'DISCRGVAL9',							--	Descuento/gasto 9
		LEFT('',5)							AS			'REP1',									--	Representante
		LEFT('',5)							AS			'REP2',									--	Representante
		REPLACE(CONVERT(DATE,PD.PM_FECHA,23),'-','')	AS			'SHIDAT',					--	Fecha de expedición		AAAAMMDD???????????
		'PRI'								AS			'BPAADD',								--	Dirección entrega		*OBL
		'1'									AS			'DVLPIO',								--	Prioridad				*OBL		MENU
		LEFT('',180)						AS			'91',									--	Texto línea
		LEFT('',180)						AS			'92',									--	Texto línea
	--	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		'LC'								AS			'Indicador_LC',							--	INDICADOR LC
		'CVE'								AS			'DIE0',								--	Código eje				*OBL siParametrizaDossier??????
		LEFT('',5)							AS			'DIE1',								--	Código eje
		LEFT('',5)							AS			'DIE2',								--	Código eje
		LEFT('',5)							AS			'DIE3',								--	Código eje
		LEFT('',5)							AS			'DIE4',								--	Código eje
		LEFT('',5)							AS			'DIE5',								--	Código eje
		LEFT('',5)							AS			'DIE6',								--	Código eje
		LEFT('',5)							AS			'DIE7',								--	Código eje
		LEFT('',5)							AS			'DIE8',								--	Código eje
		'BVA'								AS			'CCE0',								--	Sección analítica		*OBL siParametrizaDossier????????
		LEFT('',5)							AS			'CCE1',								--	Sección analítica
		LEFT('',5)							AS			'CCE2',								--	Sección analítica
		LEFT('',5)							AS			'CCE3',								--	Sección analítica
		LEFT('',5)							AS			'CCE4',								--	Sección analítica
		LEFT('',5)							AS			'CCE5',								--	Sección analítica
		LEFT('',5)							AS			'CCE6',								--	Sección analítica
		LEFT('',5)							AS			'CCE7',								--	Sección analítica
		LEFT('',5)							AS			'CCE8'								--	Sección analítica

from Venturi..PEDIDO_MAT pd
inner JOIN [Varios].[dbo].[t_ArtDat] a
ON a.codArt=pd.AR_CODIGO
inner JOIN Venturi..CLIENTES c
ON c.CL_CODIGO=pd.CL_CODIGO
--inner JOIN Venturi..SUCURSAL s
--ON s.SU_CODIGO=pd.SU_CODIGO
--inner join Venturi..STOCK st
--on st.AR_CODIGO=a.codArt
WHERE PD.SU_CODIGO!='' --AND year(PD.PM_FECHA) BETWEEN '2020' AND '2022'



	--	███████████████████████████████████████████████████████████████████████████████████████████████████████████████
	
iF OBJECT_ID('tempdb..#TMP_E') IS NOT NULL
		DROP TABLE #TMP_E
		
	CREATE TABLE #TMP_E (
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
		Dato22 NVARCHAR(MAX) NULL
		)

iF OBJECT_ID('tempdb..#TMP_L') IS NOT NULL
		DROP TABLE #TMP_L
		
	CREATE TABLE #TMP_L (
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
		)

iF OBJECT_ID('tempdb..#TMP_LC') IS NOT NULL
		DROP TABLE #TMP_LC
		
	CREATE TABLE #TMP_LC (
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
		Dato22 NVARCHAR(MAX) NULL
		)
-- INDICADOR E
INSERT INTO #TMP_E (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21, Dato22 /**/)

SELECT	tv.E, tv.SALFCY, tv.SOHTYP, tv.SOHNUM, tv.BPCORD, tv.ORDDAT, tv.CUSORDREF, tv.STOFCY, tv.CUR, tv.PJT, tv.PTE, tv.E_BPAADD, tv.E71, tv.E72, tv.E81, tv.E82,'','','','','',tv.SOHNUM
FROM @TMPVENTAS tv

-- INDICADOR L
INSERT INTO #TMP_L (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21, Dato22 /**/)

SELECT	tv.L , tv.ITMREF, tv.SAU, tv.QTY, tv.GROPRI, tv.DISCRGVAL1, tv.DISCRGVAL2, tv.DISCRGVAL3, tv.DISCRGVAL4, tv.DISCRGVAL5, tv.DISCRGVAL6, tv.DISCRGVAL7, tv.DISCRGVAL8, tv.DISCRGVAL9, tv.REP1, tv.REP2, tv.SHIDAT, tv.L_BPAADD, tv.DVLPIO, tv.L91, tv.L92, tv.SOHNUM
FROM @TMPVENTAS tv

-- INDICADOR LC
INSERT INTO #TMP_LC (Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21, Dato22 /**/)

SELECT	tv.LC, tv.DIE0, tv.DIE1,tv.DIE2,tv.DIE3,tv.DIE4,tv.DIE5,tv.DIE6,tv.DIE7,tv.DIE8,tv.CCE0,tv.CCE1,tv.CCE2,tv.CCE3,tv.CCE4,tv.CCE5,tv.CCE6, tv.CCE7,tv.CCE8,'','', tv.SOHNUM
FROM @TMPVENTAS tv
Go

/*
select DISTINCT * from #TMP_E	
select * from #TMP_L	
select * from #TMP_LC	
GO
*/
	
;WITH cteVentas( Dato22, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21)
as(
	select distinct Dato22, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21
	from #TMP_E

	union all

	select Dato22, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21
	from #TMP_L

	union all

	select Dato22, Dato1, Dato2, Dato3, Dato4, Dato5, Dato6, Dato7, Dato8, Dato9, Dato10, Dato11, Dato12, 
				Dato13, Dato14, Dato15, Dato16, Dato17, Dato18, Dato19, Dato20, Dato21
	from #TMP_LC
)
select * from cteVentas order by Dato22


