use Venturi
go

IF OBJECT_ID('tempdb..##TMPTABLE_ARTICULOS') IS NOT NULL
    DROP TABLE ##TMPTABLE_ARTICULOS

CREATE TABLE ##TMPTABLE_ARTICULOS
(
  
  INDICADOR_I varchar (2)  null,
  TCLCOD      nvarchar(max) null,
  [ITMREF]    nvarchar(max)  null,
  DES1AXX     nvarchar(max)  null,
  DES2AXX     nvarchar(max)  null,
  DES3AXX     nvarchar(max)  null,
  SEAKEY      nvarchar(max)  null, 
  CFGLIN      nvarchar(max)  null, 
  EANCOD      nvarchar(max)  null,
  ITMSTD      nvarchar(max)  null,
  LIFSTRDAT   nvarchar(max)  null,
  LIFENDDAT   nvarchar(max)  null,
  [TSICOD(0)] nvarchar(max)  null,
  [TSICOD(1)] nvarchar(max)  null,
  [TSICOD(2)] nvarchar(max)  null,
  [RPLITM]	  nvarchar(max)  null,
  [LOTMGTCOD] nvarchar(max)  null,
  [LOTCOU]	  nvarchar(max)  null,
  [EXYMGTCOD] nvarchar(max)  null,
  [SHL]		  nvarchar(max)  null,
  EXYSTA	  nvarchar(max)  null,
  SHLLTI	  nvarchar(max)  null,
  NEWLTISTA   nvarchar(max)  null,
  [STU]		  nvarchar(max)  null,
  [WEU]		  nvarchar(max)  null,
  [ITMWEI]    nvarchar(max)  null,
  [PUU]	      nvarchar(max)  null,
  PUUSTUCOE   nvarchar(max)  null,
  [SAU]       nvarchar(max)  null,
  SAUSTUCOE   nvarchar(max)  null,
  [PCU(0)]    nvarchar(max)  null,
  [PCUSTUCOE(0)] nvarchar(max)  null,
  [PCU(1)]       nvarchar(max)  null,
  [PCUSTUCOE(1)] nvarchar(max)  null,
  [ACCCOD]       nvarchar(max)  null,
  [VACITM(0)]    nvarchar(max)  null,
  [VACITM(1)]    nvarchar(max)  null,
  FIMHOR		 nvarchar(max)  null,
  FIMHORUOM		 nvarchar(max)  null,
  [CCE(0)]		 nvarchar(max)  null,
  [CCE(1)]		 nvarchar(max)  null,
  [CCE(2)]		 nvarchar(max)  null,
  [OFS]			 nvarchar(max)  null,
  [*71]			 nvarchar(max)  null,
  [*72]			 nvarchar(max)  null,
  [*81]			 nvarchar(max)  null,
  [*82]			 nvarchar(max)  null,


  INDICADOR_S    varchar (2) null,
  [SBSITM]       nvarchar(max)  null, 
  [PCK]          nvarchar(max)  null,
  [PCKCAP]       nvarchar(max)  null,
  [BASPRI]       nvarchar(max)  null,
  [S*71]         nvarchar(max)  null,
  [S*72]         nvarchar(max)  null,
  [S*81]         nvarchar(max)  null,
  [S*82]         nvarchar(max)  null,


  INDICADOR_U    varchar (2) null,
  [BPCNUM]       nvarchar(max)  null,
  [ITMREFBPC]    nvarchar(max)  null,
  [PCU1]         nvarchar(max)  null,
  [PCUSAUCOE1]   nvarchar(max)  null,
  [UPCK]          nvarchar(max)  null,
  [UPCKCAP]       nvarchar(max)  null,
  [U*71]         nvarchar(max)  null, 
  [U*72]         nvarchar(max)  null,
  [U*81]         nvarchar(max)  null,
  [U*82]         nvarchar(max)  null,

  INDICADOR_P    varchar (2) null,
  [BPSNUM]       nvarchar(max)  null,
  [ITMREFBPS]    nvarchar(max)  null,
  [PIO]          nvarchar(max)  null,
  [EANCODBPS]    nvarchar(max)  null,
  [PPUU]          nvarchar(max)  null, 
  [PPUUSTUCOE]    nvarchar(max)  null,
  [PURMINQTY]    nvarchar(max)  null,
  [PCU]          nvarchar(max)  null,
  [PCUPUUCOE]    nvarchar(max)  null, 
  [P*71]         nvarchar(max)  null,  
  [P*72]         nvarchar(max)  null,


  INDICADOR_O    varchar (2) null,
  [ODFCOD]       nvarchar(max)  null, 
  [ODFVAL]       nvarchar(max)  null,


  INDICADOR_Q    varchar(2) null,
  [XX12TYPBAS]   nvarchar(max)  null,
  [XX12CPY]      nvarchar(max)  null,
  [XX12BASTYP1]  nvarchar(max)  null,
  [XX12BASTYP2]  nvarchar(max)  null
 )



INSERT INTO ##TMPTABLE_ARTICULOS


SELECT   
        
	   'I' AS 'INDICADOR_I',
		LEFT(LTRIM(FA_CODIGO), 5) as TCLCOD,												  --Aqui hay que ver algunos números especificos, CATEGORIA DE LOS ARTICULOS	

		/*
			Aquí podria poner un CASE para comparar los valores, recordar que para Argentina tiene
			5 digitos para comparar, cual es correcto.

			No encuentro donde podrá estar la comparación de esto
		*/
		UPPER(LEFT(REPLACE(REPLACE(RTRIM(A.AR_CODIGO),'-', ''), '.', ''), 20)) AS [ITMREF],   --CÓDIGO DEL ARTICULO SIN ESPACIOS NI GUIONES
		UPPER(LEFT(A.AR_DESCRI, 30)) AS DES1AXX,											  --Descripción 1er máximo 30 caracteres		
		UPPER(SUBSTRING(A.AR_DESCRI, 31, 30)) AS DES2AXX,								      --Descripción 2do máximo 30 caracteres
		UPPER(SUBSTRING(A.AR_DESCRI, 61, 30)) AS DES3AXX,									  --Descripción 3er máximo 30 caracteres
		'' AS SEAKEY,																	      --Clave de busqueda
		'' AS CFGLIN,																		  --Linea de producto		
		AR_BARRAS AS EANCOD,																  --Código EAN
		'' AS ITMSTD,																		  --Norma
		A.AR_FECHAALTA AS LIFSTRDAT,														  --Inicio de vida
		'' AS LIFENDDAT,																	  --Fin de vida
		'' AS [TSICOD(0)],																	  --Familias estadisticas (0), SE PROPONE 3 PUEDE HABER HASTA 5
		'' AS [TSICOD(1)],																	  --Familias estadisticas (1)
		'' AS [TSICOD(2)],																	  --Familias estadisticas (2)
		

		
		/*
			A.AR_CODREARC + ', ' + A.AR_CODREINT AS [RPLITM],
			--A este campo lo dejamos vacio por momentos, ya que hay articulos
			de reemplazo tanto internos como externos y el SAGE tiene solo 1
			para colocar.			
		*/																					  --Articulo reemplazo
		'' AS [RPLITM],



		1 AS [LOTMGTCOD],																	  --Gestión lote, 1) Sin gestión, 2) Lote opcional, 3) Lote (obligatorio), 4) Lote y sublote
		'' AS [LOTCOU],																		  --Contador lote
		1 AS [EXYMGTCOD],																	  --Gestión caducidad 1) Sin gestión 2) Sin redondeo 3) Redondeo de fin de mes 4) Redonde ini mes + 1 5) Entrada obligatoria 6) Entrada manual
		'' AS [SHL],																		  --Plazo caducidad
		'' AS EXYSTA,																		  --Estado caducidad
		0 AS SHLLTI,																		  --Plazo nuevo control
		'' AS NEWLTISTA,																	  --Estado control "A", "Q", "R"
		


		CASE A.UM_CODIGO
			WHEN 'MT' THEN 'M'
			WHEN 'UN' THEN 'UN'
			ELSE 'A DEFINIR'
		END AS [STU],																		  --Unidad Stock


		'KG' AS [WEU],																		  --Unidad de Peso
		LEFT(A.AR_PESO, 6) AS [ITMWEI],														  --Peso de la US
		LEFT(A.UM_CODIGO, 3) AS [PUU],														  --Unidad compra
		'' AS PUUSTUCOE,																      --Coef. UC-US   1BAG = 10Unid
		LEFT(A.UM_CODIGO, 3) AS [SAU],														  --Unidad Venta
		'' AS SAUSTUCOE,																	  --Coef. UV-US   1 BAG = 10 UN
		'' AS [PCU(0)],																		  --Envasado 0 y 1
		'' AS [PCUSTUCOE(0)],																  --Coef. UE-US (0) y (1)
		'' AS [PCU(1)],																		  --Envasado 0 y 1
		0 AS [PCUSTUCOE(1)],																  --Coef. UE-US
		'' AS [ACCCOD],																		  --Código contable (A CONSULTAR)
		'' AS [VACITM(0)],																	  --Nivel impuesto  (A CONSULTAR)
		'' AS [VACITM(1)],																	  --Nivel impuesto
		'' AS FIMHOR,																		  --Horizonte firme
		'' AS FIMHORUOM,																	  --Unidad tpo hor.firme
		'' AS [CCE(0)],																		  --Sección análitica
		'' AS [CCE(1)],																		  --Sección análitica
		'' AS [CCE(2)],																		  --Sección análitica
		'' AS [OFS],																		  --Plazo reaprov
		'' AS [*71],																		  --Texto compra
		'' AS [*72],																		  --Texto compra 
		'' AS [*81],																		  --Texto producción
		'' AS [*82],																		  --Texto producción
		'S' AS 'INDICADOR_S',
		'' AS [SBSITM],																		  --Articulo sustitución
		'' AS [PCK],																		  --Embalaje
		'' AS [PCKCAP],																		  --Capacidad de embalaje
		'' AS [BASPRI],																		  --Precio de base
		'' AS [S*71],																		  --Texto de venta
		'' AS [S*72],																		  --Texto de venta
		'' AS [S*81],																	      --Texto de producción
		'' AS [S*82],																		  --Texto de producción
		'U' AS 'INDICADOR_U',
       	LEFT(cliente.CL_CODIGO, 15)  AS [BPCNUM],										      --Cliente
		UPPER(LEFT(clienteArt.AR_CODIGO_CL, 20)) AS [ITMREFBPC],						      --Artículo-cliente
                             
		'' AS [PCU1],																		  --Envasado 1
		'' AS [PCUSAUCOE1],																	  --Coef.  UE1-UV
		'' AS [PCK],																		  --Embalaje
		'' AS [PCKCAP],																		  --Capacidad embalaje
		'' AS [U*71],																		  --Texto de venta
		'' AS [U*72],																		  --Texto de venta
		'' AS [U*81],																		  --Texto de preparación
		'' AS [U*82],																		  --Texto de preparación
		'P' AS 'INDICADOR_P',
		LEFT(AP.PR_CODIGO, 15) AS [BPSNUM],													  --Proveedor
		UPPER(LEFT(A.AR_DESCRI, 20)) AS [ITMREFBPS],										  --Artículo proveedor
		'' AS [PIO],																		  --Prioridad (Entero corto)
		'' AS [EANCODBPS],																	  --Código EAN proveedor
		'' AS [PUU],																		  --Unidad compra
		'' AS [PUUSTUCOE],																	  --Coef. UC-US
		'' AS [PURMINQTY],																      --Cantidad minima de compra
		'' AS [PCU],																	      --Envasado
		'' AS [PCUPUUCOE],															          --Coef. UE-UC
		'' AS [P*71],																          --Texto compra
		'' AS [P*72],																		  --Texto compra
		'O' AS 'INDICADOR_O',
		'' AS [ODFCOD],																		  --Otros datos locales
		'' AS [ODFVAL],																		  --Valor
		'Q' AS 'INDICADOR_Q',
		'' AS [XX12TYPBAS],																	  --Tipo de base
		'A DEFINIR' AS [XX12CPY],															  --Sociedad
		'A DEFINIR' AS [XX12BASTYP1],														  --Tipo de carga
		'A DEFINIR' AS [XX12BASTYP2]														  --Actividad
FROM ARTICULO A left join ART_PROV AP
ON AP.AR_CODIGO = A.AR_CODIGO left join CLIENTE_ARTICULO clienteArt
ON A.AR_CODIGO = clienteArt.AR_CODIGO left join CLIENTES cliente
ON clienteArt.CL_CODIGO = cliente.CL_CODIGO
WHERE A.ESA_CODIGO <> '03' 
AND A.AR_CODIGO IN (
'90200001',
'90255653',
'90305505',
'90315743',
'90340321',
'90353876',
'90430178',
'90500000',
'90512502',
'90537736',
'90605001',
'90653256',
'91405006',
'95032424'
)

IF OBJECT_ID('tempdb..##TMP_GRID') IS NOT NULL
    DROP TABLE ##TMP_GRID

IF OBJECT_ID('tempdb..##TMPTABLE_ARTICULOSDATA') IS NOT NULL
	DROP TABLE ##TMPTABLE_ARTICULOSDATA

	
	

CREATE TABLE ##TMPTABLE_ARTICULOSDATA (	
   Item                NVARCHAR(MAX) NOT NULL,
   CodProv             NVARCHAR(MAX) NOT NULL,
   FamiliaEstadistica  NVARCHAR(MAX) NOT NULL,
   FamiliaEstadistica1 NVARCHAR(MAX) NOT NULL,
   FamiliaEstadistica2 NVARCHAR(MAX) NOT NULL,
   FamiliaEstadistica3 NVARCHAR(MAX) NOT NULL,
   FamiliaEstadistica4 NVARCHAR(MAX) NOT NULL,
)


insert into ##TMPTABLE_ARTICULOSDATA values ('90200001',	'Z888',	'VH',	'DH',	'DHIS',	'CDH',	'OC')
insert into ##TMPTABLE_ARTICULOSDATA values ('90255653',	'Z999',	'VH',	'DH',	'DHIS',	'RDH',	'SELDH')
insert into ##TMPTABLE_ARTICULOSDATA values ('90305505',	'Z888',	'VH',	'VALV',	'1050',	'CVAL',	'ZNA')
insert into ##TMPTABLE_ARTICULOSDATA values ('90315743',	'Z888',	'VH',	'VALV',	'1120',	'CVAL',	'ZNA')
insert into ##TMPTABLE_ARTICULOSDATA values ('90340321',	'Z888',	'VH',	'VALV',	'VVAR',	'CVAL',	'ZNA')
insert into ##TMPTABLE_ARTICULOSDATA values ('90353876',	'Z888',	'COMPL','VALVC','EVD',  'CVALC','CPRUC')
insert into ##TMPTABLE_ARTICULOSDATA values ('90430178',	'Z888',	'VH',	'CH',	'AGRIC','CCH',	'D20')
insert into ##TMPTABLE_ARTICULOSDATA values ('90500000',	'Z888',	'VH',	'BBAS',	'MVB',	'CBBA',	'ZNA')
insert into ##TMPTABLE_ARTICULOSDATA values ('90512502',	'Z888',	'VH',	'VALV',	'VVAR',	'CVAL',	'ZNA')
insert into ##TMPTABLE_ARTICULOSDATA values ('90537736',	'Z888',	'VH',	'BBAS',	'DIVIS','CBBA',	'DOBLE')
insert into ##TMPTABLE_ARTICULOSDATA values ('90605001',	'Z888',	'VH',	'BBAS',	'A92',	'CBBA',	'SIMPL')
insert into ##TMPTABLE_ARTICULOSDATA values ('90653256',	'Z888',	'VH',	'BBAS',	'A92',	'RBBA',	'JGOM')
insert into ##TMPTABLE_ARTICULOSDATA values ('91405006',	'Z888',	'VH',	'BBAS',	'B2',	'CBBA',	'SIMPL')
insert into ##TMPTABLE_ARTICULOSDATA values ('95032424',	'Z888',	'VH',	'CH',	'ZNA',	'RCH',	'FABCH')






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
	Dato25 NVARCHAR(MAX) NULL,
	Dato26 NVARCHAR(MAX) NULL,
	Dato27 NVARCHAR(MAX) NULL,
	Dato28 NVARCHAR(MAX) NULL,
	Dato29 NVARCHAR(MAX) NULL,
	Dato30 NVARCHAR(MAX) NULL,
	Dato31 NVARCHAR(MAX) NULL,
	Dato32 NVARCHAR(MAX) NULL,
	Dato33 NVARCHAR(MAX) NULL,
	Dato34 NVARCHAR(MAX) NULL,
	Dato35 NVARCHAR(MAX) NULL,
	Dato36 NVARCHAR(MAX) NULL,
	Dato37 NVARCHAR(MAX) NULL,
	Dato38 NVARCHAR(MAX) NULL,
	Dato39 NVARCHAR(MAX) NULL,
	Dato40 NVARCHAR(MAX) NULL,
	Dato41 NVARCHAR(MAX) NULL,
	Dato42 NVARCHAR(MAX) NULL,
	Dato43 NVARCHAR(MAX) NULL,
	Dato44 NVARCHAR(MAX) NULL,
	Dato45 NVARCHAR(MAX) NULL,
	Dato46 NVARCHAR(MAX) NULL,
)


DECLARE @Item NVARCHAR(MAX)
DECLARE @CodProv NVARCHAR(MAX) 
DECLARE @FamiliaEstadistica NVARCHAR(MAX)
DECLARE @FamiliaEstadistica1 NVARCHAR(MAX)
DECLARE @FamiliaEstadistica2 NVARCHAR(MAX)
DECLARE @FamiliaEstadistica3 NVARCHAR(MAX)
DECLARE @FamiliaEstadistica4 NVARCHAR(MAX)



SET @Item = ''
SET @CodProv = ''
SET @FamiliaEstadistica = ''
SET @FamiliaEstadistica1 = ''
SET @FamiliaEstadistica2 = ''
SET @FamiliaEstadistica3 = ''
SET @FamiliaEstadistica4 = ''


DECLARE ARTICULOSDATA CURSOR 
	FOR
	SELECT *
	FROM ##TMPTABLE_ARTICULOSDATA

OPEN ARTICULOSDATA
	FETCH ARTICULOSDATA INTO @Item, @CodProv, @FamiliaEstadistica ,@FamiliaEstadistica1,@FamiliaEstadistica2,@FamiliaEstadistica3,@FamiliaEstadistica4

	WHILE(@@FETCH_STATUS=0)
	BEGIN


INSERT INTO ##TMP_GRID
select distinct
       
	art .INDICADOR_I, --1
	art.TCLCOD, --2
	art.[ITMREF], --3
	art.DES1AXX, --4
	art.DES2AXX, --5
	art.DES3AXX, --6
	art.SEAKEY,  --7
	art.CFGLIN, --8
	art.EANCOD,  --9
	art.ITMSTD,  --10
	art.LIFSTRDAT, --11
	art.LIFENDDAT,
	art.[TSICOD(0)], --12
	art.[TSICOD(1)],  --13
	art.[TSICOD(2)], --14
	art.[RPLITM],  --15
	art.[LOTMGTCOD],  --16
	art.[LOTCOU], --17
	art.[SHL],  --18
	art.EXYSTA,  --19
	art.SHLLTI, --20
	art.NEWLTISTA,  --21
	art.[STU], --22
	art.[WEU], --23
	art.[ITMWEI], --24
	art.[PUU],  --25
	art.PUUSTUCOE,  --26
	art.[SAU],  --27
	art.SAUSTUCOE,  --28
	art.[PCU(0)],  --29
	art.[PCUSTUCOE(0)],  --30
	art.[PCU(1)],  --31
	art.[PCUSTUCOE(1)],  --32
	art.[ACCCOD],  --33
	art.[VACITM(0)],  --34
	art.[VACITM(1)],  --35
	art.FIMHOR, --36
	art.FIMHORUOM,  --37
	art.[CCE(0)],  --38
	art.[CCE(1)], --39
	art.[CCE(2)],  --40
	art.[OFS],  --41
	art.[*71],  --42
	art.[*72],  --43
	art.[*81],  --44
	art.[*82]  --45


FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv



INSERT INTO ##TMP_GRID
SELECT DISTINCT 
	art.INDICADOR_S, --1
	art.SBSITM,  --2
	art.PCK, --3
    art.PCKCAP, --4	 
    art.BASPRI,  --5
	art.[S*71],  --6
	art.[S*72],  --7
	art.[S*81],  --8
	art.[S*82],  --9
	'',  --10
	'',  --11
	'',  --12
	'',  --13
	'',  --14
	'',  --15
	'',  --16
	'',  --17
	'',  --18
	'',  --19
	'',  --20
	'',  --21
	'',  --22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'', --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'', --33
 	'',  --34
	'',  --35
	'', --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	''  --46
FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv


INSERT INTO ##TMP_GRID
SELECT DISTINCT 
	art.INDICADOR_U, --1
	art.[PCU1],  --2
	art.[PCUSAUCOE1], --3
    art.[PCK], --4	 
    art.[PCKCAP],  --5
	art.[U*71],  --6
	art.[U*72],  --7
	art.[U*81],  --8
	art.[U*82],  --9
	'',  --10
	'',  --11
	'',  --12
	'',  --13
	'',  --14
	'',  --15
	'',  --16
	'',  --17
	'',  --18
	'',  --19
	'',  --20
	'',  --21
	'',  --22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'', --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'', --33
 	'',  --34
	'',  --35
	'', --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	''  --46


FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv


INSERT INTO ##TMP_GRID
SELECT DISTINCT 
	art.INDICADOR_P, --1
	art.[BPSNUM],  --2
	art.[ITMREFBPS], --3
    art.[PIO], --4	 
    art.[EANCODBPS],  --5
	art.[PUU],  --6
	art.[PUUSTUCOE],  --7
	art.[PURMINQTY],  --8
	art.[PCU],  --9
	art.[PCUPUUCOE],  --10
	art.[P*71],  --11
	art.[P*72],  --12
	'',  --13
	'',  --14
	'',  --15
	'',  --16
	'',  --17
	'',  --18
	'',  --19
	'',  --20
	'',  --21
	'',  --22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'', --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'', --33
 	'',  --34
	'',  --35
	'', --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	''  --46


FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv


INSERT INTO ##TMP_GRID
SELECT DISTINCT 
	art.INDICADOR_O, --1
	art.[ODFCOD],  --2
	art.[ODFVAL], --3
    '', --4	 
    '',  --5
	'',  --6
	'',  --7
	'',  --8
	'',  --9
	'',  --10
	'',  --11
	'',  --12
	'',  --13
	'',  --14
	'',  --15
	'',  --16
	'',  --17
	'',  --18
	'',  --19
	'',  --20
	'',  --21
	'',  --22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'', --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'', --33
 	'',  --34
	'',  --35
	'', --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	''  --46


FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv



INSERT INTO ##TMP_GRID
SELECT DISTINCT 
	art.INDICADOR_Q, --1
	art.[XX12TYPBAS],  --2
	art.[XX12CPY], --3
    art.[XX12BASTYP1], --4	 
    art.[XX12BASTYP2],  --5
	'',  --6
	'',  --7
	'',  --8
	'',  --9
	'',  --10
	'',  --11
	'',  --12
	'',  --13
	'',  --14
	'',  --15
	'',  --16
	'',  --17
	'',  --18
	'',  --19
	'',  --20
	'',  --21
	'',  --22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'', --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'', --33
 	'',  --34
	'',  --35
	'', --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	''  --46


FROM ##TMPTABLE_ARTICULOS art, ##TMPTABLE_ARTICULOSDATA artd
WHERE art.ITMREF  =  artd.Item and artd.CodProv = @CodProv

FETCH ARTICULOSDATA INTO @Item, @CodProv, @FamiliaEstadistica ,@FamiliaEstadistica1,@FamiliaEstadistica2,@FamiliaEstadistica3,@FamiliaEstadistica4

END

CLOSE ARTICULOSDATA

DEALLOCATE ARTICULOSDATA


SELECT tmpGrid.*
FROM ##TMP_GRID tmpGrid
