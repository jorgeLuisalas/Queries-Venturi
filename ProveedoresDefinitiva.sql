use Venturi
go


if OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR')IS NOT NULL
DROP TABLE ##TMPTABLE_PROVEEDOR


create table  ##TMPTABLE_PROVEEDOR
(  
  INDICADOR_B varchar (2)not null,
  [BSGCOD]    nvarchar (2)  null,
  [BPSNUM]    nvarchar(max)null,
  [ENAFLG]    int null,
  [BPRNAM]    nvarchar (40)null,
  [BPRSHO]    nvarchar (40)null,
  [CRY]       nvarchar(max)null,
  [LAN]     nvarchar(3)null,
  [CRN]     nvarchar(13)null,
  [CUR]     nvarchar (3)null,
  [ABCCLS]  varchar (2)null, 
  [PLISTC]  nvarchar (max)null,
  [BPTNUM]  nvarchar (max)null,
  [MDL]     varchar (2)null,
  [EECICT]  nvarchar (max)null,
  [BPSTYP]  INT   null,
  [MATTOL]  nvarchar (max)null,
  [OSTCTL]  INT null,
  [OSTAUZAMT] nvarchar (max)null,
  [PAYLOKFLG] int null,
  [DOUFLG]    int null,
  [TSSCOD(0)] nvarchar (max)null,
  [TSSCOD(1)] nvarchar (max)null,
  [TSSCOD(2)] nvarchar (max)null,
  [TSSCOD(3)] nvarchar (max)null,
  [ACCCOD]    nvarchar (max)null,
  [PTE]       nvarchar (40)null,
  [VACBPR]    nvarchar(max) null, 
  [XX12CHQNAM]  nvarchar (max)null,
  [XX12CHQORD]  nvarchar (max)null,
  [XX12BPSCBU]  nvarchar (max)null,
  [XX12NIF]     nvarchar (13)null,
  [XX12PERFLG]  nvarchar (max)null,
  [XX12SITGAN]  nvarchar(max) null,
  [XX12REGIIBB] nvarchar(max) null,
  [XX12IIBB]    nvarchar (13)null,
  [XX12DOCTYP]  int null,
  [XX12DOCNUM]  nvarchar (13)null,
  [XX12MTBBPR]  nvarchar (max)null,
  [XX12BPSEMB]  nvarchar (max)null, 
  [XX12BPRINT]  int null,
  [XX12CTRFIS]  nvarchar (max)null,
  [XX12SITIBCAB] nvarchar (max)null,
  [XX12ALLRET]   varchar (2)null,
  [*71]          nvarchar (max)null,
  [*72]          nvarchar (max)null, 
  [*81]          nvarchar (max)null,
  [*82]          nvarchar (max)null,


  INDICADOR_A    varchar (2)not null,
  [BPAADD]       nvarchar (3)null,
  [BPADES]       nvarchar (max)null,
  [BPAADDLIG(0)] nvarchar (30)null,
  [BPAADDLIG(1)] nvarchar (30)null,
  [POSCOD]       nvarchar (max) null,
  [CRY2]         nvarchar(max)null,
  [BPAADDFLG]    int null,
  [TEL(0)]       nvarchar (30)null,
  [TEL(1)]       nvarchar (30)null,
  [FAX]          nvarchar (max)null,
  [FCYWEB]       nvarchar (max)null,
  [WEB(0)]       nvarchar (40)null,
  [WEB(1)]       nvarchar (max)null,


  INDICADOR_C    varchar (2)not null,
  [CCNCRM]       nvarchar (max)null,
  [CNTTTL]       nvarchar (max)null,
  [CNTFNA]       nvarchar (max)null,
  [CNTLNA]       nvarchar (max)null,
  [TEL]          nvarchar (max)null,
  [WEB]          nvarchar (max)null,
  [CNTFNC]       nvarchar (max)null,
  [CNTMSS]       nvarchar (max)null,


  INDICADOR_O    varchar (2)not null,
  [ODFCOD]       nvarchar (max)null,
  [ODFVAL]       nvarchar (max)null,


  INDICADOR_P    varchar (2)not null,
  [SAT]          nvarchar (max)null, 
  [DATDEB]       nvarchar (max)null,
  [DATFIN]       nvarchar (max)null,
  [XX12CRET]     nvarchar (3)null
 )


 insert into ##TMPTABLE_PROVEEDOR
SELECT  
	'B' AS 'INDICADOR_B',
	P.TIP_CODIGO AS [BSGCOD],											--Categoría
	P.PR_CODIGO AS [BPSNUM]	,										--Proveedor
	
	CASE P.[ESP_CODIGO]
		WHEN '01' THEN 2
		WHEN '02' THEN 1
		ELSE 2
	END AS [ENAFLG]	,												  --Activo  1) No  2) Si

	UPPER(LEFT(P.[PR_NOMBRE], 35))  AS [BPRNAM],						--Razón Social

	LEFT (PR_NOMBRE,10) AS [BPRSHO],														--Descrip. corta, abreviación de la razón social, se puede dejar en blanco

	
	(SELECT CASE UPPER(PR.PO_DESCRI)
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
				WHEN 'TF' THEN 'TF - A DEFINIR ¿TIERRA DEL FUEGO?'
			
				ELSE 'A DEFINIR'					
			END) 
	   AS [CRY],   														--País  AR-Argentina, BR-Brasil, US-Estados Unidos.

	'' AS [LAN],														--Idioma del proveedor SPA-Español, ENG-Inglés
			

	REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','') AS [CRN],		    --N.I.F.  En Argentina es el número de CUIT

	   
	'ARS' AS [CUR],														--Divisa ARS Peso Argentino, USD Dólar
	'D' AS [ABCCLS],														--Categoría ABC  1) Clase A.  2) Clase B.  3)Clase C.  4)Clase D
	'' AS [PLISTC],														--Estructura tarifa
	'' AS [BPTNUM],														--Transportista
	'' AS [MDL],														--Modo de entrega
	'' AS [EECICT],														--Incoterm
	'1' AS [BPSTYP],											        --Tipo proveedor  1) Normal  2) Prospecto  3) Varios
	'' AS [MATTOL],														--Regla conciliación
	'2' AS [OSTCTL]	,										            --Control encurso    1) Controlado  2) Libre  3) Bloqueado
	'' AS [OSTAUZAMT],													--Encurso autorizado
	'1' AS [PAYLOKFLG],											        --Bloqueo pago. 1) No  2) Si
	'1' AS [DOUFLG],											        --Litigio.  1) No 2) Aviso  3) Bloqueante
	'' AS [TSSCOD(0)],													--Familia estadística DEFINIR
	'' AS [TSSCOD(1)],													--Familia estadística DEFINIR
	'' AS [TSSCOD(2)],													--Familia estadística DEFINIR
	'' AS [TSSCOD(3)],													--Familia estadística DEFINIR
	--LEFT('AR_FOR_NAC', 10)
	'A DEFINIR' AS [ACCCOD],											--Código contable
	   
	 (CASE condCompra.CCM_DESCRI
		WHEN '' THEN 'A DEFINIR'
		ELSE condCompra.CCM_DESCRI
	  END) AS [PTE],													--Condición pago
	  	   									

	--LEFT('ARS', 5)  AS [VACBPR],										--Reg.impuesto	
	CASE P.PR_IVA 
			WHEN 1 THEN 'CF'
			WHEN 2 THEN 'RI'
			WHEN 3 THEN 'RNI'
			WHEN 4 THEN 'EXE'
			WHEN 5 THEN ''
			WHEN 6 THEN ''
			WHEN 7 THEN ''
			WHEN 8 THEN 'RM'  --En Zeus 'Responsable Monotributo' - En SAGE 'Regimen Monotributista'
			WHEN 9 THEN 'RNC' --En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
			ELSE 'A DEFINIR'
	   END AS [VACBPR],												
	   	 
	'' AS [XX12CHQNAM],													--Cheque a la orden de (Razón social del beneficiario)
	'' AS [XX12CHQORD],													--Cheque no a la Orden. Si se utiliza cheques no a la orden, Opción 1) NO 2) SI
	'' AS [XX12BPSCBU],													--CBU de la cuenta bancaria asociada al proveedor	

	REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','')  AS [XX12NIF],		    --Número de CUIT/CUIL del cliente sin guiones

	'' AS [XX12PERFLG],													--Agente de Per. IVA


	(	CASE P.PR_POSGAN
			WHEN 1 THEN 'RI'
			WHEN 2 THEN 'RNI'
			WHEN 3 THEN 'EXE'
		END
	) AS [XX12SITGAN],													--Situación Ganancias
																		/*
																			CF: Consumidor final
																			EXC: Cliente del exterior
																			EXE: Exento
																			EXP: Proveedores del exterior
																			INR: Inscripto no responsable
																			RI: Régimen inscripto
																			RM: Régimen monotributista
																			RNC: Responsable no categorizado			
																			RNI: Responsable no inscripto
																		*/

	(CASE p.PR_CATIBR
		WHEN 0 THEN ''
		WHEN 1 THEN '2'
		WHEN 2 THEN '1'
	 END)  AS [XX12REGIIBB],											--Régimen IIBB   
																		/*
																			1) Convenio Multilateral (2 en Zeus) , 
																			2) Local (1 en Zeus ,  
																			3) Todas
																		*/																	

	
	REPLACE(REPLACE(P.PR_IBR, '-', ''), '.','') AS [XX12IIBB],			--Num Ingresos Brutos
		
	'80' AS [XX12DOCTYP],												--Tipo Documento. Código del documento identificatorio. CUIT: 80, CUIL:  86. DNI: 96
	REPLACE(REPLACE(P.PR_CUIT, '-', ''), '.','') AS [XX12DOCNUM],		--Número de Documento Ver guiones espacios
	
	   
	'' AS [XX12MTBBPR],													--Monotributo
																		/*
																			CF: Consumidor final
																			EXC: Cliente del exterior
																			EXE: Exento
																			EXP: Proveedores del exterior
																			INR: Inscripto no responsable
																			RI: Regimen inscripto
																			RM: Régimen monotributista
																			RNC: Responsable no categorizado
																			RNI: Responsable no inscripto
																		*/
	'' AS [XX12BPSEMB],													--Embargado, Se completara automaticamente con la importación de padrones. Dejar vacío.
	'1' AS [XX12BPRINT],													--Tercero Interno:  1) No -  2) Si
	'' AS [XX12CTRFIS],													--CAE no obligatorio.  1) No  - 2) Si
	'' AS [XX12SITIBCAB],											--Situación IB CABA. 1) Alto Riesgo 2) Reg. Simplificado 3) Reg. General
	'2' AS [XX12ALLRET],			 									--Todas las Retenciones. 1) No - 2) Si
	'' AS [*71],														--Texto pedido
	'' AS [*72],														--Texto pedido
	'' AS [*81],														--Texto devolución
	'' AS [*82],													--Texto devolución
	'A' AS 'INDICADOR_A',														--
	'PRI' AS [BPAADD],														    --Dirección
	'PRINCIPAL' AS [BPADES]	,													--Descripción max 30
	UPPER(LEFT(P.[PR_DIRECC], 50)) AS [BPAADDLIG(0)],				--Línea dirección
	UPPER(SUBSTRING(P.[PR_DIRECC], 51, 50)) AS [BPAADDLIG(1)],			--Línea dirección

	 LEFT(P.PR_CODPOS, 10) 
			
		
	
	AS [POSCOD	],											--Código Postal
		
	(SELECT CASE UPPER(PR.PO_DESCRI)
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
				WHEN 'TF' THEN 'TF - A DEFINIR ¿TIERRA DEL FUEGO?'
			
				ELSE 'A DEFINIR'					
			END) 
	   AS [CRY2],   														--País

	2 AS [BPAADDFLG],													--Por defecto



	/*Se ha generado la query para enviar a la gente de Venturi y decidan sobre los telefonos proveedores */

	LEFT(P.[PR_TELEF1], 20) AS [TEL(0)], 								--Teléfono
	LEFT(P.[PR_TELEF2], 20) AS [TEL(1)],    							--Teléfono 
	
	/******************************************************************************************************/


	'' AS [FAX],														--Fax
	'' AS [FCYWEB],							    				    --Sitio Web
	UPPER(LEFT(P.[PR_EMAIL], 80)) AS [WEB(0)],							--Dirección Internet
	'' AS [WEB(1)],													    --Dirección Internet
	'C' AS 'INDICADOR_C',															--
	'' AS [CCNCRM],														--Código contrato
	'' AS [CNTTTL],														--Trato   1-Señor, 2-Señora, 3-Señorita
    '' AS [CNTFNA],														--Nombre

	/****Se ha generado la query para enviar a la gente de Venturi y decidan sobre contactos PR_CONTAC*****/

	'' AS [CNTLNA],													--Apellidos

	/******************************************************************************************************/

	'' AS [TEL],														--Teléfono
	'' AS [WEB],														--E-mail
	'' AS [CNTFNC],														--Función 1)P.D.G. 2)Director Comercial 3) Director Técnico 4)Responsable de compras 5)Comprador
																		--6)Responsable de stocks 7)Director Financiero y jurídico 8)Responsable import/export
																		--9)Director de planta 10)Operador externo 11)Varios 12)Interlocutor Reach	
	'' AS [CNTMSS],														--Rol
	'O' AS 'INDICADOR_O',														--
	'' AS [ODFCOD],														--Otros Datos Locales
	'' AS [ODFVAL],														--Valor
	

	'P' AS 'INDICADOR_P',															
	'' AS [SAT],	            										--Provincia
	'' AS [DATDEB],														--Fecha desde
	'' AS [DATFIN],														--Fecha hasta
	--'R' AS 'R',														--Indicador R, en este caso no va
	'GEN' AS [XX12CRET]								--Control
	
	
FROM [VenturiFabrica].[dbo].[PROVEEDORES] P	
LEFT JOIN [VenturiFabrica].[dbo].[PROVINCIA] PR
ON PR.[PO_CODIGO] = P.[PO_CODIGO]
LEFT JOIN Venturi.dbo.COND_COMPRA condCompra
ON P.CCM_CODIGO = condCompra.CCM_CODIGO
ORDER BY P.[PO_CODIGO]





IF OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR_DATOS') IS NOT NULL
    DROP TABLE ##TMPTABLE_PROVEEDOR_DATOS  


CREATE TABLE ##TMPTABLE_PROVEEDOR_DATOS  (	
	codigoProveedor NVARCHAR(MAX) NOT NULL,
	sigla NVARCHAR(MAX) NOT NULL,
	familiaEstadistica NVARCHAR(MAX) NOT NULL,
	familiaEstadistica1 NVARCHAR(MAX) NOT NULL,
	familiaEstadistica2 NVARCHAR(MAX) NOT NULL,
	familiaEstadistica3 NVARCHAR(MAX) NOT NULL
)


insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES        ('PBA-0002','0B145','NAC',	'SER',	'BANCO',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES        ('PBA-0007','0H059','NAC',	'SER',	'BANCO',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES        ('E00001',	'0A259','EXT',	 'VH',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES        ('E00002',	'0A264','EXT',	 'VH',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES        ('E00003',	'0A433','EXT',	 'VH',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00004',	'0A220','EXT',	 'EXPRO',	'EXALU',	'EXPEA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00005',	'0A242','EXT',	 'EXPRO',	'EXVPR',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00008',	'0A267','EXT',	 'COMPL',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00011',	'0A284','EXT',	 'EXPRO',	'EXALU',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00014',	'0A321','EXT',	 'EXPRO',	'EXDC',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('E00026',	'0A377','EXT',	 'COMPL',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('E00029',	'0A381','EXT',	 'EXPRO',	'EXDC',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('PGA-0001','0A021','NAC',	 'SER',	'SEGUR',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('PGA-0002','0A040','NAC',	 'SER',	'PROTE',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES		 ('PGA-0008','0','NAC','SER','ENERG',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PGA-0016','0T005','NAC',	 'SER',	'TELFF',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00024',	'0C165','NAC',	 'PRO',	'VPROD',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00025',	'0C185','NAC',	 'PRO',	'TRATM',	'TRATS')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00026',	'0C266','NAC',	 'PRO',	'FUND',	'FUNOD')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00028',	'0D043','NAC',	 'PRO',	'TRATM',	'TRATT')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00036',	'0F072','NAC',	 'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00037',	'0F105','NAC',	 'PRO',	'FILTR',	'DISTF')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00038',	'0F112','NAC',	 'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00039',	'0F116','NAC',	 'PRO',	'FUND',	'FUGRI')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('N00055',	'0J025','NAC',	 'PRO',	'FUNDA',	'GRAVE')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0001','0A001',	'NAC',	'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0004','0A019',	'NAC',	'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0005','0A024',	'NAC',	'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0014','0A121',	'NAC',	'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0030','0A423',	'EXT',	'EXAUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0031','0A438',	'EXT',	'EXAUX',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0032','0A442',	'EXT',	'EXAUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0057','0B176','NAC',	'SER',	'CONSU',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0058','0C005','NAC',	'AUX',	'SEGDD',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0067','0C053','NAC',	'SER',	'COMEX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0119','0','NAC',	    'AUX',	'VAUX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0212','0M236',	    'NAC',	'AUX',	'PQUIM',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0247',	'0P075',	'NAC',	'SER',	'SMEDIC',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0253',	'0Q005',	'NAC',	'AUX',	'LUBRI',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0254',	'0R011',	'NAC',	'AUX',	'ELCTD',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0332',	'0V052',	'NAC',	'DIR',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0333',	'0V053',	'NAC',	'DIR',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0338',	'0V065',	'NAC',	'AUX',	'COMPU',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PVA-0347',	'0Z002',	'NAC',	'SER',	'COMEX',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PSU-0001',	'187',	'NAC',	'SUCU',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PSU-0017',	'136',	'NAC',	'SUCU',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PSU-0043',	'211',	'NAC',	'SUCU',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PSU-0044',	'195',	'NAC',	'SUCU',	'ZNA',	'ZNA')
insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES	     ('PSU-0045',	'144',	'NAC',	'SUCU',	'ZNA',	'ZNA')





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


DECLARE @codigoProveedor NVARCHAR(MAX)
DECLARE @sigla NVARCHAR(MAX) 
DECLARE @familiaEstadistica NVARCHAR(MAX)
DECLARE @familiaEstadistica1 NVARCHAR(MAX)
DECLARE @familiaEstadistica2 NVARCHAR(MAX)
DECLARE @familiaEstadistica3 NVARCHAR(MAX)

SET @codigoProveedor = ''
SET @sigla = ''
SET @familiaEstadistica = ''
SET @familiaEstadistica1 = ''
SET @familiaEstadistica2 = ''
SET @familiaEstadistica3 = ''


DECLARE PROVEEDOR_DATOS CURSOR 
	FOR
	SELECT *
	FROM ##TMPTABLE_PROVEEDOR_DATOS 

	OPEN PROVEEDOR_DATOS
	FETCH PROVEEDOR_DATOS INTO @codigoProveedor, @sigla, @familiaEstadistica,@familiaEstadistica1,@familiaEstadistica2,@familiaEstadistica3

	WHILE(@@FETCH_STATUS=0)
	BEGIN

		INSERT INTO ##TMPDATA
		SELECT distinct 
			TP.INDICADOR_B,    --1
			TP.BSGCOD,         --2
			TP.BPSNUM,         --3
			TP.ENAFLG    ,     --4
			TP.BPRNAM    ,     --5
			TP.BPRSHO     ,    --6
			TP.CRY      ,      --7
			TP.LAN     ,       --8
			TP.CRN     ,       --9
			TP.CUR     ,       --10
			TP.ABCCLS  ,       --11
			TP.PLISTC  ,       --12
			TP.BPTNUM  ,       --13
			TP.MDL     ,       --14
			TP.EECICT  ,       --15
			TP.BPSTYP  ,       --16
			TP.MATTOL  ,       --17
			TP.OSTCTL  ,       --18
			TP.OSTAUZAMT ,     --19
			TP.PAYLOKFLG ,     --20
			TP.DOUFLG    ,     --21
			TP.[TSSCOD(0)],    --22
			TP.[TSSCOD(1)],    --23
			TP.[TSSCOD(2)],    --24
			TP.[TSSCOD(3)],    --25
			TP.ACCCOD    ,     --26
			TP.PTE       ,     --27
			TP.VACBPR    ,     --28
			TP.XX12CHQNAM  ,   --29
			TP.XX12CHQORD  ,   --30
			TP.XX12BPSCBU  ,   --31
			TP.XX12NIF     ,   --32
			TP.XX12PERFLG  ,   --33
			TP.XX12SITGAN  ,   --34
			TP.XX12REGIIBB ,   --35
			TP.XX12IIBB    ,   --36
			TP.XX12DOCTYP  ,   --37
			TP.XX12DOCNUM  ,   --38
			TP.XX12MTBBPR  ,   --39
			TP.XX12BPSEMB  ,   --40
			TP.XX12BPRINT  ,   --41
			TP.XX12CTRFIS  ,   --42
			TP.XX12SITIBCAB ,  --43
			TP.XX12ALLRET   ,  --44
			TP.[*71]        ,  --45
			TP.[*72]        ,  --46
			TP.[*81]        ,  --47
			TP.[*82]           --48
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor

INSERT INTO ##TMPDATA
SELECT DISTINCT 
	TP.INDICADOR_A    , --1
	TP.[BPAADD]       , --2
	TP.[BPADES]       , --3
	TP.[BPAADDLIG(0)],  --4
	TP.[BPAADDLIG(1)],  --5
	TP.[POSCOD]       , --6
	TP.[CRY2]         , --7
	TP.[BPAADDFLG]    , --8
	TP.[TEL(0)]  ,      --9
	TP.[TEL(1)]  ,		--10
	TP.[BPTNUM],		--11
	TP.[FAX]          , --12
	TP.[FCYWEB]       , --13
	TP.[WEB(0)],		--14
	TP.[WEB(1)],		--15
	'',					--16
	'',					--17
	'',					--18
	'',					--19
	'',					--20
	'',					--21
	'',					--22
	'',  --23
	'' , --24
	'' , --25
	'' , --26
	'',  --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'',  --33
 	'',  --34
	'',  --35
	'',  --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	'',  --46
	'',   --47
	''   --48
FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor


INSERT INTO ##TMPDATA
SELECT DISTINCT 
	TP.INDICADOR_C , --1
	TP.[CCNCRM] , --2
	TP.[CNTTTL] , --3
	TP.[CNTFNA] , --4
	TP.[CNTLNA] , --5
	TP.[TEL]    , --6
	TP.[WEB]    , --7
	TP.[CNTFNC] , --8
	TP.[CNTMSS] , --9
	'',		      --10
	'',		      --11
	'',           --12
	'',           --13
	'',		      --14
	'',		      --15
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
	'',  --46
	'',   --47
	''   --48
FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor




INSERT INTO ##TMPDATA
SELECT DISTINCT 
	TP.INDICADOR_O , --1
	TP.[ODFCOD] ,    --2
	TP.[ODFVAL] ,    --3
	'',              --4
	'',              --5
	'',              --6
	'',              --7
	'',              --8
	'',              --9
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
	'',  --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'',  --33
 	'',  --34
	'',  --35
	'',  --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	'',  --46
	'',   --47
	''   --48
FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor



INSERT INTO ##TMPDATA
SELECT DISTINCT 
	TP.INDICADOR_P , --1
	TP.[SAT] ,       --2
	TP.[DATDEB] ,    --3
	TP.[DATFIN],     --4
    TP.[XX12CRET],   --5
	'',              --6
	'',              --7
	'',              --8
	'',              --9
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
	'',  --27
	'',  --28
	'',  --29
	'',  --30
	'',  --31
	'',  --32
	'',  --33
 	'',  --34
	'',  --35
	'',  --36
	'',  --37
	'',  --38
	'',  --39
	'',  --40
	'',  --41
	'',  --42
	'',  --43
	'',  --44
	'',  --45
	'',  --46
	'',   --47
	''   --48
FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor

FETCH PROVEEDOR_DATOS INTO @codigoProveedor, @sigla, @familiaEstadistica, @familiaEstadistica1, @familiaEstadistica2, @familiaEstadistica3

END

CLOSE PROVEEDOR_DATOS

DEALLOCATE PROVEEDOR_DATOS



SELECT tmpData.*
FROM ##TMPDATA tmpData
