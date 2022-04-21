USE VenturiFabrica
Go



DECLARE @TMP_Tarifa  TABLE(
	E			nvarchar(2)		not null,
	Cliente     nvarchar(max)   not null,
	PLI			nvarchar(max)	not null,
	PLICRD		nvarchar(max)	not null,
	PLISTRDAT	nvarchar(max)	not null,
	PLIENDDAT	nvarchar(max)	not null,
	PLIENAFLG	nvarchar(max)	not null,
	L			nvarchar(2)		not null,
	CRITERIO1   nvarchar(max)	not null,
	CRITERIO2	nvarchar(max)	not null,
	CRITERIO3	nvarchar(max)	not null,
	CRITERIO4	nvarchar(max)	not null,
	CRITERIO5   nvarchar(max)	not null,
	IMPNUMLIG	nvarchar(max)	not null,
	UOM			nvarchar(max)	not null,
	MINQTY		nvarchar(max)	not null,
	MAXQTY		nvarchar(max)	not null,
	CUR			nvarchar(max)	not null,
	PRI			nvarchar(max)	not null,
	DCGVAL0		nvarchar(max)	not null,
	DCGVAL1		nvarchar(max)	not null,
	DCGVAL2		nvarchar(max)	not null
)


INSERT INTO @TMP_Tarifa
	SELECT DISTINCT
		'E'	                     AS 'INDICADOR_E',
		LEFT(LP.LP_CODIGO,6)     AS 'PLI',                 --CÓDIGO DE TARIFA
		LEFT('',20)              AS 'PLICRD',              --REGISTRO DE TARIFA
		'20220101'               AS 'PLISTRDAT',           --FECHA INICIO DE VALIDEZ
	    '20221231'               AS 'PLIENDDAT',           --FECHA FIN VALIDEZ
		LEFT('',5)               AS 'PLIENAFLG',           --ACTIVO


		---------**********************************--------------------------

		'L'                      AS 'INDICADOR_L',
		''                       AS 'CRITERIO1',
		''                       AS 'CRITERIO2',
		''                       AS 'CRITERIO3',
		''                       AS 'CRITERIO4',
		''                       AS 'CRITERIO5',
		LEFT('',8)               AS 'IMPNUMLIG',             --LÍNEA DE IMPORTACIÓN
		LEFT('',3)               AS 'UOM',                   --UNIDAD
		LEFT('',15)              AS 'MINQTY',                --CANTIDAD MÍNIMA
		LEFT('',15)              AS 'MAXQTY',                --CANTIDAD MÁXIMA
		LEFT('ARS',3)            AS 'CUR',                   --DIVISA
		LEFT('',11)              AS 'PRI',                   --VALOR UNITARIO
		LEFT('',15)              AS 'DCGVAL0',               --VALOR GASTO/DCTO
		LEFT('',15)              AS 'DCGVAL1',               --VALOR GASTO/DCTO
 		LEFT('',15)              AS 'DCGVAL2'                --VALOR GASTO/DCTO
		

 FROM [VenturiFabrica].[dbo].[LISTA_PRECIO] LP

  inner join [Venturi].[dbo].[CLIENTES] c
  on LP.LP_CODIGO=c.LP_CODIGO

  inner join Venturi..CMF cmf
  on cmf.sigla=c.CL_CODIGO

  where c.LP_CODIGO in (
  SELECT distinct [LP_CODIGO]
  FROM [Venturi].[dbo].[ART_PRE] a
  inner join Varios..t_ArtDat aa
  on aa.codArt=a.AR_CODIGO)

   
	


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
	Dato16 NVARCHAR(MAX) NULL
)

DECLARE @LISTA VARCHAR(35)
	SET @LISTA=''

DECLARE TARIFADAT CURSOR
	FOR
		SELECT LP_CODIGO
		FROM  LISTA_PRECIO

		OPEN TARIFADAT

		FETCH TARIFADAT INTO @LISTA

		WHILE(@@FETCH_STATUS=0)
		BEGIN

			INSERT INTO ##TMP_GRID
				SELECT DISTINCT
				TT.E,TT.PLI,TT.PLICRD,TT.PLISTRDAT,TT.PLIENDDAT,TT.PLIENAFLG,'','','','','','','','',''
				FROM @TMP_Tarifa TT
				INNER JOIN LISTA_PRECIO LP
				ON TT.PLI=LP.LP_CODIGO
				WHERE TT.PLI=@LISTA


				INSERT INTO ##TMP_GRID
				SELECT DISTINCT
				TT.L,TT.CRITERIO1,TT.CRITERIO2,TT.CRITERIO3,TT.CRITERIO4,TT.CRITERIO5,TT.IMPNUMLIG,TT.UOM,TT.MINQTY,TT.MAXQTY,TT.CUR,
				TT.PRI,TT.DCGVAL0,TT.DCGVAL1,TT.DCGVAL2
				FROM @TMP_Tarifa TT
				INNER JOIN LISTA_PRECIO LP
				ON TT.PLI=LP.LP_CODIGO
				WHERE TT.PLI=@LISTA

			FETCH TARIFADAT INTO @LISTA

		END

	CLOSE TARIFADAT

DEALLOCATE TARIFADAT


SELECT	isnull(tmpGrid.Dato1,  ''), isnull(tmpGrid.Dato2, ''),  isnull(tmpGrid.Dato3, ''),  isnull(tmpGrid.Dato4, ''),  isnull(tmpGrid.Dato5, ''),
		isnull(tmpGrid.Dato6,  ''), isnull(tmpGrid.Dato7, ''),  isnull(tmpGrid.Dato8, ''),  isnull(tmpGrid.Dato9, ''),  isnull(tmpGrid.Dato10, ''),
		isnull(tmpGrid.Dato11, ''), isnull(tmpGrid.Dato12, ''), isnull(tmpGrid.Dato13, ''), isnull(tmpGrid.Dato14, ''), isnull(tmpGrid.Dato15, '')
FROM ##TMP_GRID tmpGrid
