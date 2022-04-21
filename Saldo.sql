USE Venturi
GO 

DECLARE @TMPTABLE_SALDO table
		(  
			INDICADOR_E  varchar (2)  null,
			VCRTYP       nvarchar(max) null,
			VCRNUM       nvarchar(max)  null,
			STOFCY       nvarchar(max)  null,
			IPTDAT       nvarchar(max)  null,
			VCRDES       nvarchar(max)  null,
			TRSFAM       nvarchar(max)  null, 
		    TRSCOD       varchar (2) null,


			INDICADOR_L nvarchar(max)  null, 
			ITMREF      nvarchar(max)  null,
			L_PCU       nvarchar(max)  null,
			L_QTYPCU    nvarchar(max)  null,
			STU         nvarchar(max)  null,
			QTYSTU      nvarchar(max)  null,
			PRIORD      nvarchar(max)  null,


			INDICADOR_S nvarchar(max)  null,
			S_PCU       nvarchar(max)  null,
			S_QTYPCU    nvarchar(max)  null,
			BPSLOT      nvarchar(max)  null,
			LOT         nvarchar(max)  null,
			SLO         nvarchar(max)  null,
			WRH         nvarchar(max)  null,
			LOC         nvarchar(max)  null,
			STA         nvarchar(max)  null,
			SERNUM      nvarchar(max)  null,
			SHLDAT      nvarchar(max)  null)

INSERT INTO @TMPTABLE_SALDO

SELECT DISTINCT
		'E'                   AS 'INDICADOR_E',
		'19'                  AS 'VCRTYP',						--TIPO DE DOCUMENTO
		LEFT('',20)           AS 'VCRNUM',						--DOCUMENTO
		LEFT(CASE ST.DE_CODIGO
				WHEN '12' THEN '0017'
				WHEN '13' THEN '0011'
				WHEN '14' THEN '0012'
				WHEN '15' THEN '0019'
				WHEN '16' THEN '0013'
				WHEN '17' THEN '0015'
				WHEN '18' THEN '0018'
				WHEN '19' THEN '0014'
				WHEN '21' THEN '0016'
				ELSE 'S/D'
			END
		,5)  AS 'STOFCY',						                  --PLANTA STOCK
		'2022-01-01'          AS 'IPTDAT',						  --FECHA DE IMPORTACIÓN
		LEFT('Migración Stock Inicial',30)           AS 'VCRDES', --DESCRIPCIÓN
		LEFT('',3)            AS 'TRSFAM',						  --FAMILIA MOVIMIENTO
		LEFT('',3)            AS 'TRSCOD',						  --CÓDIGO DE MOVIMIENTO 

		--	=============================================================================

		'L'                   AS 'INDICADOR_L',
		LEFT(A.[codArt],20)   AS 'ITMREF',						--ARTÍCULO
		CASE A.[Unidad]
				WHEN 'MT' THEN 'M'
				WHEN 'UN' THEN 'UN'
				WHEN 'KG' THEN 'KG'
				WHEN ''   THEN 'UN'
 				ELSE 'UN'END  AS 'L_PCU',						--UNIDAD DE DOCUMENTO
		'1'                    AS 'L_QTYPCU',					--CANTIDAD DE UN DOCUMENTO
		CASE A.[Unidad]
				WHEN 'MT' THEN 'M'
				WHEN 'UN' THEN 'UN'
				WHEN 'KG' THEN 'KG'
				WHEN ''   THEN 'UN'
 				ELSE 'UN'
			END AS 'STU',										--UNIDAD DE STOCK

		'1'                   AS 'QTYSTU',						--CANTIDAD EN US
		''                   AS 'PRIORD',						--PRECIO
		
		--	=============================================================================
		
		'S'                   AS 'INDICADOR_S',
		CASE A.[Unidad]
				WHEN 'MT' THEN 'M'
				WHEN 'UN' THEN 'UN'
				WHEN 'KG' THEN 'KG'
				WHEN ''   THEN 'UN'
 				ELSE 'UN'
			END AS 'PCU'           ,						    --UNIDAD DE DOCUMENTO 
		'1'                   AS 'S_QTYPCU',					--CANTIDAD EN UN DOCUMENTO 
		LEFT('',17)           AS 'BPSLOT',						--LOTE DE PROVEEDOR
		LEFT('',17)           AS 'LOT',							--LOTE
		LEFT('',4)            AS 'SLO',							--SUB.LOTE
		LEFT(CASE ST.DE_CODIGO
				WHEN '12' THEN 'DSFRA'
				WHEN '13' THEN '0011'
				WHEN '14' THEN '0012'
				WHEN '15' THEN '0019'
				WHEN '16' THEN '0013'
				WHEN '17' THEN '0015'
				WHEN '18' THEN '0018'
				WHEN '19' THEN '0014'
				WHEN '21' THEN '0016'
				
			END
		,5)  AS 'WRH',											--DEPÓSITO
		LEFT('',10)   AS 'LOC',									--UBICACIÓN
		LEFT('A',3)   AS 'STA',							        --SITUACIÓN
		LEFT('',17)   AS 'SERNUM',						        --NÚMERO DE SERIE
		''            AS 'SHLDAT'						--FECHA DE CADUCIDAD
 	
	FROM  STOCK ST , [Varios].[dbo].[t_ArtDat] A
	WHERE ST.DE_CODIGO in (	'12'
							)



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
	Dato11 NVARCHAR(MAX) NULL)


	DECLARE @Item VARCHAR(35)
	SET @Item=''

	DECLARE SALDODATA CURSOR 

		FOR
			SELECT codArt
		FROM [Varios].[dbo].[t_ArtDat]
		
       OPEN SALDODATA
	   FETCH SALDODATA INTO @Item
	  

		WHILE(@@FETCH_STATUS=0)
			BEGIN
					

					INSERT INTO ##TMP_GRID
					select distinct      
					ts.INDICADOR_E,ts.VCRTYP,ts.VCRNUM,ts.STOFCY,ts.IPTDAT,ts.VCRDES,ts.TRSFAM,ts.TRSCOD,'','',''
					FROM  @TMPTABLE_SALDO ts
					INNER JOIN [Varios].[dbo].[t_ArtDat] artd
					ON ts.ITMREF = artd.codArt
					WHERE ts.ITMREF = @Item



					INSERT INTO ##TMP_GRID
					select distinct      
					ts.INDICADOR_L,ts.ITMREF,ts.L_PCU,ts.L_QTYPCU,ts.STU,ts.QTYSTU,ts.PRIORD,'','','',''
					FROM  @TMPTABLE_SALDO ts
					INNER JOIN [Varios].[dbo].[t_ArtDat] artd
					ON ts.ITMREF = artd.codArt
					WHERE ts.ITMREF = @Item


					INSERT INTO ##TMP_GRID
					select distinct      
					ts.INDICADOR_S,ts.S_PCU,ts.QTYSTU,ts.BPSLOT,ts.LOC,ts.SLO,ts.WRH,ts.LOC,ts.STA,'',ts.SHLDAT
					FROM  @TMPTABLE_SALDO ts
					INNER JOIN [Varios].[dbo].[t_ArtDat] artd
					ON ts.ITMREF = artd.codArt
					WHERE ts.ITMREF = @Item

					FETCH SALDODATA INTO @Item
					END

		CLOSE SALDODATA

	DEALLOCATE SALDODATA
	
	SELECT isnull(tmpGrid.Dato1,  ''), isnull(tmpGrid.Dato2, ''),  isnull(tmpGrid.Dato3, ''),  isnull(tmpGrid.Dato4, ''),  isnull(tmpGrid.Dato5, ''),
		   isnull(tmpGrid.Dato6,  ''), isnull(tmpGrid.Dato7, ''),  isnull(tmpGrid.Dato8, ''),  isnull(tmpGrid.Dato9, ''),  isnull(tmpGrid.Dato10, ''),
		   isnull(tmpGrid.Dato11, '')
FROM ##TMP_GRID tmpGrid
