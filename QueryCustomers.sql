    USE Venturi
    GO

    DECLARE @TMPTABLE_CLIENTES TABLE
(
	Indicador VARCHAR(2) NOT NULL,
	[BCGCOD] VARCHAR(10) NOT NULL,
	[BPCNUM] NVARCHAR(50) NOT NULL,
	[BPRNAM] NVARCHAR(50) NOT NULL,
	[BPRSHO] NVARCHAR(50) NOT NULL,
	[BPRLOG] NVARCHAR(50) NOT NULL,
	[CRY] NVARCHAR(50)  NULL,
	[LAN] NVARCHAR(50) NOT NULL,
	[CRN] NVARCHAR(50) NOT NULL,
	[CUR] NVARCHAR(50) NOT NULL,
	[ABCCLS] NVARCHAR(50) NOT NULL,
	[DME] NVARCHAR(50) NOT NULL,
	[FREINV] NVARCHAR(50) NOT NULL,
	[IME] NVARCHAR(50) NOT NULL,
	[INVPER] NVARCHAR(50) NOT NULL,
	[COMCAT] NVARCHAR(50) NOT NULL,
	[REP(0)] NVARCHAR(50) NOT NULL,
	[REP(1)] NVARCHAR(50) NOT NULL,
	[BPCTYP] NVARCHAR(50) NOT NULL,
	[OSTCTL] NVARCHAR(50) NOT NULL,
	[OSTAUZ] NVARCHAR(50) NOT NULL, 
	[TSCCOD(0)] NVARCHAR(50) NOT NULL,
	[TSCCOD(1)] NVARCHAR(50) NOT NULL,
	[TSCCOD(2)] NVARCHAR(50) NOT NULL,
	[BPCINV] NVARCHAR(50) NOT NULL,
	[BPAINV] NVARCHAR(50) NOT NULL,
	[BPCPYR] NVARCHAR(50) NOT NULL,
	[BPAPYR] NVARCHAR(50) NOT NULL,
	[BPCRSK] NVARCHAR(50) NOT NULL,
	[BPDADD] NVARCHAR(50) NOT NULL,
	[BPAADD] NVARCHAR(50) NOT NULL,
	[ACCCOD] NVARCHAR(50) NOT NULL,
	[VACBPR] NVARCHAR(50) NOT NULL,
	[PTE]    NVARCHAR(50)  NULL,
	[XX12NIF] NVARCHAR(50) NOT NULL,
	[XX12DOCTYP]  NVARCHAR(50)  NULL,
  --[XXX12DOCTYP] NVARCHAR(50) NULL,
	[XX12DOCNUM]  NVARCHAR(50)  NULL,
	[XX12REGIIBB] NVARCHAR(50) NOT NULL,
	[XX12IIBB]    NVARCHAR(50)  NULL,
	[XX12SITGAN]  NVARCHAR(50) NOT NULL,
	[XX12MTBBPR]  NVARCHAR(50) NOT NULL,
	[XX12PERFLG]  NVARCHAR(50) NOT NULL,
	[XX12BPRINT]  NVARCHAR(50) NOT NULL,
	[*71] NVARCHAR(MAX) NOT NULL,
	[*72] NVARCHAR(MAX) NOT NULL,
	[*81] NVARCHAR(MAX) NOT NULL,
	[*82] NVARCHAR(MAX) NOT NULL,

	INDICADOR2 NVARCHAR(15) NOT NULL,
	[BPAADD2]  NVARCHAR(80) NOT NULL,
	[BPADES]   NVARCHAR(80) NOT NULL,
	[BPAADDLIG(0)] NVARCHAR(80) NOT NULL,
	[BPAADDLIG(1)] NVARCHAR(80) NOT NULL,
	[BPAADDLIG(2)] NVARCHAR(80) NOT NULL,
	[POSCOD]       NVARCHAR(15) NOT NULL,
	[CTY]          NVARCHAR(50) NOT NULL,
	[CRY2]         NVARCHAR(50)  NULL,
	[BPAADDFLG]    NVARCHAR(80) NOT NULL,
	[TEL(0)] NVARCHAR(15) NOT NULL,
	[TEL(1)] NVARCHAR(15) NOT NULL,
	[TEL(2)] NVARCHAR(15) NOT NULL,
	[FCYWEB] NVARCHAR(80) NOT NULL,
	[WEB(0)] NVARCHAR(80) NOT NULL,
	[WEB(1)] NVARCHAR(80) NOT NULL,
	[WEB(2)] NVARCHAR(80) NOT NULL,	
	[FAX]    NVARCHAR(80) NOT NULL,

	INDICADOR_D NVARCHAR(15) NOT NULL,
	[BPAADD3]   NVARCHAR(80) NOT NULL,
	[BPDNAM(0)] NVARCHAR(80) NOT NULL,
	[VACBPR3]   NVARCHAR(80) NOT NULL,
	[REP(0)3]   NVARCHAR(20) NOT NULL,
	[REP(1)3]   NVARCHAR(20) NOT NULL,
	[STOFCY]    NVARCHAR(80) NOT NULL,
	[DRN]       NVARCHAR(80) NOT NULL,
	[DLVPIO]    NVARCHAR(80) NOT NULL,
	[MDL]       NVARCHAR(80) NOT NULL,
	[BPTNUM]    NVARCHAR(80) NOT NULL,
	[DAYLTI]    NVARCHAR(25) NOT NULL,
	[*713]      NVARCHAR(MAX) NOT NULL,
	[*723]      NVARCHAR(MAX) NOT NULL,
	[*813]      NVARCHAR(MAX) NOT NULL,
	[*823]      NVARCHAR(MAX) NOT NULL,

	INDICADORC NVARCHAR(15) NOT NULL,
	[CCNCRM]   NVARCHAR(80) NOT NULL,
	[CNTTTL]   NVARCHAR(80) NOT NULL,
	CNTFNA NVARCHAR(80) NULL, 
	CNTLNA NVARCHAR(80) NULL, 
	TEL NVARCHAR(80) NULL,
	CNTFNC NVARCHAR(80) NULL,
	[*1] NVARCHAR(80) NULL,
	[WEB] NVARCHAR(80) NULL,
	[MOB] NVARCHAR(80) NULL

	/*INDICADORO NVARCHAR(15) NULL,
	[ODFCOD] NVARCHAR(80) NULL,
	[ODFVAL] NVARCHAR(80) NULL,
	
	INDICADORP NVARCHAR(15) NULL,
	[SAT] NVARCHAR(80) NULL,
	[DATDEB] NVARCHAR(80) NULL,
	[DATFIN] NVARCHAR(80) NULL*/
)


INSERT INTO @TMPTABLE_CLIENTES
SELECT DISTINCT 
		'B' AS 'B',	
		
		(CASE (C.TIC_CODIGO)											--Categoria
			WHEN '' THEN ''									            --01 SUCURSAL, 02 FABRICA, 
			ELSE C.TIC_CODIGO											--03 EXPORTACIÓN, 04 EMPRESA, 05 DISTRIBUIDORA*/
		END) AS [BCGCOD],
		
		LEFT(C.CL_CODIGO,5) AS [BPCNUM],										--Codigo de cliente automatico  (Lo dejamos vacío)	
		LEFT(C.CL_NOMBRE,35) AS [BPRNAM],													--Razon Social (Opcion 2 - 1) Si 2) No)
		LEFT(C.CL_NOMBRE,10) AS [BPRSHO],										--Descrip. corta "OBLIGATORIO"  (Acá va la Razón Social)
		LEFT(C.[CL_CODIGO],10) AS [BPRLOG],							--Sigla del cliente equivale al código de cliente en Zeus

		/*(SELECT CASE UPPER(prov.PO_DESCRI)
				--LISTADO PAISES
				WHEN 'BOLIVIA' THEN 'BO'
				WHEN 'BRASIL' THEN 'BR'
				WHEN 'ARGENTINA' THEN 'AR'
				WHEN 'CHILE' THEN 'CL'
				WHEN 'COLOMBIA' THEN 'CO'
				WHEN 'ECUADOR' THEN 'EC'
				WHEN 'ESTADOS UNIDOS' THEN 'US'
				WHEN 'GUATEMALA' THEN 'GT'
				WHEN 'ITALIA' THEN 'IT'
				WHEN 'MEXICO' THEN 'MX'
				WHEN 'PANAMA' THEN 'PA'
				WHEN 'PARAGUAY' THEN 'PY'
				WHEN 'PERU' THEN 'PE'
				WHEN 'SUIZA' THEN 'SZ'
				WHEN 'UCRANIA' THEN 'UA'
				WHEN 'URUGUAY' THEN 'UY'
				WHEN 'VENEZUELA' THEN 'VE'
				/**********Provincias*********/
				WHEN 'FORMOSA' THEN 'AR'
			    WHEN 'JUJUY' THEN 'AR'
				WHEN 'LA PAMPA' THEN 'AR'
				WHEN 'LA RIOJA' THEN 'AR'
				WHEN 'MENDOZA' THEN 'AR'
				WHEN 'MISIONES' THEN 'AR'
				WHEN 'NEUQUEN' THEN 'AR'
				WHEN 'RIO NEGRO' THEN 'AR'
				WHEN 'BUENOS AIRES' THEN 'AR'
				WHEN 'CAPITAL FEDERAL' THEN 'AR'
				WHEN 'CATAMARCA' THEN 'AR'
				WHEN 'CHACO' THEN 'AR'
				WHEN 'CHUBUT' THEN 'AR'
				WHEN 'CORDOBA' THEN 'AR'
				WHEN 'CORRIENTES' THEN 'AR'
				WHEN 'ENTRE RIOS' THEN 'AR'
				WHEN 'SALTA' THEN 'AR'
				WHEN 'SAN JUAN' THEN 'AR'
				WHEN 'SAN LUIS' THEN 'AR'
				WHEN 'SANTA CRUZ' THEN 'AR'
				WHEN 'SANTA FE' THEN 'AR'
				WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				WHEN 'TUCUMAN' THEN 'AR'
				WHEN 'TIERRA DEL FUEGO' THEN 'AR'*/
			
			'' AS [CRY],
		
		   'SPA' AS [LAN],											  --Idioma (SPA-Español ENG-Inglés)  (A definir por la gente de ADONIX)
		   (CASE (left (C.CL_CUIT,20)) 
			  WHEN '' THEN ''
			  ELSE C.CL_CUIT
		    END) AS [CRN],											   --N.I.F. (Número de CUIT)
		   'ARS' AS [CUR],											   --Divisa (ARS-Peso, USD-Dólar)

		/************************************************/

		'D' AS [ABCCLS],												--Categoría ABC   1) Clase A, 2) Clase B, 3) Clase C,  4) Clase D (Para la importancia en volum�n de negocios)
	    '2' AS [DME],													--Entrega parcial 1) Autorizada, 2) Línea completa, 3) Pedido completo (Modo de entrega para los pedidos)
	    '2' AS [FREINV],												--Facturación porte Determina si el transporte del pedido se le factura al cliente o no 
	    '6' AS [IME],													--Modo facturacion 1) Albar�n 2) Pedido saldado 3) Pedido 4) Cliente entregado 5) Periodo 6) Manual
	    '1' AS [INVPER],												--Periodicidad factura 1)a peticion 2)dia 3)Semana 4)en 10 dias 5)Quincena 6)Mes
	    '1' AS [COMCAT],												--Categoria comision 1) Categoria 1 - 2) Categoria 2 - 3) Categoria 3
																		--Tasa de comision para los vendedores

		/*******************************************/

		'' AS [REP(0)],								                    --Representante
		'' AS [REP(1)],								                    --Representante 
		'1' AS [BPCTYP],												--Tipo 1) Normal - 2) Vario (Le pusimos normal porque es obligatorio)
		'2' AS [OSTCTL],												--(Definir) Control de encurso 1) Controlado - 2) Libre - 3) Bloqueado */
		'' AS [OSTAUZ],								                    --Encurso autoriz (Limite de credito que se le da al cliente)
		'' AS [TSCCOD(0)],												--Familia estadistica
		'' AS [TSCCOD(1)],												--Familia estadistica
		'' AS [TSCCOD(2)],												--Familia estadistica	
		/*******************************************/

		C.CL_CODIGO AS [BPCINV],										--Cliente factura (Va a ser el mismo código de cliente, la gente de adonix nos lo va a pasar)  -- Consultar
	    '' AS [BPAINV],													--Dirección  (Código de dirección de facturación sugerido)
		'' AS [BPCPYR],													--Cliente pagador (Aqui traemos el mismo código del cliente BPCNUM)
		'' AS [BPAPYR],													--Dirección (Dirección del cliente pagador) mismo campo que BPAADD
		'' AS [BPCRSK],													--Cliente riesgo (Código del cliente en curso) código del cliente BPCNUM
		'PRI' AS [BPDADD],												--Dirección  (Dirección del cliente en curso) mismo campo que BPAADD
	    '2' AS [BPAADD],												--Direc. por defecto 1) No - 2) Si
		'STD' AS [ACCCOD],												--Código contable (Tiene que verlo la gente de contaduria)

		CASE C.CL_IVA 
			WHEN 1 THEN 'CF'
			WHEN 2 THEN 'RI'
			WHEN 3 THEN 'RNI'
			WHEN 4 THEN 'EXE'
			WHEN 5 THEN 'CF'
			WHEN 6 THEN 'CF'
			WHEN 7 THEN 'EXE'
			WHEN 8 THEN 'RM'											--En Zeus 'Responsable Monotributo' - En SAGE 'Regimen Monotributista'
			WHEN 9 THEN 'RNC'											--En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
			ELSE 'CF'
		END AS [VACBPR],												--Reg.impuesto 
	   
		(CASE (LEFT(C.CVE_CODIGO,15)) 
			WHEN '001' THEN '001'
			WHEN '004' THEN '002'
			WHEN '008' THEN '004'
			WHEN '014' THEN '005'
			WHEN ''    THEN '001'
			else '001'
		END)
		AS [PTE],														--Condición pago (Ver si se van a usar los mismos del Zeus)

        (CASE (LEFT(C.CL_CUIT,11))  
			WHEN '' THEN ''
			ELSE C.CL_CUIT
		END
		) AS [XX12NIF],													--Número de CUIT/CUIL

	  CASE (LEFT(C.CL_IVA,20)) 
			WHEN 1 THEN '86'
			WHEN 2 THEN '80'
			WHEN 3 THEN '99'
			WHEN 4 THEN '80'
			WHEN 5 THEN '99'
			WHEN 6 THEN '99'
			WHEN 7 THEN '91'
			WHEN 8 THEN '80'											--En Zeus 'Responsable Monotributo' - En SAGE 'Regimen Monotributista'
			WHEN 9 THEN '99'											--En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
			ELSE ''END AS [XX12DOCTYP], 
		
		CASE (LEFT(C.CL_CUIT,18) )
		WHEN '' THEN ''
		ELSE C.CL_CUIT
        END AS  [XX12DOCNUM],									        --Número de Documento 
		
		'CM' AS [XX12REGIIBB],											--Régimen IIBB  1) CM,  2) Local,  3) Todas
		
		(CASE C.CL_IBR
		    WHEN '' THEN C.CL_CUIT
		    ELSE C.CL_IBR
		 END) AS [XX12IIBB],											--Núm Ingresos Brutos

        '' AS [XX12SITGAN],											    --Situacion Ganancias
        '' AS [XX12MTBBPR],											    --Monotributo
		'' AS [XX12PERFLG],												--Agente de Per. IVA. 1) No. 2) Si
		'' AS [XX12BPRINT],												--Tercero Interno. 1) No  2) Si
		'' AS [*71],													--Texto pedido
		'' AS [*72],													--Texto pedido
		'' AS [*81],													--Texto factura
		'' AS [*82],													--Texto factura

        /*******************************************************/

		'A' AS 'A',														
		'PRI' AS [BPAADD2],												--Dirección "OBLIGATORIA"
	    '' AS [BPADES],										            --Descripción
		UPPER(LEFT(C.[CL_DIRECC], 50)) AS [BPAADDLIG(0)],				--Linea dirección
		'' AS [BPAADDLIG(1)],											--Linea dirección 	
		'' AS [BPAADDLIG(2)],											--Linea dirección

		CASE LEFT(C.[CL_CODPOS], 10)
			WHEN '' THEN ''
			ELSE LEFT(C.[CL_CODPOS], 10)
		END AS [POSCOD],												--Código Postal "OBLIGATORIA"

		''AS [CTY],							--Ciudad
		(SELECT CASE UPPER(prov.PO_DESCRI)
				--LISTADO PAISES
				WHEN 'BOLIVIA' THEN 'BO'
				WHEN 'BRASIL' THEN 'BR'
				WHEN 'ARGENTINA' THEN 'AR'
				WHEN 'CHILE' THEN 'CL'
				WHEN 'COLOMBIA' THEN 'CO'
				WHEN 'ECUADOR' THEN 'EC'
				WHEN 'ESTADOS UNIDOS' THEN 'US'
				WHEN 'GUATEMALA' THEN 'GT'
				WHEN 'ITALIA' THEN 'IT'
				WHEN 'MEXICO' THEN 'MX'
				WHEN 'PANAMA' THEN 'PA'
				WHEN 'PARAGUAY' THEN 'PY'
				WHEN 'PERU' THEN 'PE'
				WHEN 'SUIZA' THEN 'SZ'
				WHEN 'UCRANIA' THEN 'UA'
				WHEN 'URUGUAY' THEN 'UY'
				WHEN 'VENEZUELA' THEN 'VE'
				/*********Provincias ******/
				WHEN 'FORMOSA' THEN 'AR'
			    WHEN 'JUJUY' THEN 'AR'
				WHEN 'LA PAMPA' THEN 'AR'
				WHEN 'LA RIOJA' THEN 'AR'
				WHEN 'MENDOZA' THEN 'AR'
				WHEN 'MISIONES' THEN 'AR'
				WHEN 'NEUQUEN' THEN 'AR'
				WHEN 'RIO NEGRO' THEN 'AR'
				WHEN 'BUENOS AIRES' THEN 'AR'
				WHEN 'CAPITAL FEDERAL' THEN 'AR'
				WHEN 'CATAMARCA' THEN 'AR'
				WHEN 'CHACO' THEN 'AR'
				WHEN 'CHUBUT' THEN 'AR'
				WHEN 'CORDOBA' THEN 'AR'
				WHEN 'CORRIENTES' THEN 'AR'
				WHEN 'ENTRE RIOS' THEN 'AR'
				WHEN 'SALTA' THEN 'AR'
				WHEN 'SAN JUAN' THEN 'AR'
				WHEN 'SAN LUIS' THEN 'AR'
				WHEN 'SANTA CRUZ' THEN 'AR'
				WHEN 'SANTA FE' THEN 'AR'
				WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				WHEN 'TUCUMAN' THEN 'AR'
				WHEN 'TIERRA DEL FUEGO' THEN 'AR'
			ELSE 'AR'
			END)  AS [CRY2],
					

			
															            --País "OBLIGATORIA"
		'2'AS [BPAADDFLG],												--Por defecto 1) No 2) Si "OBLIGATORIA"	   
		'' AS [TEL(0)],													--Telefono Particular
		'' AS [TEL(1)],													--Telefono
		'' AS  [TEL(2)],												--Telefono
		LEFT(C.CL_WWW,250)   AS [FCYWEB],								--Sitio Web
		LEFT(C.CL_EMAIL,80)  AS [WEB(0)],								--Direccion Internet
		LEFT(C.CL_EMAIL2,80) AS [WEB(1)],								--Direccion Internet
		LEFT(C.CL_EMAIL3,80) AS [WEB(2)],								--Direccion Internet
		'' AS [FAX],													--FAX	 
		
		/********************************************************/
		'D' AS 'D',						
		
	    'PRI' AS [BPAADD3],						                        --Dirección entrega "OBLIGATORIA" (A definir)
		C.CL_NOMBRE AS [BPDNAM(0)],										--Razón Social (Consultar si se coloca el mismo nombre igual que arriba)
		'' AS [VACBPR3],												--Reg.impuesto
		'' AS [REP(0)3],							 					--Representante
		'' AS [REP(1)3],												--Representante
		'' AS [STOFCY],													--Planta expedicion
		'' AS [DRN],													--Nº ruta, 1) Ruta 1 2) Ruta 2 3) Ruta 3 "OBLIGATORIA" (A definir)
		C.CL_PRIORIDAD AS [DLVPIO],										--Prioridad entrega  1) Normal 2) Urgente 3) Muy urgente  
		'' AS [MDL],													--Modo de entrega (A definir)
		'' AS [BPTNUM],													--Transportista (A definir)
		'' AS [DAYLTI],													--Plazo ent. en días (A definir)
		'' AS [*713],													--Texto preparación
		'' AS [*723],													--Texto preparación
		'' AS [*813],													--Texto entrega
		'' AS [*823],													--Texto entrega	  
		'C' AS 'C',
		'' AS [CCNCRM],
		'SEÑOR' AS [CNTTTL],
		PARSENAME( REPLACE((LEFT(CLC_NOMBRE,20)),' ','.'),2) AS CNTFNA,    --Nombre 
        PARSENAME( REPLACE((LEFT(CLC_NOMBRE,35)),' ','.'),1) AS CNTLNA,    --Apellidos
		'' as TEL,


		

/*ISNULL((SELECT STUFF ((SELECT ' (' + */(CASE CC.CLC_TIPO --FunciónA
														WHEN  'Gerente de Compras' THEN '4'
														WHEN  'Gerente de Ventas'  THEN '2'
														WHEN  'Gerente de General' THEN '1'
														WHEN  'Servicio Técnico'   THEN '11'
														WHEN  'Pagos'              THEN '11'
														WHEN  'Encargado de Pagos' THEN '11'
														WHEN  'Banco Galicia'      THEN '11'
														WHEN  'ANIBAL'             THEN '11'
														WHEN  'Administracion'     THEN '11'
														WHEN  'Encargado de Cobranzas' THEN '7'
														WHEN  'pago'               THEN '11'
														WHEN  'Administración'     THEN '11'
														WHEN  'Consultas'          THEN '11'
														WHEN  'Contabilidad y Finanzas' THEN '7'
														WHEN  'Ventas'             THEN '2'
														WHEN  'Pago a proveedores' THEN '11'
														WHEN  'Compras '           THEN '4'
														WHEN  'Pagos - Compras '   THEN '4'
														WHEN  'Tesorería '         THEN '7'  
														WHEN  'Banco Patagonia '   THEN '11'
														WHEN  'Finanzas '          THEN '7'	
														ELSE ''
											END) AS 'CNTFNC',
					/*FROM CLIENTES_CONTACTO cliContact
					WHERE cliContact.CL_CODIGO = c.CL_CODIGO
					FOR XML PATH('')), 1, 1,'')), '')*/ /*AS 'CNTFNC',*/											
														
		'' AS [*1],
		LEFT(CC.CLC_EMAIL,80)	AS 'WEB' ,
		''	AS 'MOB'

		/*'O' AS 'O',												
		'' AS [ODFCOD],												--Otros Datos Locales
		'' AS [ODFVAL],												--Valor
		'P' AS 'P',													--
		'' AS [SAT],												--Provincia
		'' AS [DATDEB],												--Fecha desde
		'' AS [DATFIN]	*/											--Fecha hasta
	FROM [Venturi].[dbo].[CLIENTES] C 
	LEFT JOIN [Venturi].[dbo].[CLIENTES_CONTACTO] CC
	ON CC.CL_CODIGO = C.CL_CODIGO 
	LEFT JOIN [Venturi].[dbo].PROVINCIA prov
	ON c.PO_CODIGO = prov.PO_CODIGO
	INNER JOIN CONDICIONIVA condIva
	ON c.CL_IVA = condIva.COI_CODIGO
	WHERE C.CL_CODPOS!=''

	
	
	IF OBJECT_ID('tempdb..##TMPDATA') IS NOT NULL
		DROP TABLE ##TMPDATA
		
	CREATE TABLE ##TMPDATA (
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
		Dato47 NVARCHAR(MAX) NULL,
		Dato48 NVARCHAR(MAX) NULL
	)	
	DECLARE @categoria nvarchar (20)
	DECLARE @codigoCliente NVARCHAR(MAX)
	DECLARE @sigla NVARCHAR(MAX) 
	DECLARE @familiaEstadististica NVARCHAR(MAX)

	SET @categoria= ''
	SET @codigoCliente = ''
	SET @sigla = ''
	SET @familiaEstadististica = ''
	
	DECLARE CLIENTESSIGLA CURSOR 
		FOR
		SELECT *
		FROM Venturi.dbo.cMF

	OPEN CLIENTESSIGLA
		FETCH CLIENTESSIGLA INTO  @categoria,@codigoCliente, @sigla, @familiaEstadististica

		WHILE(@@FETCH_STATUS=0)
		BEGIN

			INSERT INTO ##TMPDATA
			SELECT distinct 
				clienteTmp.Indicador, clientesSiglas.categoria, clientesSiglas.codigoCliente, clienteTmp.BPRNAM, clienteTmp.BPRSHO, clienteTmp.BPRLOG, 
				clienteTmp.CRY, clienteTmp.LAN,	clienteTmp.CRN,  clienteTmp.CUR,  clienteTmp.ABCCLS, clienteTmp.DME, clienteTmp.FREINV,  
				clienteTmp.IME, clienteTmp.INVPER,  clienteTmp.COMCAT,  clienteTmp.[REP(0)], clienteTmp.[REP(1)], clienteTmp.[BPCTYP], 
				clienteTmp.[OSTCTL], clienteTmp.[OSTAUZ], clientesSiglas.familiaEstadistica,clienteTmp.[TSCCOD(1)], clienteTmp.[TSCCOD(2)], 
				clientesSiglas.codigoCliente, clienteTmp.[BPAINV], clientesSiglas.codigoCliente, clienteTmp.[BPAPYR], clientesSiglas.codigoCliente, clienteTmp.[BPDADD], 
				clienteTmp.[BPAADD],  clienteTmp.[ACCCOD], clienteTmp.[VACBPR], clienteTmp.[PTE], clienteTmp.[XX12NIF], clienteTmp.[XX12DOCTYP], 
				'', clienteTmp.[XX12DOCNUM], clienteTmp.[XX12REGIIBB], clienteTmp.[XX12IIBB], clienteTmp.[XX12SITGAN], 
				clienteTmp.[XX12MTBBPR], clienteTmp.[XX12PERFLG], clienteTmp.[XX12BPRINT], clienteTmp.[*71], clienteTmp.[*72], clienteTmp.[*81], 
				clienteTmp.[*82]
				FROM @TMPTABLE_CLIENTES clienteTmp, Venturi.dbo.cMF clientesSiglas
				WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 


				
			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADOR2, clienteTmp.[BPAADD2], clienteTmp.[BPADES], clienteTmp.[BPAADDLIG(0)], clienteTmp.[BPAADDLIG(1)], 
				clienteTmp.[BPAADDLIG(2)], clienteTmp.[POSCOD], clienteTmp.[CTY], clienteTmp.[CRY2], clienteTmp.[BPAADDFLG], clienteTmp.[TEL(0)],	
				clienteTmp.[TEL(1)], clienteTmp.[TEL(2)], clienteTmp.[FCYWEB], clienteTmp.[WEB(0)], clienteTmp.[WEB(1)], clienteTmp.[WEB(2)],
				clienteTmp.[FAX], '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',  
				'', '', '', '', '',''
			FROM @TMPTABLE_CLIENTES clienteTmp, Venturi.dbo.cMF clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 


			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADOR_D  , clienteTmp.[BPAADD3], clienteTmp.[BPDNAM(0)], clienteTmp.[VACBPR3], clienteTmp.[REP(0)3], clienteTmp.[REP(1)3],
				clienteTmp.[STOFCY], clienteTmp.[DRN], clienteTmp.[DLVPIO], clienteTmp.[MDL], clienteTmp.[BPTNUM], clienteTmp.[DAYLTI], 
				clienteTmp.[*713], clienteTmp.[*723], clienteTmp.[*813], clienteTmp.[*823], '', '',  '', '',  '', '', '',  '' , '' , '' , '',
				'', '',  '',  '',  '',  '', '',  '',  '',  '',  '', '',  '',  '',  '',  '',  '',  '',  '', '',  '' 
			FROM @TMPTABLE_CLIENTES clienteTmp, Venturi.dbo.cMF clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 
			
			
			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADORC, clienteTmp.[CCNCRM], clienteTmp.[CNTTTL], clienteTmp.CNTFNA, clienteTmp.CNTLNA, 
				clienteTmp.TEL, clienteTmp.CNTFNC, clienteTmp.[*1], clienteTmp.[WEB], clienteTmp.[MOB],
				'', '', '', '', '', '', '', '', '', '', '', '', '', '', '' , '', '', '', '', '', '', '', '', '', '', '', '',  
				'', '', '', '', '', '', '', '', '', '', '' 
			FROM @TMPTABLE_CLIENTES clienteTmp, Venturi.dbo.cMF clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 
			
			/*INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADORO, clienteTmp.[ODFCOD], clienteTmp.[ODFVAL], '', '', '', '', '', '', '', '', '', '', '', '', '',  
				'', '', '', '', '', '',  '', '' , '' , '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''
			FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 
			
			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADORP, clienteTmp.[SAT], clienteTmp.[DATDEB], clienteTmp.[DATFIN], '', '', '', '', '', '', '', '', '', '', '', 
				'', '', '', '', '', '',	'', '', '', '' , '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '' 
			FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente */

			FETCH CLIENTESSIGLA INTO @categoria, @codigoCliente, @sigla, @familiaEstadististica
	
		END
	
	CLOSE CLIENTESSIGLA

	DEALLOCATE CLIENTESSIGLA
		SELECT tmpData.Dato1   ,ISNULL(tmpData.Dato2,'') ,ISNULL(tmpData.Dato3,''), ISNULL(tmpData.Dato4,'SD'),ISNULL(tmpData.Dato5,'SD'),
	 ISNULL(tmpData.Dato6,'')  ,ISNULL(tmpData.Dato7,'') ,ISNULL(tmpData.Dato8,''), ISNULL(tmpData.Dato9,''),  ISNULL(tmpData.Dato10,''),
	 ISNULL(tmpData.Dato11,'') ,ISNULL(tmpData.Dato12,''),ISNULL(tmpData.Dato13,''),ISNULL(tmpData.Dato14,''), ISNULL(tmpData.Dato15,'')
	,ISNULL(tmpData.Dato16,'') ,ISNULL(tmpData.Dato17,''),ISNULL(tmpData.Dato18,''),ISNULL(tmpData.Dato19,''), ISNULL(tmpData.Dato20,'')
	,ISNULL(tmpData.Dato21,'') ,ISNULL(tmpData.Dato22,''),ISNULL(tmpData.Dato23,''),ISNULL(tmpData.Dato24,''), ISNULL(tmpData.Dato25,'')
	,ISNULL(tmpData.Dato26,'') ,ISNULL(tmpData.Dato27,''),ISNULL(tmpData.Dato28,''),ISNULL(tmpData.Dato29,''), ISNULL(tmpData.Dato30,'')
	,ISNULL(tmpData.Dato31,'') ,ISNULL(tmpData.Dato32,''),ISNULL(tmpData.Dato33,''),ISNULL(tmpData.Dato34,''), ISNULL(tmpData.Dato35,'')
	,ISNULL(tmpData.Dato36,'') ,ISNULL(tmpData.Dato38,''),ISNULL(tmpData.Dato39,''),ISNULL(tmpData.Dato40,'')
	,ISNULL(tmpData.Dato41,'') ,ISNULL(tmpData.Dato42,''),ISNULL(tmpData.Dato43,''),ISNULL(tmpData.Dato44,''), ISNULL(tmpData.Dato44,'')
	,ISNULL(tmpData.Dato45,'') ,ISNULL(tmpData.Dato46,''),ISNULL(tmpData.Dato47,''),ISNULL(tmpData.Dato48,'')
    FROM ##TMPDATA tmpData


       /*(select stuff ((select '   ' + clientesContactos.CLC_NOMBRE
			                from CLIENTES_CONTACTO clientesContactos 
							where clientesContactos.CL_CODIGO = c.CL_CODIGO
							for xml path('')), 1,1,''))*/ /*Stuff función == nos permite agregar todo en una misma linea en base  
							                                en base a la información brindada en este caso los nombre del 
															los clientes contacto (CNTFNA,CNTLNA)*/

		/*(select stuff ((select '   ' + clientesContactos.CLC_TELEFO
			                from CLIENTES_CONTACTO clientesContactos 
							where clientesContactos.CL_CODIGO = c.CL_CODIGO
							for xml path('')), 1,1,''))*//*Stuff función == nos permite agregar todo en una misma linea en base  
							                                en base a la información brindada en este caso los nombre del 
															los clientes contacto  (TEL)*/


		/*(select stuff ((select '/' + clientesContactos.CLC_EMAIL
			                from CLIENTES_CONTACTO clientesContactos 
							where clientesContactos.CL_CODIGO = c.CL_CODIGO
							for xml path('')), 1,1,''))Stuff función == nos permite agregar todo en una misma linea en base  
							                                en base a la información brindada en este caso los nombre del 
															los clientes contacto (AS WEB) */


		/*(select stuff ((select ' / ' + clientesContactos.CLC_TELEFO 
			                from CLIENTES_CONTACTO clientesContactos 
			                where clientesContactos.CL_CODIGO = c.CL_CODIGO
		                    for xml path('')), 1,1,''))*Stuff función == nos permite agregar todo en una misma linea en base  
							                                en base a la información brindada en este caso los nombre del 
															los clientes contacto (AS MOB) */

	   