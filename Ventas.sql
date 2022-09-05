USE VenturiFabrica
GO


		
declare @TMPVENTAS table(

		E			nvarchar(5) null,										--	INDICADOR E
		SOHTYP		nvarchar(5) null,										--	Tipo pedido
		SALFCY		nvarchar(5) null,										--	Planta venta
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
		L_BPAADD	nvarchar(3) null,										--	Dirección entrega
		DVLPIO		nvarchar(max) null,										--	Prioridad				MENU
		L91		    nvarchar(180) null,										--	Texto línea
		L92		    nvarchar(180) null,										--	Texto línea
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
		'E'						            AS			'Indicador_E',							--	INDICADOR E
		 pd.SU_CODIGO                       AS			'SALFCY',								--	Planta venta			*OBL
		LEFT('',5)				            AS			'SOHTYP',								--	Tipo pedido				*OBL
		LEFT(PD.PM_NUMERO,20)				AS			'SOHNUM',								--	Cliente pedido			*OBL
		LEFT('',5)							AS			'BPCORD',								--	Nº pedido
		PD.PM_FECHA		                    AS			'ORDDAT',						        --	Fecha pedido			AAAAMMDD ????????????
		LEFT('',20)							AS			'CUSORDREF',							--	Referencia de pedido
		pd.SU_CODIGO                        AS          'STOFCY',								--	Planta expedición		*OBL
		'ARS'					            AS			'CUR',									--	Divisa
		''							        AS			'PJT',									--	Proyecto
		(CASE (LEFT(C.CVE_CODIGO,5)) 
			WHEN '001' THEN '001'
			WHEN '004' THEN '002'
			WHEN '008' THEN '004'
			WHEN '014' THEN '005'
			WHEN ''    THEN '001'
			else '001'
		END)					                 AS			'PTE',									--	Condición de pago		*OBL
	   'PRI'				                     AS			'BPAADD',								--	Dirección entrega		*OBL
		LEFT('',180)							 AS			'71',									--	Texto cabecera
		LEFT('',180)							 AS			'72',									--	Texto cabecera
		LEFT('',180)							 AS			'81',									--	Texto pie
		LEFT('',180)							 AS			'82',									--	Texto pie
	--	^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v     ^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v
		'L'							             AS			'Indicador_L',							--	INDICADOR L				**HASTA 10 ARTICULOS
		LEFT(a.codArt,30)				         AS			'ITMREF',								--	Artículo				*OBL
		'UN'					                 AS			'SAU',									--	Unidad venta			*OBL
		'1'							             AS			'QTY',									--	Cantidad pedida			*OBL
		LEFT('',10)							     AS			'GROPRI',								--	Precio bruto
		LEFT('',3)							     AS			'DISCRGVAL1',							--	Descuento/gasto 1
		LEFT('',3)							     AS			'DISCRGVAL2',							--	Descuento/gasto 2
		LEFT('',3)							     AS			'DISCRGVAL3',							--	Descuento/gasto 3
		LEFT('',3)							     AS			'DISCRGVAL4',							--	Descuento/gasto 4
		LEFT('',3)							     AS			'DISCRGVAL5',							--	Descuento/gasto 5
		LEFT('',3)							     AS			'DISCRGVAL6',							--	Descuento/gasto 6
		LEFT('',3)							     AS			'DISCRGVAL7',							--	Descuento/gasto 7
		LEFT('',3)							     AS			'DISCRGVAL8',							--	Descuento/gasto 8
		LEFT('',3)							     AS			'DISCRGVAL9',							--	Descuento/gasto 9
		LEFT('',5)							     AS			'REP1',									--	Representante
		LEFT('',5)							     AS			'REP2',									--	Representante
		PD.PM_FECHAAUT			                 AS			'SHIDAT',								--	Fecha de expedición		AAAAMMDD???????????
		'PRI'						             AS			'BPAADD',								--	Dirección entrega		*OBL
		'1'			                             AS			'DVLPIO',								--	Prioridad				*OBL		MENU
		LEFT('',180)							 AS			'91',									--	Texto línea
		LEFT('',180)							 AS			'92',									--	Texto línea
	--	^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v
		'LC'						             AS			'Indicador_LC',					    --	INDICADOR LC
		'CVE'					                 AS			'DIE0',								--	Código eje				*OBL siParametrizaDossier??????
		LEFT('',5)							     AS			'DIE1',								--	Código eje
		LEFT('',5)							     AS			'DIE2',								--	Código eje
		LEFT('',5)							     AS			'DIE3',								--	Código eje
		LEFT('',5)							     AS			'DIE4',								--	Código eje
		LEFT('',5)							     AS			'DIE5',								--	Código eje
		LEFT('',5)							     AS			'DIE6',								--	Código eje
		LEFT('',5)							     AS			'DIE7',								--	Código eje
		LEFT('',5)							     AS			'DIE8',								--	Código eje
		'BVA'					                 AS			'CCE0',								--	Sección analítica		*OBL siParametrizaDossier????????
		LEFT('',5)							     AS			'CCE1',								--	Sección analítica
		LEFT('',5)							     AS			'CCE2',								--	Sección analítica
		LEFT('',5)							     AS			'CCE3',								--	Sección analítica
		LEFT('',5)							     AS			'CCE4',								--	Sección analítica
		LEFT('',5)							     AS			'CCE5',								--	Sección analítica
		LEFT('',5)							     AS			'CCE6',								--	Sección analítica
		LEFT('',5)							     AS			'CCE7',								--	Sección analítica
		LEFT('',5)							     AS			'CCE8'								--	Sección analítica
											     
from Venturi..PEDIDO_MAT pd
inner JOIN [Varios].[dbo].[t_ArtDat] a
ON a.codArt=pd.AR_CODIGO
inner JOIN Venturi..CLIENTES c
ON c.CL_CODIGO=pd.CL_CODIGO

/*where pd.PM_FECHA BETWEEN '2020-03-01 00:00:00' AND '2021-04-01 00:00:00'
and pd.PM_CANTIDREM < pd.PM_CANTIDNOAUT*/

iF OBJECT_ID('tempdb..##TMP_GRID') IS NOT NULL
		DROP TABLE ##TMP_GRID
		
	CREATE TABLE ##TMP_GRID (
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
		Dato21 NVARCHAR(MAX) NULL)
		

		DECLARE @Pedidos VARCHAR(35)
		

		SET     @Pedidos = ''
		

		DECLARE VENTA CURSOR 

		FOR
			SELECT a.codArt
			FROM Varios..t_ArtDat a

			

        OPEN VENTA 
		
		FETCH VENTA INTO @Pedidos

		
			WHILE(@@FETCH_STATUS=0)
			BEGIN
					

					INSERT INTO ##TMP_GRID
					SELECT DISTINCT      
					tv.E,tv.SALFCY,tv.SOHTYP,tv.SOHNUM,tv.BPCORD,tv.ORDDAT,tv.CUSORDREF,tv.STOFCY,tv.CUR,tv.PJT,tv.PTE,tv.E_BPAADD,tv.E71,tv.E72,tv.E81,tv.E82,
					'','','','',''
					FROM @TMPVENTAS tv
						INNER JOIN [Varios].[dbo].[t_ArtDat] ar
					ON tv.ITMREF = ar.codArt
					INNER JOIN pedido_mat pd
					on pd.AR_CODIGO=ar.codArt
					WHERE tv.SOHNUM = @Pedidos
				
				


				    INSERT INTO ##TMP_GRID
					SELECT DISTINCT
					tv.L,tv.ITMREF,tv.SAU,tv.QTY,tv.GROPRI,tv.DISCRGVAL1,tv.DISCRGVAL2,tv.DISCRGVAL3,tv.DISCRGVAL4,tv.DISCRGVAL5,tv.DISCRGVAL6,tv.DISCRGVAL7
					,tv.DISCRGVAL8,tv.DISCRGVAL9,tv.REP1,tv.REP2,tv.SHIDAT,tv.L_BPAADD,tv.DVLPIO,tv.L91,tv.L92
					FROM @TMPVENTAS tv
					INNER JOIN [Varios].[dbo].[t_ArtDat] ar
					ON tv.ITMREF = ar.codArt
					INNER JOIN pedido_mat pd
					on pd.AR_CODIGO=ar.codArt
					WHERE tv.SOHNUM = @Pedidos
				
				



					INSERT INTO ##TMP_GRID
					SELECT DISTINCT 
					tv.LC,tv.DIE0,tv.DIE1,tv.DIE2,tv.DIE3,tv.DIE4,tv.DIE5,tv.DIE6,tv.DIE7,tv.DIE8,tv.CCE0,tv.CCE1,tv.CCE2,tv.CCE3,tv.CCE4,tv.CCE5,tv.CCE6,
					tv.CCE7,tv.CCE8,'',''

					FROM @TMPVENTAS tv
				  	INNER JOIN [Varios].[dbo].[t_ArtDat] ar
					ON tv.ITMREF = ar.codArt
					INNER JOIN pedido_mat pd
					on pd.AR_CODIGO=ar.codArt
					WHERE tv.SOHNUM = @Pedidos
				
				
					FETCH VENTA INTO @Pedidos
					
				END	
              CLOSE VENTA
            DEALLOCATE VENTA

    SELECT isnull(tmpGrid.Dato1,  ''), isnull(tmpGrid.Dato2, ''),  isnull(tmpGrid.Dato3, ''),  isnull(tmpGrid.Dato4, ''),  isnull(tmpGrid.Dato5, ''),
		   isnull(tmpGrid.Dato6,  ''), isnull(tmpGrid.Dato7, ''),  isnull(tmpGrid.Dato8, ''),  isnull(tmpGrid.Dato9, ''),  isnull(tmpGrid.Dato10, ''),
		   isnull(tmpGrid.Dato11, ''), isnull(tmpGrid.Dato12, ''), isnull(tmpGrid.Dato13, ''), isnull(tmpGrid.Dato14, ''), isnull(tmpGrid.Dato15, ''),
		   isnull(tmpGrid.Dato16, ''), isnull(tmpGrid.Dato17, ''), isnull(tmpGrid.Dato18, ''), isnull(tmpGrid.Dato19, ''), isnull(tmpGrid.Dato20, ''),
		   isnull(tmpGrid.Dato21, '')
	 FROM ##TMP_GRID tmpGrid
           
/*
filtar pedidos la cantidad remitida =pm_cantidrem  tiene que ser menor   que la cantida autorizada  pm_cantidaut 
*/