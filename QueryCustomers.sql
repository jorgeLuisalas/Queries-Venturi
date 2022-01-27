﻿USE Venturi
GO

DECLARE @TMPTABLE_CLIENTES TABLE
(
	Indicador VARCHAR(2) NOT NULL,
	[BCGCOD] VARCHAR(10) NOT NULL,
	[BPCNUM] NVARCHAR(50) NOT NULL,
	[BPRNAM] INTEGER NOT NULL,
	[BPRSHO] NVARCHAR(50) NOT NULL,
	[BPRLOG] NVARCHAR(50) NOT NULL,
	[CRY] NVARCHAR(50) NOT NULL,
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
	[PTE] NVARCHAR(50) NOT NULL,
	[XX12NIF] NVARCHAR(50) NOT NULL,
	[XX12DOCTYP] NVARCHAR(50) NOT NULL,
	[XXX12DOCTYP] NVARCHAR(50) NULL,
	[XX12DOCNUM] NVARCHAR(50) NOT NULL,
	[XX12REGIIBB] NVARCHAR(50) NOT NULL,
	[XX12IIBB] NVARCHAR(50) NOT NULL,
	[XX12SITGAN] NVARCHAR(50) NOT NULL,
	[XX12MTBBPR] NVARCHAR(50) NOT NULL,
	[XX12PERFLG] NVARCHAR(50) NOT NULL,
	[XX12BPRINT] NVARCHAR(50) NOT NULL,
	[*71] NVARCHAR(MAX) NOT NULL,
	[*72] NVARCHAR(MAX) NOT NULL,
	[*81] NVARCHAR(MAX) NOT NULL,
	[*82] NVARCHAR(MAX) NOT NULL,

	INDICADOR2 NVARCHAR(15) NOT NULL,
	[BPAADD2] NVARCHAR(80) NOT NULL,
	[BPADES] NVARCHAR(80) NOT NULL,
	[BPAADDLIG(0)] NVARCHAR(80) NOT NULL,
	[BPAADDLIG(1)] NVARCHAR(80) NOT NULL,
	[BPAADDLIG(2)] NVARCHAR(80) NOT NULL,
	[POSCOD] NVARCHAR(15) NOT NULL,
	[CTY] NVARCHAR(50) NOT NULL,
	[CRY2] NVARCHAR(50) NOT NULL,
	[BPAADDFLG] NVARCHAR(80) NOT NULL,
	[TEL(0)] NVARCHAR(15) NOT NULL,
	[TEL(1)] NVARCHAR(15) NOT NULL,
	[TEL(2)] NVARCHAR(15) NOT NULL,
	[FCYWEB] NVARCHAR(80) NOT NULL,
	[WEB(0)] NVARCHAR(80) NOT NULL,
	[WEB(1)] NVARCHAR(80) NOT NULL,
	[WEB(2)] NVARCHAR(80) NOT NULL,	
	[FAX] NVARCHAR(80) NOT NULL,

	INDICADOR_D NVARCHAR(15) NOT NULL,
	[BPAADD3] NVARCHAR(80) NOT NULL,
	[BPDNAM(0)] NVARCHAR(80) NOT NULL,
	[VACBPR3] NVARCHAR(80) NOT NULL,
	[REP(0)3] NVARCHAR(20) NOT NULL,
	[REP(1)3] NVARCHAR(20) NOT NULL,
	[STOFCY] NVARCHAR(80) NOT NULL,
	[DRN] NVARCHAR(80) NOT NULL,
	[DLVPIO] NVARCHAR(80) NOT NULL,
	[MDL] NVARCHAR(80) NOT NULL,
	[BPTNUM] NVARCHAR(80) NOT NULL,
	[DAYLTI] NVARCHAR(25) NOT NULL,
	[*713] NVARCHAR(MAX) NOT NULL,
	[*723] NVARCHAR(MAX) NOT NULL,
	[*813] NVARCHAR(MAX) NOT NULL,
	[*823] NVARCHAR(MAX) NOT NULL,

	INDICADORC NVARCHAR(15) NOT NULL,
	[CCNCRM] NVARCHAR(80) NOT NULL,
	[CNTTTL] NVARCHAR(80) NOT NULL,
	CNTFNA NVARCHAR(80) NULL, 
	CNTLNA NVARCHAR(80) NULL, 
	TEL NVARCHAR(80) NULL,
	CNTFNC NVARCHAR(80) NULL,
	[*1] NVARCHAR(80) NULL,
	[WEB] NVARCHAR(80) NULL,
	[MOB] NVARCHAR(80) NULL,

	INDICADORO NVARCHAR(15) NULL,
	[ODFCOD] NVARCHAR(80) NULL,
	[ODFVAL] NVARCHAR(80) NULL,
	
	INDICADORP NVARCHAR(15) NULL,
	[SAT] NVARCHAR(80) NULL,
	[DATDEB] NVARCHAR(80) NULL,
	[DATFIN] NVARCHAR(80) NULL
)


INSERT INTO @TMPTABLE_CLIENTES
SELECT DISTINCT 
		'B' AS 'B',														--
		(CASE (C.TIC_CODIGO)											--Categoria
			WHEN '' THEN 'A DEFINIR'									--01 SUCURSAL, 02 FABRICA, 
			ELSE C.TIC_CODIGO											--03 EXPORTACIÓN, 04 EMPRESA, 05 DISTRIBUIDORA*/
		END) AS [BCGCOD],										
		C.CL_CODIGO AS [BPCNUM],										--Codigo de cliente automatico  (Lo dejamos vacío)	
		2 AS [BPRNAM],													--Razon Social (Opcion 2 - 1) Si 2) No)
		C.CL_NOMBRE AS [BPRSHO],										--Descrip. corta "OBLIGATORIO"  (Acá va la Razón Social)
		LEFT(C.[CL_CODIGO], 10) AS [BPRLOG],							--Sigla del cliente equivale al código de cliente en Zeus
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
			
				--PROVINCIAS
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
			
				--ESTAS A VERIFICAR
				WHEN 'PN' THEN 'PN - A DEFINIR'
				WHEN 'TF' THEN 'TF - A DEFINIR �TIERRA DEL FUEGO?'
			
				ELSE 'A DEFINIR'					
			END) 
		AS [CRY],                     									--País (AR-Argentina, BR-Brasil, US-Estados unidos)
		'SPA' AS [LAN],													--Idioma (SPA-Español ENG-Inglés)  (A definir por la gente de ADONIX)
		(CASE C.CL_CUIT 
			WHEN '' THEN 'A DEFINIR'
			ELSE C.CL_CUIT
		END)
		AS [CRN],														--N.I.F. (Número de CUIT)
																		--(Consultar a la gente de ADONIX, te pide longuitud 3)
		'ARS' AS [CUR],													--Divisa (ARS-Peso, USD-Dólar)
		/**CAMPOS OBLIGATORIO - A DEFINIR **********/

		'D' AS [ABCCLS],												--Categoría ABC   1) Clase A, 2) Clase B, 3) Clase C,  4) Clase D (Para la importancia en volum�n de negocios)
									
		'2' AS [DME],													--Entrega parcial 1) Autorizada, 2) Línea completa, 3) Pedido completo (Modo de entrega para los pedidos)
	  
		'2' AS [FREINV],												--Facturación porte Determina si el transporte del pedido se le factura al cliente o no 
																		--1) Facturado 2) Franco  --Definir
    
		'6' AS [IME],													--Modo facturacion 1) Albar�n 2) Pedido saldado 3) Pedido 4) Cliente entregado 5) Periodo 6) Manual
	   
		'1' AS [INVPER],												--Periodicidad factura 1)a peticion 2)dia 3)Semana 4)en 10 dias 5)Quincena 6)Mes
	    
		'1' AS [COMCAT],												--Categoria comision 1) Categoria 1 - 2) Categoria 2 - 3) Categoria 3
																		--Tasa de comision para los vendedores

		/*******************************************/

		/*vend.VEN_CODIGO*/ '' AS [REP(0)],								--Representante
		/*pers.PER_NOMBRE*/ '' AS [REP(1)],								--Representante 
		1 AS [BPCTYP],													--Tipo 1) Normal - 2) Vario (Le pusimos normal porque es obligatorio)
		'2' AS [OSTCTL],												/*(Definir) Control de encurso 1) Controlado - 2) Libre - 3) Bloqueado */
		/*C.[CL_LIMCRE]*/ '' AS [OSTAUZ],								--Encurso autoriz (Limite de credito que se le da al cliente)
		'' AS [TSCCOD(0)],												--Familia estadistica
		'' AS [TSCCOD(1)],												--Familia estadistica
		'' AS [TSCCOD(2)],												--Familia estadistica	
		/***** CAMPOS OBLIGATORIOS ****/

		C.CL_CODIGO AS [BPCINV],										--Cliente factura (Va a ser el mismo código de cliente, la gente de adonix nos lo va a pasar)  -- Consultar
																		--Lo mismo que el campo BPCNUM
		'' AS [BPAINV],													--Dirección  (Código de dirección de facturación sugerido)
																		/*Va a ser el mismo campo que BPAADD*/
																		/* C.CL_CODIGO */ 
		'' AS [BPCPYR],													--Cliente pagador (Aqui traemos el mismo código del cliente BPCNUM)
		'' AS [BPAPYR],													--Dirección (Dirección del cliente pagador) mismo campo que BPAADD
		'' AS [BPCRSK],													--Cliente riesgo (Código del cliente en curso) código del cliente BPCNUM
		'PRI' AS [BPDADD],												--Dirección  (Dirección del cliente en curso) mismo campo que BPAADD
	    /************/

		2 AS [BPAADD],													--Direc. por defecto 1) No - 2) Si
		'' AS [ACCCOD],													--Código contable (Tiene que verlo la gente de contaduria)
		CASE C.CL_IVA 
			WHEN 1 THEN 'CF'
			WHEN 2 THEN 'RI'
			WHEN 3 THEN 'RNI'
			WHEN 4 THEN 'EXE'
			WHEN 5 THEN ''
			WHEN 6 THEN ''
			WHEN 7 THEN ''
			WHEN 8 THEN 'RM'											--En Zeus 'Responsable Monotributo' - En SAGE 'Regimen Monotributista'
			WHEN 9 THEN 'RNC'											--En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
			ELSE 'A DEFINIR'
		END AS [VACBPR],												--Reg.impuesto 
	   
		(CASE C.CVE_CODIGO 
			WHEN '' THEN 'A DEFINIR'
			ELSE C.CVE_CODIGO
		END)
		AS [PTE],														--Condición pago (Ver si se van a usar los mismos del Zeus)
		(CASE C.CL_CUIT  
			WHEN '' THEN 'A DEFINIR'
			ELSE C.CL_CUIT
		END
		) AS [XX12NIF],													--Número de CUIT/CUIL
	    C.CL_TIPDOC AS [XX12DOCTYP],									--Tipo Documento  (Agrego este campo)
	   
		/* CLIENTES */
		CASE UPPER(C.CL_TIPDOC)
			WHEN 'DNI' THEN '96'
			WHEN 'CUIT' THEN '80'
			WHEN 'CUIL' THEN '86'
		END AS [XXX12DOCTYP],   		 	  
		
		C.CL_DOCUME AS [XX12DOCNUM],									--Número de Documento  		 
		'' AS [XX12REGIIBB],											--Régimen IIBB  1) CM,  2) Local,  3) Todas
		C.CL_IBR AS [XX12IIBB],											--Núm Ingresos Brutos
		'' AS [XX12SITGAN],												--Situacion Ganancias
	   																	/*
																			CF: Consumidor Final
																			EXC: Cliente exterior
																			EXE: Exento
																			EXP: Proveedores del exterior
																			INR: Inscripto no responsable
																			RI: Régimen inscripto
																			RM: Régimen monotributista
																			NCR: Responsable no categorizado
																			RNI: Responsable no inscripto
																		*/
		'' AS [XX12MTBBPR],												--Monotributo
																		/*
																			CF: Consumidor final
																			EXC: Cliente del exterior
																			EXE: Excento
																			EXP: Proveedores del exterior
																			INR: Responsable no inscripto
																			RI: Régimen inscripto
																			RM: Régimen monotributista
																			NCR: Responsable no categorizado
																			RNI: Responsable no inscripto
																		*/
		'' AS [XX12PERFLG],												--Agente de Per. IVA. 1) No. 2) Si
		'' AS [XX12BPRINT],												--Tercero Interno. 1) No  2) Si
		'' AS [*71],													--Texto pedido
		'' AS [*72],													--Texto pedido
		'' AS [*81],													--Texto factura
		'' AS [*82],													--Texto factura
		'A' AS 'A',														--
		'PRI' AS [BPAADD2],												--Dirección "OBLIGATORIA"
	    '' AS [BPADES],													--Descripción
		UPPER(LEFT(C.[CL_DIRECC], 50)) AS [BPAADDLIG(0)],				--Linea dirección
		'' AS [BPAADDLIG(1)],											--Linea dirección 	
		'' AS [BPAADDLIG(2)],											--Linea dirección
		CASE LEFT(C.[CL_CODPOS], 10)
			WHEN '' THEN 'A DEFINIR'
			ELSE LEFT(C.[CL_CODPOS], 10)
		END AS [POSCOD],												--Código Postal "OBLIGATORIA"
		UPPER(LEFT(C.CL_LOCALI,40)) AS [CTY],							--Ciudad
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
			
				--PROVINCIAS
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
					
				--ESTAS A VERIFICAR
				WHEN 'PN' THEN 'PN - VERIFICAR'
				WHEN 'TF' THEN 'TF - A DEFINIR �TIERRA DEL FUEGO?'
				ELSE 'A DEFINIR'
			END)
		AS [CRY2],														--País "OBLIGATORIA"
		2 AS [BPAADDFLG],												--Por defecto 1) No 2) Si "OBLIGATORIA"	   
		'' AS [TEL(0)],													--Telefono Particular
		'' AS [TEL(1)],													--Telefono
		'' AS  [TEL(2)],												--Telefono
		C.CL_WWW      AS [FCYWEB],										--Sitio Web
		C.CL_EMAIL AS [WEB(0)],											--Direccion Internet
		C.CL_EMAIL2 AS [WEB(1)],										--Direccion Internet
		C.CL_EMAIL3 AS [WEB(2)],										--Direccion Internet
		'' AS [FAX],													--FAX	   
		'D' AS 'D',														--
		/*En la otra query PRI*/ '' AS [BPAADD3],						--Dirección entrega "OBLIGATORIA" (A definir)
		C.CL_NOMBRE AS [BPDNAM(0)],										--Razón Social (Consultar si se coloca el mismo nombre igual que arriba)
		'ARG' AS [VACBPR3],												--Reg.impuesto
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
		PARSENAME(REPLACE(CLC_NOMBRE,' ','.'),2) AS CNTFNA,
		PARSENAME(REPLACE(CLC_NOMBRE,' ','.'),1) AS CNTLNA, 
		CC.CLC_TELEFO AS 'TEL',		
		(SELECT CASE (CC.CLC_TIPO)
			WHEN 'Gerente de Compras' THEN '4'
			WHEN 'Gerente de Ventas' THEN '2'
			WHEN 'Gerente de General' THEN '1'
			WHEN 'Servicio Técnico' THEN '11'
			WHEN 'Pagos' THEN '11'
			WHEN 'Encargado de Pagos' THEN '11'
		    WHEN 'Banco Galicia' THEN '11'
			WHEN 'ANIBAL' THEN '11'
			WHEN 'Administracion' THEN '11'
			WHEN 'Encargado de Cobranzas' THEN '7'
			WHEN 'pago' THEN '11'
			WHEN 'Administración' THEN '11'
			WHEN 'Consultas' THEN '11'
			WHEN 'Contabilidad y Finanzas' THEN '7'
			WHEN 'Ventas' THEN '2'
			WHEN 'Pago a proveedores' THEN '11'
			WHEN 'Compras' THEN '4'
			WHEN 'Pagos - Compras' THEN '4'
			WHEN 'Tesorería' THEN '7'  
			WHEN 'Banco Patagonia' THEN '11'
			WHEN 'Finanzas' THEN '7'	        
		END) AS 'CNTFNC',											/*Función: "OBLIGATORIA"
																		1)Presidente Directo Gral. 2)Director Comercial 3) Director Técnico 4)Responsable de compras 5)Comprador
																		6)Responsable de stocks 7)Director Financiero y jurídico 8)Responsable import/export
																		9)Director de planta 10)Operador externo 11)Varios 12)Interlocutor Reach
																	*/
														
		'' AS [*1],													--Dirección: De la tabla Clientes Sucursal no hay direcci�n
		CC.CLC_EMAIL  AS [WEB],										--E-mail
		CC.CLC_TELEFO AS [MOB],										--Móvil
		'O' AS 'O',													--
		'' AS [ODFCOD],												--Otros Datos Locales
		'' AS [ODFVAL],												--Valor
		'P' AS 'P',													--
		'' AS [SAT],												--Provincia
		'' AS [DATDEB],												--Fecha desde
		'' AS [DATFIN]												--Fecha hasta
	FROM [Venturi].[dbo].[CLIENTES] C 
	LEFT JOIN [Venturi].[dbo].[CLIENTES_CONTACTO] CC
	ON CC.CL_CODIGO = C.CL_CODIGO 
	LEFT JOIN [Venturi].[dbo].PROVINCIA prov
	ON c.PO_CODIGO = prov.PO_CODIGO
	INNER JOIN CONDICIONIVA condIva
	ON c.CL_IVA = condIva.COI_CODIGO
	LEFT JOIN VenturiFabrica.dbo.VENDEDOR vend						--VENDEDOR Y PERSONAL QUITARLAS
	ON C.VEN_CODIGO = vend.VEN_CODIGO
	LEFT JOIN VenturiFabrica.dbo.PERSONAL pers
	ON vend.PER_CODIGO = pers.PER_CODIGO 
	INNER JOIN Venturi.dbo.COMPROBANTES comp
	ON C.CL_CODIGO = comp.CL_CODIGO
	
	WHERE 1 = 1 and  C.ES_CODIGO <> '02'

	--and comp.CO_CODIGO in ('RIE', 'REM', 'RII','REC', 'FAR', 'FAC', 'NCR', 'NDB')
	--and comp.CO_FECHA BETWEEN DATEADD(year, -2, getDate()) and getDate()

	AND C.CL_CODIGO in(
		'09102', '09101', '09103', '09003', '09004', '09100', '00102', '00104', '00107', '00349', '00492', '01304', '01927', '01966', '01982',
		'02003', '02351', '20052', '20061', '20065', '20068', '20070', '20073', '20111', '20116', '20126', '20131', '20135', '20141', '20156',
		'20165', '20192', '20198', '20199', '20216', '20218', '20222', '20223', '20225', '20226', '20228', '20229', '20230', '20233', '20237',
		'24993', '40028', '40373', '41855', '60094', '60191', '60331', '60877', '90153', '90215', '90221', '90510', '90529', '07024', '07046',
		'07051', '07002', '07010', '07015', '07032', '07043', '07047', '07082', '07091', '07098', '00009', '00010', '00011', '00113', '00767',
		'00965', '01396', '01479', '01529', '01547', '01564', '01571', '01576', '07110', '01592', '01593', '01616', '01624', '01663', '01669',
		'01678', '01703', '01725', '01732', '01741', '01748', '01754', '01773', '01780', '01783', '01798', '01802', '01820', '01903', '20231',
		'25652', '30007', '30035', '30043', '30044', '30045', '30056', '30066', '30068', '30070', '30081', '30082', '30088', '30092', '30098',
		'30111', '30115', '30118', '30123', '30124', '30125', '30130', '30133', '30136', '30138', '30144', '30145', '30151', '30154', '30155',
		'30157', '30164', '30170', '30171', '30172', '30173', '30175', '30179', '30181', '30182', '30183', '30184', '30185', '30186', '30188',
		'30189', '30193', '30199', '30202', '30204', '30205', '30207', '30208', '30209', '30211', '30216', '30218', '30219', '30225', '30228',
		'30230', '30231', '30233', '30242', '30243', '30247', '30249', '30254', '30256', '30263', '30265', '30269', '30272', '30275', '30286',
		'30288', '30310', '30320', '30321', '30324', '30330', '30334', '30339', '30341', '30358', '30371', '30386', '30388', '30389', '30428',
		'30438', '30443', '30446', '30460', '30469', '30473', '30487', '30493', '30498', '30499', '30500', '30504', '30508', '30518', '30520',
		'30522', '30529', '30536', '30538', '30539', '30540', '30543', '30545', '30546', '30548', '30550', '30553', '30554', '30560', '30563',
		'30567', '30574', '30581', '30589', '30596', '30602', '30604', '30609', '30611', '30626', '30628', '30629', '30630', '30633', '30634',
		'30639', '30640', '30659', '30661', '30662', '30670', '30672', '30677', '30680', '30682', '30706', '30708', '30717', '30718', '30723',
		'30732', '30734', '30735', '30736', '30738', '30740', '30745', '30746', '30749', '30750', '30752', '30753', '30755', '30756', '30759',
		'30760', '30761', '30762', '30763', '30765', '30767', '30768', '30769', '30771', '30777', '30778', '30787', '30790', '30794', '30801',
		'30877', '30894', '31008', '31020', '31039', '31055', '31100', '31102', '31150', '31293', '31313', '31762', '31772', '31773', '31774',
		'40191', '40915', '40925', '41152', '42543', '60329', '60634', '60995', '01632', '01889', '01889', '40066', '40067', '40085', '40103',
		'40114', '40124', '40132', '40135', '40162', '40192', '40203', '40205', '40246', '40255', '40256', '40258', '40280', '40287', '40296',
		'40305', '40310', '40319', '40343', '40365', '40366', '40398', '40409', '40409', '40427', '40430', '40431', '40446', '40448', '40481',
		'40551', '40580', '40603', '40608', '40615', '40621', '40623', '40684', '40696', '40714', '40720', '40740', '40741', '40754', '40772',
		'40774', '40783', '40785', '40799', '40834', '40848', '40854', '40859', '40881', '40900', '40901', '40902', '40907', '40920', '40922',
		'40941', '40942', '40965', '40972', '40973', '40974', '40985', '40988', '41005', '41035', '41055', '41058', '41065', '41081', '41090',
		'41090', '41091', '41112', '41114', '41141', '41154', '41165', '41176', '41186', '41197', '41209', '41216', '41235', '41237', '41244',
		'41245', '41250', '41251', '41280', '41281', '41299', '41309', '41336', '41358', '41377', '41378', '41381', '41414', '41438', '41439',
		'41482', '41486', '41497', '41516', '41518', '41531', '41542', '41546', '41549', '41563', '41572', '41575', '41578', '41604', '41610',
		'41614', '41617', '41620', '41624', '41630', '41633', '41661', '41722', '41732', '41736', '41739', '41743', '41748', '41749', '41770',
		'41784', '41789', '41792', '41800', '41828', '41839', '41861', '41884', '41897', '41904', '41905', '41913', '41916', '41926', '41930',
		'41931', '41933', '41936', '41937', '41939', '41941', '41952', '41955', '41956', '41957', '41959', '41960', '41961', '41963', '41965',
		'41966', '41967', '41968', '41969', '41970', '41971', '41974', '41975', '41976', '41977', '41978', '41979', '41980', '41981', '41982',
		'41983', '41984', '41985', '41986', '41987', '41988', '41989', '41990', '41991', '41992', '41994', '41995', '41996', '41997', '41998',
		'41999', '42000', '42001', '42002', '42003', '42004', '42005', '42006', '42007', '42009', '42010', '42011', '42012', '42013', '42014',
		'42015', '42016', '42017', '42019', '42020', '42021', '42022', '42023', '42024', '42025', '42026', '42028', '42030', '42031', '42032',
		'42033', '42034', '42035', '42036', '42037', '42039', '42041', '42042', '42043', '42044', '42045', '42046', '42047', '42049', '42050',
		'42051', '42052', '42053', '42054', '42055', '42056', '42057', '42058', '42059', '42060', '42061', '42062', '42063', '42064', '42065',
		'42066', '42224', '42230', '42238', '42247', '42281', '42286', '42299', '42312', '42381', '42417', '42422', '42429', '42434', '42488',
		'42514', '42526', '42533', '42534', '44451', '44454', '44466', '44474', '44485', '44489', '44495', '44496', '44498', '45007', '45080',
		'45087', '45100', '45137', '45165', '45173', '45179', '45182', '45182', '45201', '45204', '45214', '45215', '45286', '45341', '45349',
		'45427', '45440', '45451', '45457', '45470', '45482', '45525', '45553', '45598', '45714', '45718', '45725', '45758', '45774', '45789',
		'45797', '45844', '45871', '45890', '45968', '46015', '50189', '60448', '90487', '90976', '91058', '00953', '20085', '24992', '25171',
		'25451', '30999', '35030', '35101', '35108', '35253', '35306', '45099', '45245', '60004', '60006', '60013', '60018', '60020', '60025',
		'60030', '60038', '60052', '60072', '60099', '60120', '60127', '60135', '60148', '60150', '60162', '60164', '60166', '60168', '60169',
		'60174', '60179', '60180', '60185', '60186', '60200', '60230', '60234', '60241', '60261', '60273', '60282', '60392', '60409', '60417',
		'60424', '60426', '60429', '60431', '60432', '60435', '60443', '60447', '60450', '60451', '60455', '60459', '60462', '60474', '60489',
		'60521', '60531', '60535', '60597', '60620', '60624', '60674', '60707', '60710', '60732', '60740', '60742', '60784', '60786', '60789',
		'60854', '60906', '60923', '60937', '60971', '60983', '60986', '61007', '61025', '61046', '61050', '61065', '61076', '61089', '61137',
		'61152', '61157', '61183', '61209', '61225', '61234', '61238', '61242', '61246', '61271', '61273', '61274', '61276', '61298', '61331',
		'61342', '61345', '61362', '61378', '61431', '61451', '61468', '61475', '61482', '61489', '61509', '61524', '61532', '61540', '61545',
		'61553', '61588', '61614', '61635', '61637', '61660', '61675', '61680', '61690', '61695', '61700', '61703', '61706', '61707', '61716',
		'61718', '61719', '61720', '61722', '61723', '61727', '61728', '61729', '61731', '61736', '61739', '61743', '61747', '61750', '61754',
		'61758', '61771', '66022', '66026', '66031', '66042', '66046', '66075', '66092', '20214', '41632', '45888', '61588', '70446', '90002',
		'90003', '90005', '90011', '90012', '90014', '90020', '90022', '90029', '90033', '90035', '90036', '90041', '90043', '90050', '90051',
		'90072', '90073', '90139', '90145', '90150', '90174', '90214', '90244', '90249', '90260', '90262', '90263', '90283', '90288', '90295',
		'90353', '90384', '90407', '90420', '90425', '90443', '90456', '90465', '90493', '90501', '90505', '90518', '90528', '90565', '90570',
		'90577', '90579', '90594', '90599', '90617', '90644', '90670', '90679', '90706', '90712', '90719', '90720', '90733', '90746', '90750',
		'90758', '90785', '90795', '90798', '90812', '90813', '90814', '90827', '90829', '90831', '90863', '90865', '90877', '90918', '90946',
		'90949', '90957', '90963', '90964', '90968', '90969', '90982', '90984', '90987', '90988', '90990', '90994', '90996', '90997', '91003',
		'91017', '91018', '91019', '91023', '91024', '91025', '91026', '91027', '91029', '91030', '91037', '91049', '91054', '91058', '91059',
		'91066', '91069', '91073', '91076', '91087', '91088', '91092', '91098', '91099', '91100', '91107', '91110', '91112', '91115', '91123',
		'91129', '91139', '91141', '91142', '91143', '91144', '91147', '91151', '91157', '91166', '91263', '91839', '92781', '92915', '92980',
		'93201', '93204', '93206', '93209', '93211', '93213', '93215', '93216', '93219', '93220', '93222', '93223', '93224', '93232', '93234',
		'93235', '93236', '93237', '93240', '93248', '93250', '93251', '93253', '93254', '93255', '93258', '93259', '93263', '97674', '97677',
		'97691', '97699', '97701', '97706', '97707', '97781', '97803', '97804', '97805', '97823', '97827', '97838', '97839', '97880', '97887',
		'97894', '97901', '97904', '97917', '97924', '97928', '97930', '97931', '98546', '99008', '20159', '25080', '30575', '35078', '35208',
		'70001', '70003', '70004', '70005', '70007', '70008', '70009', '70010', '70013', '70014', '70016', '70017', '70018', '70019', '70021',
		'70024', '70025', '70027', '70028', '70030', '70032', '70034', '70035', '70037', '70040', '70043', '70044', '70045', '70046', '70047',
		'70048', '70049', '70050', '70053', '70054', '70056', '70060', '70064', '70065', '70067', '70068', '70071', '70073', '70074', '70076',
		'70077', '70078', '70082', '70083', '70084', '70086', '70097', '70104', '70106', '70110', '70117', '70123', '70128', '70132', '70133',
		'70134', '70142', '70156', '70158', '70164', '70165', '70179', '70186', '70189', '70190', '70193', '70194', '70195', '70199', '70200',
		'70202', '70206', '70207', '70208', '70209', '70214', '70216', '70217', '70218', '70224', '70229', '70230', '70231', '70244', '70249',
		'70252', '70253', '70257', '70264',	'70277', '70281', '70284', '70286',	'70294', '70298', '70302', '70305', '70308', '70315', '70316',
		'70320', '70322', '70323', '70324', '70325', '70327', '70328', '70329', '70330', '70331', '70335', '70336', '70337', '70338', '70339',
		'70340', '70341', '70342', '70344', '70345', '70348', '70353', '70354', '70355', '70356', '70357', '70358', '70361', '70362', '70363',
		'70364', '70365', '70366', '70367', '70368', '70369', '70371', '70372', '70373', '70374', '70375', '70376', '70378', '70381', '70382',
		'70384', '70386', '70387', '70388', '70389', '70390', '70392', '70394', '70396', '70397', '70398', '70399', '70400', '70401', '70403',
		'70404', '70405', '70406', '70407', '70408', '70410', '70411', '70413', '70414', '70415', '70416', '70417', '70418', '70419', '70420',
		'70424', '70426', '70428', '70429', '70430', '70431', '70432', '70434', '70435', '70437', '70438', '70439', '70440', '70441', '70442',
		'70444', '70446', '70447', '70448', '70449', '70450', '70451', '70452', '70453', '70454', '70455', '70456', '70457', '70458', '70459',
		'70461', '70462', '70463', '70464',	'70465', '70468', '70469', '70470', '70472', '70473', '70475', '70477', '77780', '77782', '90211',
		'90985', '01641', '20101', '20219', '25002', '25004', '25005', '25006', '25008', '25009', '25015', '25020', '25030', '25039', '25042',
		'25046', '25047', '25048', '25051', '25058', '25062', '25065', '25066', '25068', '25070', '25074', '25075', '25078', '25082', '25088',
		'25093', '25094', '25095', '25096', '25097', '25100', '25104', '25108', '25109', '25111', '25112', '25113', '25118', '25119', '25121',
		'25122', '25124', '25127', '25128', '25132', '25133', '25135', '25139', '25140', '25144', '25149', '25151', '25152', '25155', '25158',
		'25159', '25160', '25162', '25163', '25165', '25166', '25168', '25169', '25170', '25172', '25173', '25174', '25176', '25177', '25178',
		'25179', '25180', '25181', '25184', '25188', '25189', '25190', '25191', '25193', '25198', '25201', '25202', '25205', '25208', '25212',
		'25216', '25218', '25219', '25221', '25225', '25226', '25228', '25238', '25242', '25247', '25249', '25254', '25257', '25261', '25265',
		'25267', '25270', '25273', '25274', '25279', '25286', '25287', '25290', '25299', '25300', '25301', '25302', '25304', '25309', '25311',
		'25313', '25315', '25316', '25317', '25318', '25326', '25329', '25332', '25333', '25336', '25354', '25355', '25360', '25361', '25366',
		'25375', '25382', '25392', '25395', '25398', '25405', '25406', '25418', '25420', '25422', '25431', '25440', '25442', '25443', '25458',
		'25465', '25470', '25478', '25479', '25488', '25489', '25490', '25494', '25495', '25498', '25500', '25501', '25502', '25506', '25507',
		'25512', '25513', '25517', '25523', '25524', '25525', '25526', '25527', '25528', '25529', '25530', '25531', '25532', '25533', '25534',
		'25535', '25536', '25537', '25538', '25539', '25540', '25541', '25542', '25543', '25544', '25545', '25546', '25547', '25548', '25549',
		'25550', '25551', '25552', '25553', '25554', '25556', '25558', '25560', '25561', '25562', '25563', '25564', '25565', '25566', '25567',
		'25568', '25569', '25570', '25571', '25572', '25573', '25574', '25575', '25576', '25577', '25578', '25579', '25580', '25581', '25582',
		'25583', '25584', '25585', '25586', '25587', '25588', '25589', '25590', '25591', '25592', '25593', '25594', '25595', '25596', '25597',
		'25598', '25599', '25600', '25601', '25602', '25603', '25604', '25606', '25607', '25608', '25609', '25611', '25612', '25613', '25614',
		'25616', '25617', '25618', '25619', '25620', '25621', '25622', '25623', '25624', '25625', '25626', '25627', '25628', '25629', '25630',
		'25631', '25632', '25633', '25634', '25635', '25636', '25637', '25638', '25639', '25640', '25641', '25642', '25643', '25644', '25645',
		'25646', '25647', '25648', '25649', '25650', '25651', '25653', '25654', '25655', '25656', '25657', '25658', '25659', '25660', '25661',
		'25662', '25663', '25664', '25665', '25666', '25667', '25668', '25669', '25670', '25671', '25672', '25673', '25674', '25675', '25676',
		'25677', '25678', '25679', '25680', '25681', '25682', '25683', '25684', '25685', '25686', '25687', '25688', '25689', '25690', '25691',
		'25692', '25693', '25694', '25695', '25696', '25697', '25698', '25699', '25700', '25701', '25702', '25703', '25704', '25705', '25706',
		'25707', '25708', '51146', '51802', '52168', '52395', '60003', '60019', '60027', '60029', '60058', '60096', '60117', '60295', '60499',
		'60778', '60856', '60858', '60908', '60932', '61023', '61034', '61077', '61128', '61130', '61201', '61212', '61303', '65027', '90065',
		'20130', '20201', '20204', '35015', '35023', '35029', '35033', '35039', '35041', '35042', '35043', '35044', '35046', '35049', '35077',
		'35083', '35087', '35089', '35090', '35091', '35092', '35095', '35096', '35097', '35099', '35100', '35103', '35109', '35122', '35131',
		'35133', '35136', '35140', '35150', '35160', '35182', '35196', '35204', '35206', '35230', '35256', '35272', '35274', '35285', '35293',
		'35307', '35311', '35320', '35321', '35324', '35327', '35329', '35333', '35336', '35337', '35338', '35346', '35350', '35353', '35357', 
		'35362', '35367', '35375', '35380', '35381', '35382', '35383', '35385', '35390', '35394', '35397', '35414', '35416', '35424', '35425',
		'35429', '35433', '35441', '35447', '35451', '35452', '35456', '35461', '35471', '35477', '35478', '35491', '35492', '35493', '35497',
		'35499', '35507', '35511', '35518', '35526', '35528', '35554', '35568', '35579', '35580', '35588', '35608', '35612', '35614', '35661',
		'35674', '35685', '35686', '35715', '35747', '35751', '35758', '35761', '35765', '35773', '35784', '35788', '35830', '35833', '35840',
		'35850', '35853', '35854', '35862', '35864', '35865', '35866', '35870', '35875', '35882', '35885', '35888', '35889', '35890', '35891',
		'35895', '35897', '35900', '35901', '35903', '35908', '35915', '35919', '35922', '35923', '35926', '35927', '35928', '35931', '35933',
		'41107', '41362', '60012', '60028', '60032', '60085', '60111', '60112', '60188', '60190', '60332', '60439', '60442', '60519', '61083',
		'61174', '61181', '61191', '61219', '61784', '70030', '70086', '70091', '70109', '70144', '70227', '70321', '70324', '70334', '70668',
		'71189', '71248', '90071', '90301', '90309', '90563', '90710', '90710', '93046', '97670', '41725', '60329', '60813', '61291', '80001',
		'80006', '80027', '80037', '80040', '80048', '80051', '80054', '80056', '80071', '80081', '80089', '80099', '80105', '80108', '80116',
		'80119', '80133', '80135', '80143', '80146', '80148', '80150', '80156', '80161', '80162', '80165', '80166', '80174', '80175', '80180',
		'80181', '80182', '80183', '80193', '80203', '80206', '80208', '80215', '80219', '80221', '80223', '80229', '80233', '80235', '80236', 
		'80238', '80246', '80249', '80259', '80269', '80270', '80277', '80283', '80285', '80287', '80288', '80289', '80299', '80303', '80304',
		'80306', '80309', '80319', '80323', '80328', '80344', '80349', '80350', '80357', '80362', '80363', '80364', '80367', '80374', '80398',
		'80409', '80411', '80413', '80415', '80424', '80436', '80437', '80438', '80447', '80457', '80458', '80465', '80473', '80497', '80499',
		'80507', '80508', '80510', '80527', '80548', '80554', '80557', '80558', '80559', '80563', '80568', '80569', '80575', '80578', '80585',
		'80595', '80596', '80601', '80615', '80618', '80619', '80620', '80625', '80630', '80631', '80636', '80639', '80640', '80641', '80644',
		'80645', '80647', '80651', '80652', '80656', '80659', '80661', '80666', '80670', '80672', '80673', '80683', '80684', '80697', '80703',
		'80704', '80705', '80708', '80711', '80720', '80721', '80723', '80724', '80729', '80731', '80735', '80737', '80739', '80740', '80741',
		'80743', '80744', '80746', '80748', '80749', '80752', '80753', '80757', '80759', '80761', '80762', '80803', '80809', '80825', '80854',
		'80903', '81018', '81024', '81031', '81041', '81042', '81049', '81050', '81051', '81078', '81129', '81190', '81191', '81208', '81215',
		'81221', '81223', '81255', '81268', '81273', '81276', '81280', '81282', '81288', '81301', '81341', '81342', '81353', '81360', '81372',
		'81373', '81374', '81380', '81388', '81390', '81403', '81404', '81406', '81410', '81413', '81503', '82250', '82507', '82510', '82512',
		'82514', '82516', '88897', '88898', '90667', '00090', '00146', '00150', '00477', '01469', '41729', '50009', '50011', '50015', '50023',
		'50024', '50051', '50056', '50076', '50080', '50147', '50164', '50174', '50211', '50221', '50227', '50230', '50250', '50293', '50389',
		'50412', '50436', '50438', '50443', '50451', '50455', '50514', '50634', '50690', '50703', '50743', '50747', '50841', '50843', '50864',
		'50880', '50922', '50941', '50942', '50956', '50967', '50975', '50998', '51001', '51100', '51150', '51157', '51160', '51185', '51195',
		'51206', '51237', '51245', '51268', '51285', '51302', '51358', '51416', '51431', '51440', '51452', '51739', '51800', '51815', '51898',
		'52139', '52152', '52160', '52164', '52184', '52195', '52205', '52211', '52222', '52237', '52355', '52381', '52392', '52394', '52397',
		'52432', '52435', '52464', '52489', '52494', '52527', '52644', '52659', '52680', '52742', '52783', '53079', '53090', '53101', '53102',
		'53139', '53190', '53206', '53296', '53532', '53551', '53657', '53863', '53976', '53999', '54021', '54027', '54070', '54074', '54077',
		'54079', '54082', '60745', '61625',	'65014', '65034', '90064', '91132' 
	) 

	DECLARE @TMPTABLE_CLIENTESSIGLA TABLE  (	
	    categoria nvarchar (10) NOT NULL,
		codigoCliente VARCHAR(10) NOT NULL,
		sigla VARCHAR(10) NOT NULL,
		familiaEstadistica VARCHAR(25) NOT NULL
	)

	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0002','20001','00102','OEMNACIONAL')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0002','20002','00104','OEMNACIONAL')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0002','20003','00107','OEMNACIONAL')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0003','30001','07024','OEMEXTERIOR')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0003','30002','07046','OEMEXTERIOR')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0003','30003','07051','OEMEXTERIOR')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0004','40001','07002','OEMDISTEXT')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0004','40002','07010','OEMDISTEXT')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0004','40003','07015','OEMDISTEXT')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0004','40004','07032','OEMDISTEXT')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0010','100001','00009','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0010','100002','00010','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0010','100003','00011','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0011','110001','01592','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0011','110002','01593','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0011','110003','01616','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0012','120001','01632','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0012','120002','01889','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0012','120003','01889','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0013','130001','00953','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0013','130002','20085','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0013','130003','24992','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0014','140001','20214','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0014','140002','41632','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0014','140003','45888','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0015','150001','20159','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0015','150002','25080','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0015','150003','30575','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0016','160001','01641','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0016','160002','20101','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0016','160003','20219','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0017','170001','20130','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0017','170002','20201','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0017','170003','20204','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0018','180001','41725','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0018','180002','60329','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0018','180003','60813','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0019','190001','00090','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0019','190002','00146','MRARGENTINA')
	INSERT INTO @TMPTABLE_CLIENTESSIGLA VALUES ('C0019','190003','00150','MRARGENTINA')
	

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
		FROM @TMPTABLE_CLIENTESSIGLA		

	OPEN CLIENTESSIGLA
		FETCH CLIENTESSIGLA INTO  @categoria,@codigoCliente, @sigla, @familiaEstadististica

		WHILE(@@FETCH_STATUS=0)
		BEGIN

			INSERT INTO ##TMPDATA
			SELECT distinct 
				clienteTmp.Indicador, clientesSiglas.categoria, clientesSiglas.codigoCliente, clienteTmp.BPRNAM, clienteTmp.BPRSHO, clienteTmp.BPRLOG, 
				clienteTmp.CRY, clienteTmp.LAN,	clienteTmp.CRN,  clienteTmp.CUR,  clienteTmp.ABCCLS, clienteTmp.DME, clienteTmp.FREINV,  
				clienteTmp.IME, clienteTmp.INVPER,  clienteTmp.COMCAT,  clienteTmp.[REP(0)], clienteTmp.[REP(1)], clienteTmp.[BPCTYP], 
				clienteTmp.[OSTCTL], clienteTmp.[OSTAUZ], clienteTmp.[TSCCOD(0)], clienteTmp.[TSCCOD(1)], clienteTmp.[TSCCOD(2)], 
				clienteTmp.[BPCINV], clienteTmp.[BPAINV], clienteTmp.[BPCPYR], clienteTmp.[BPAPYR], clienteTmp.[BPCRSK], clienteTmp.[BPDADD], 
				clienteTmp.[BPAADD],  clienteTmp.[ACCCOD], clienteTmp.[VACBPR], clienteTmp.[PTE], clienteTmp.[XX12NIF], clienteTmp.[XX12DOCTYP], 
				clienteTmp.[XXX12DOCTYP], clienteTmp.[XX12DOCNUM], clienteTmp.[XX12REGIIBB], clienteTmp.[XX12IIBB], clienteTmp.[XX12SITGAN], 
				clienteTmp.[XX12MTBBPR], clienteTmp.[XX12PERFLG], clienteTmp.[XX12BPRINT], clienteTmp.[*71], clienteTmp.[*72], clienteTmp.[*81], 
				clienteTmp.[*82]
				FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
				WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 


				
			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADOR2, clienteTmp.[BPAADD2], clienteTmp.[BPADES], clienteTmp.[BPAADDLIG(0)], clienteTmp.[BPAADDLIG(1)], 
				clienteTmp.[BPAADDLIG(2)], clienteTmp.[POSCOD], clienteTmp.[CTY], clienteTmp.[CRY2], clienteTmp.[BPAADDFLG], clienteTmp.[TEL(0)],	
				clienteTmp.[TEL(1)], clienteTmp.[TEL(2)], clienteTmp.[FCYWEB], clienteTmp.[WEB(0)], clienteTmp.[WEB(1)], clienteTmp.[WEB(2)],
				clienteTmp.[FAX], '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',  
				'', '', '', '', '', ''
			FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 


			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADOR_D, clienteTmp.[BPAADD3], clienteTmp.[BPDNAM(0)], clienteTmp.[VACBPR3], clienteTmp.[REP(0)3], clienteTmp.[REP(1)3],
				clienteTmp.[STOFCY], clienteTmp.[DRN], clienteTmp.[DLVPIO], clienteTmp.[MDL], clienteTmp.[BPTNUM], clienteTmp.[DAYLTI], 
				clienteTmp.[*713], clienteTmp.[*723], clienteTmp.[*813], clienteTmp.[*823], '', '',  '', '',  '', '', '',  '' , '' , '' , '',
				'', '',  '',  '',  '',  '', '',  '',  '',  '',  '', '',  '',  '',  '',  '',  '',  '',  '', '',  '' 
			FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 
			
			
			INSERT INTO ##TMPDATA
			SELECT DISTINCT 
				clienteTmp.INDICADORC, clienteTmp.[CCNCRM], clienteTmp.[CNTTTL], clienteTmp.CNTFNA, clienteTmp.CNTLNA, 
				clienteTmp.TEL, clienteTmp.CNTFNC, clienteTmp.[*1], clienteTmp.[WEB], clienteTmp.[MOB],
				'', '', '', '', '', '', '', '', '', '', '', '', '', '', '' , '', '', '', '', '', '', '', '', '', '', '', '',  
				'', '', '', '', '', '', '', '', '', '', '' 
			FROM @TMPTABLE_CLIENTES clienteTmp, @TMPTABLE_CLIENTESSIGLA clientesSiglas
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 
			
			INSERT INTO ##TMPDATA
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
			WHERE clienteTmp.[BPCNUM] = clientesSiglas.sigla and clientesSiglas.codigoCliente = @codigoCliente 

			FETCH CLIENTESSIGLA INTO @categoria, @codigoCliente, @sigla, @familiaEstadististica
	
		END
	
	CLOSE CLIENTESSIGLA

	DEALLOCATE CLIENTESSIGLA


SELECT tmpData.*
FROM ##TMPDATA tmpData
