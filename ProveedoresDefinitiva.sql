use Venturi
go


if OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR')IS NOT NULL
DROP TABLE ##TMPTABLE_PROVEEDOR


create table  ##TMPTABLE_PROVEEDOR
(  
			  INDICADOR_B    VARCHAR (2)not null,
			  [BSGCOD]       NVARCHAR(2)  null,
			  [BPSNUM]       NVARCHAR(max)null,
			  [ENAFLG]       INT NULL,
			  [BPRNAM]       NVARCHAR( 40)null,
			  [BPRSHO]       NVARCHAR (40)null,
			  [CRY]          NVARCHAR(max)null,
			  [LAN]          NVARCHAR  (3)null,
			  [CRN]          NVARCHAR (13)null,
			  [CUR]          NVARCHAR  (3)null,
			  [ABCCLS]       VARCHAR   (2)null, 
			  [PLISTC]       NVARCHAR (max)null,
			  [BPTNUM]       NVARCHAR (max)null,
			  [MDL]          VARCHAR  (2)null,
			  [EECICT]       NVARCHAR (max)null,
			  [BPSTYP]       INT null,
			  [MATTOL]       NVARCHAR (max)null,
			  [OSTCTL]       INT null,
			  [OSTAUZAMT]    NVARCHAR (max)null,
			  [PAYLOKFLG]    INT null,
			  [DOUFLG]       INT null,
			  [TSSCOD(0)]    NVARCHAR (max)null,
			  [TSSCOD(1)]    NVARCHAR (max)null,
			  [TSSCOD(2)]    NVARCHAR (max)null,
			  [TSSCOD(3)]    NVARCHAR (max)null,
			  [ACCCOD]       NVARCHAR (max)null,
			  [PTE]          NVARCHAR (40)null,
			  [VACBPR]       NVARCHAR (max) null, 
			  [XX12CHQNAM]   NVARCHAR (max)null,
			  [XX12CHQORD]   NVARCHAR (max)null,
			  [XX12BPSCBU]   NVARCHAR (max)null,
			  [XX12NIF]      NVARCHAR (13)null,
			  [XX12PERFLG]   NVARCHAR (max)null,
			  [XX12SITGAN]   NVARCHAR (max) null,
			  [XX12REGIIBB]  NVARCHAR (max) null,
			  [XX12IIBB]     NVARCHAR (13)null,
			  [XX12DOCTYP]   INT null,
			  [XX12DOCNUM]   NVARCHAR (13)null,
			  [XX12MTBBPR]   NVARCHAR (max)null,
			  [XX12BPSEMB]   NVARCHAR (max)null, 
			  [XX12BPRINT]   INT null,
			  [XX12CTRFIS]   NVARCHAR (max)null,
			  [XX12SITIBCAB] NVARCHAR (max)null,
			  [XX12ALLRET]   VARCHAR  (2)null,
			  [*71]          NVARCHAR (max)null,
			  [*72]          NVARCHAR (max)null, 
			  [*81]          NVARCHAR (max)null,
			  [*82]          NVARCHAR (max)null,


			  INDICADOR_A    VARCHAR  (2)not null,
			  [BPAADD]       NVARCHAR (3)null,
			  [BPADES]       NVARCHAR (40)null,
			  [BPAADDLIG(0)] NVARCHAR (30)null,
			  [BPAADDLIG(1)] NVARCHAR (30)null,
			  [POSCOD]       NVARCHAR (40) null,
			  [CRY2]         NVARCHAR (40)null,
			  [BPAADDFLG]    INT null,
			  [TEL(0)]       NVARCHAR (30)null,
			  [TEL(1)]       NVARCHAR (30)null,
			  [FAX]          NVARCHAR (40)null,
			  [FCYWEB]       NVARCHAR (50)null,
			  [WEB(0)]       NVARCHAR (40)null,
			  [WEB(1)]       NVARCHAR (50)null,


			  INDICADOR_C    VARCHAR  (2)not null,
			  [CCNCRM]       NVARCHAR (80)null,
			  [CNTTTL]       NVARCHAR (20)null,
			  [CNTFNA]       NVARCHAR (80)null,
			  [CNTLNA]       NVARCHAR (20)null,
			  [TEL]          NVARCHAR (20)null,
			  [WEB]          NVARCHAR (80)null,
			  [CNTFNC]       NVARCHAR (40)null,
			  [CNTMSS]       NVARCHAR (40)null,


			  INDICADOR_O    VARCHAR  (2)not null,
			  [ODFCOD]       NVARCHAR (80)null,
			  [ODFVAL]       NVARCHAR (80)null,


			  INDICADOR_P    VARCHAR  (2)not null,
			  [SAT]          NVARCHAR (80)null, 
			  [DATDEB]       NVARCHAR (80)null,
			  [DATFIN]       NVARCHAR (80)null,


			  INDICADOR_R    VARCHAR  (2)not null,
			  [XX12CRET]     NVARCHAR (3)null
 )


	 insert into ##TMPTABLE_PROVEEDOR
	SELECT  



		'B' AS 'INDICADOR_B',
		P.TIP_CODIGO AS [BSGCOD],									   --Categoría
		P.PR_CODIGO AS [BPSNUM]	,								       --Proveedor
	
		CASE P.[ESP_CODIGO]
			WHEN '01' THEN 2
			WHEN '02' THEN 1
			ELSE 2
		END AS [ENAFLG]	,											   --Activo  1) No  2) Si

		UPPER(LEFT(P.[PR_NOMBRE], 35))  AS [BPRNAM],				   --Razón Social

		LEFT (PR_NOMBRE,10) AS [BPRSHO],							   --Descrip. corta, abreviación de la razón social, se puede dejar en blanco

	
		        (SELECT CASE UPPER(PR.PO_DESCRI)
					--LISTADO PAISES
					WHEN 'BOLIVIA'    THEN 'BO' 
					WHEN 'BRASIL'     THEN 'BR' 
					WHEN 'ARGENTINA'  THEN 'AR'
					WHEN 'CHILE'      THEN 'CL'
					WHEN 'COLOMBIA'   THEN 'CO'
					WHEN 'ECUADOR'    THEN 'EC'
					WHEN 'ESTADOS UNIDOS' THEN 'US'
					WHEN 'GUATEMALA'  THEN 'GT'
					WHEN 'ITALIA'     THEN 'IT'
					WHEN 'MEXICO'     THEN 'MX'
					WHEN 'PANAMA'     THEN 'PA'
					WHEN 'PARAGUAY'   THEN 'PY'
					WHEN 'PERU'       THEN 'PE'
					WHEN 'SUIZA'      THEN 'SZ'
					WHEN 'UCRANIA'    THEN 'UA'
					WHEN 'URUGUAY'    THEN 'UY'
					WHEN 'VENEZUELA'  THEN 'VE'
			
					--PROVINCIAS
			        WHEN 'FORMOSA'    THEN 'AR'
			        WHEN 'JUJUY'      THEN 'AR'
			        WHEN 'LA PAMPA'   THEN 'AR'
			 	    WHEN 'LA RIOJA'   THEN 'AR'
				    WHEN 'MENDOZA'    THEN 'AR'
				    WHEN 'MISIONES'   THEN 'AR'
				    WHEN 'NEUQUEN'    THEN 'AR'
				    WHEN 'RIO NEGRO'  THEN 'AR'
				    WHEN 'BUENOS AIRES' THEN 'AR'
				    WHEN 'CAPITAL FEDERAL' THEN 'AR'
				    WHEN 'CATAMARCA'  THEN 'AR'
				    WHEN 'CHACO'      THEN 'AR'
				    WHEN 'CHUBUT'     THEN 'AR'
				    WHEN 'CORDOBA'    THEN 'AR'
				    WHEN 'CORRIENTES' THEN 'AR'
			 	    WHEN 'ENTRE RIOS' THEN 'AR'
				    WHEN 'SALTA'      THEN 'AR'
				    WHEN 'SAN JUAN'   THEN 'AR'
				    WHEN 'SAN LUIS'   THEN 'AR'
				    WHEN 'SANTA CRUZ' THEN 'AR'
				    WHEN 'SANTA FE'   THEN 'AR'
				    WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				    WHEN 'TUCUMAN'    THEN 'AR'
				    WHEN 'TIERRA DEL FUEGO'    THEN 'AR'
			    ELSE ''END)  AS [CRY],   									   --País  

		'SPA' AS [LAN],												       --Idioma del proveedor SPA-Español, ENG-Inglés
			

		REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','') AS [CRN],		       --N.I.F.  En Argentina es el número de CUIT

	   
		'ARS' AS [CUR],														--Divisa ARS Peso Argentino, USD Dólar
		'D'   AS [ABCCLS],												    --Categoría ABC  1) Clase A.  2) Clase B.  3)Clase C.  4)Clase D
		''    AS [PLISTC],													--Estructura tarifa
		''    AS [BPTNUM],													--Transportista
		''    AS [MDL],														--Modo de entrega
		''    AS [EECICT],													--Incoterm
		'1'   AS [BPSTYP],											        --Tipo proveedor  1) Normal  2) Prospecto  3) Varios
		''    AS [MATTOL],													--Regla conciliación
		'2'   AS [OSTCTL]	,										        --Control encurso    1) Controlado  2) Libre  3) Bloqueado
		''    AS [OSTAUZAMT],												--Encurso autorizado
		'1'   AS [PAYLOKFLG],											    --Bloqueo pago. 1) No  2) Si
		'1'   AS [DOUFLG],											        --Litigio.  1) No 2) Aviso  3) Bloqueante
		''    AS [TSSCOD(0)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(1)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(2)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(3)],												--Familia estadística DEFINIR
		                                                                    --LEFT('AR_FOR_NAC', 10)
		'STD' AS [ACCCOD],											        --Código contable
	   
		 (CASE condCompra.CCM_CODIGO
		    WHEN '001' THEN '001'
			WHEN '002' THEN '004'
			WHEN '003' THEN '002'
			WHEN '004' THEN '007'
			WHEN '005' THEN '006'
			WHEN '006' THEN ''
			WHEN '007' THEN '005'
			WHEN '008' THEN '001'
            WHEN ''    THEN '001' 
		  END) AS [PTE],													--Condición pago
	  	   									

			
		CASE P.PR_IVA 
				WHEN 1 THEN 'CF'
				WHEN 2 THEN 'RI'
				WHEN 3 THEN 'RNI'
				WHEN 4 THEN 'EXE'
				WHEN 5 THEN ''
				WHEN 6 THEN ''
				WHEN 7 THEN 'EXE'
				WHEN 8 THEN 'RM'  --En Zeus 'Responsable Monotributo'- En SAGE 'Regimen Monotributista'
				WHEN 9 THEN 'RNC' --En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
				ELSE ''
		   END AS [VACBPR],		                                            --LEFT('ARS', 5)  AS [VACBPR], --Reg.impuesto										
	   	 
		'' AS [XX12CHQNAM],													--Cheque a la orden de (Razón social del beneficiario)
		'' AS [XX12CHQORD],													--Cheque no a la Orden. Si se utiliza cheques no a la orden, Opción 1) NO 2) SI
		'' AS [XX12BPSCBU],													--CBU de la cuenta bancaria asociada al proveedor	

		REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','')  AS [XX12NIF],		    --Número de CUIT/CUIL del cliente sin guiones

		'' AS [XX12PERFLG],													--Agente de Per. IVA


		(	CASE P.PR_POSGAN
				WHEN 1 THEN 'AC'
				WHEN 2 THEN 'NI'
				WHEN 3 THEN 'EX'
			END
		) AS [XX12SITGAN],			 				                        --Situación Ganancias    /*Verificar */
																		
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
         (case P.PR_IBR
		     
			 when '' then p.PR_CUIT
			 else P.PR_IBR
	    end ) AS [XX12IIBB],
	
		--REPLACE(REPLACE(P.PR_IBR, '-', ''), '.','') AS [XX12IIBB],	    --Num Ingresos Brutos
		
		'80' AS [XX12DOCTYP],												--Tipo Documento.  CUIT: 80, CUIL:  86. DNI: 96

		REPLACE(REPLACE(P.PR_CUIT, '-', ''), '.','') AS [XX12DOCNUM],		--Número de Documento Ver guiones espacios
	
	   
		'' AS [XX12MTBBPR],												--Monotributo
		'' AS [XX12BPSEMB],												--Embargado, Se completara automaticamente con la importación de padrones. Dejar vacío.
		'1' AS [XX12BPRINT],											--Tercero Interno:  1) No -  2) Si
		'' AS [XX12CTRFIS],												--CAE no obligatorio.  1) No  - 2) Si
		'' AS [XX12SITIBCAB],											--Situación IB CABA. 1) Alto Riesgo 2) Reg. Simplificado 3) Reg. General
		'2' AS [XX12ALLRET],			 								--Todas las Retenciones. 1) No - 2) Si
		'' AS [*71],													--Texto pedido
		'' AS [*72],													--Texto pedido
		'' AS [*81],													--Texto devolución
		'' AS [*82],													--Texto devolución

		/************************************************INDICADOR A******************************************************************/

		'A' AS 'INDICADOR_A',	
		
		'PRI' AS [BPAADD],												--Dirección
		'PRINCIPAL' AS [BPADES]	,										--Descripción max 30
		UPPER(LEFT(P.[PR_DIRECC], 50)) AS [BPAADDLIG(0)],				--Línea dirección
		UPPER(SUBSTRING(P.[PR_DIRECC], 51, 50)) AS [BPAADDLIG(1)],		--Línea dirección

		P.PR_CODPOS AS [POSCOD],   --Código Postal
		                              
		 											                
		
		(SELECT CASE UPPER(PR.PO_DESCRI)
					--LISTADO PAISES
					WHEN 'BOLIVIA'   THEN 'BO' 
					WHEN 'BRASIL'    THEN 'BR' 
					WHEN 'ARGENTINA' THEN 'AR'
					WHEN 'CHILE'     THEN 'CL'
					WHEN 'COLOMBIA'  THEN 'CO'
					WHEN 'ECUADOR'   THEN 'EC'
					WHEN 'ESTADOS UNIDOS' THEN 'US'
					WHEN 'GUATEMALA' THEN 'GT'
					WHEN 'ITALIA'    THEN 'IT'
					WHEN 'MEXICO'    THEN 'MX'
					WHEN 'PANAMA'    THEN 'PA'
					WHEN 'PARAGUAY'  THEN 'PY'
					WHEN 'PERU'      THEN 'PE'
					WHEN 'SUIZA'     THEN 'SZ'
					WHEN 'UCRANIA'   THEN 'UA'
					WHEN 'URUGUAY'   THEN 'UY'
					WHEN 'VENEZUELA' THEN 'VE'
			
					--PROVINCIAS
					WHEN 'FORMOSA'  THEN 'AR'
				    WHEN 'JUJUY'    THEN 'AR'
				    WHEN 'LA PAMPA' THEN 'AR'
				    WHEN 'LA RIOJA' THEN 'AR'
				    WHEN 'MENDOZA'  THEN 'AR'
				    WHEN 'MISIONES' THEN 'AR'
				    WHEN 'NEUQUEN'  THEN 'AR'
				    WHEN 'RIO NEGRO'THEN 'AR'
				    WHEN 'BUENOS AIRES'    THEN 'AR'
				    WHEN 'CAPITAL FEDERAL' THEN 'AR'
				    WHEN 'CATAMARCA'  THEN 'AR'
				    WHEN 'CHACO'      THEN 'AR'
				    WHEN 'CHUBUT'     THEN 'AR'
				    WHEN 'CORDOBA'    THEN 'AR'
				    WHEN 'CORRIENTES' THEN 'AR'
				    WHEN 'ENTRE RIOS' THEN 'AR'
				    WHEN 'SALTA'      THEN 'AR'
				    WHEN 'SAN JUAN'   THEN 'AR'
				    WHEN 'SAN LUIS'   THEN 'AR'
				    WHEN 'SANTA CRUZ' THEN 'AR'
				    WHEN 'SANTA FE'   THEN 'AR'
				    WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				    WHEN 'TUCUMAN'             THEN 'AR'
				    WHEN 'TIERRA DEL FUEGO'    THEN 'AR'

				    ELSE ''		END) AS [CRY2],                             --País
		   	
				   												    

		2 AS [BPAADDFLG],													--Por defecto
        LEFT(P.[PR_TELEF1], 20) AS [TEL(0)], 								--Teléfono
		LEFT(P.[PR_TELEF2], 20) AS [TEL(1)],    							--Teléfono 
	    '' AS [FAX],														--Fax
		'' AS [FCYWEB],							    				        --Sitio Web
		UPPER(LEFT(P.[PR_EMAIL], 80)) AS [WEB(0)],							--Dirección Internet
		'' AS [WEB(1)],													    --Dirección Internet

		/************************************************INDICADOR_C***************************************************************/

		'C' AS 'INDICADOR_C',														
		
		'' AS [CCNCRM],														--Código contrato
		'SEÑOR' AS [CNTTTL],												--Trato   1-Señor, 2-Señora, 3-Señorita
		 LEFT(PR_NOMBRE,20) AS CNTFNA,                                      --Nombre
        'SD' AS [CNTLNA],													--Apellidos
        '' AS [TEL],														--Teléfono
		LEFT(p.PR_EMAIL,80)    as 'WEB',							        --E-mail
		'' AS [CNTFNC],														--Función
        '' AS [CNTMSS],														--Rol

		/*************************************************INDICADOR_O***********************************************************************/

		'O' AS 'INDICADOR_O',	
		
		'' AS [ODFCOD],														--Otros Datos Locales
		'' AS [ODFVAL],														--Valor
	
	    /*************************************************INDICADOR_P************************************************************************/

		'P' AS 'INDICADOR_P',	
		
		'' AS [SAT],	            										--Provincia
		'' AS [DATDEB],														--Fecha desde
		'' AS [DATFIN],														--Fecha hasta

		/*************************************************INDICADOR_R*************************************************************************/

		'R' AS 'INDICADOR_R',						

		'GEN' AS [XX12CRET]								                     --Control
	
	
	FROM [VenturiFabrica].[dbo].[PROVEEDORES] P	
	LEFT JOIN [VenturiFabrica].[dbo].[PROVINCIA] PR
	ON PR.[PO_CODIGO] = P.[PO_CODIGO]
	LEFT JOIN Venturi.dbo.COND_COMPRA condCompra
	ON P.CCM_CODIGO = condCompra.CCM_CODIGO
	WHERE P.PR_CODIGO IN( '0B145','0H059','0A259','0A264','0A433','0A220','0A242','0A267','0A284','0A321','0A377','0A381','0A021','0A040','0E076',
                          '0T005','0C165','0C185','0C266','0D043','0F072','0F105','0F112','0F116','0J025','0A001','0A019','0A024','0A121','0A423',
						  '0A438','0A442','0B176','0C005','0C053','0E103','0M236','0P075','0Q005','0R011','0V052','0V053','0V065','0Z002','187',  
						  '00136','211','00195','00144'
                         )





	IF OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR_DATOS') IS NOT NULL
	   DROP TABLE ##TMPTABLE_PROVEEDOR_DATOS  


	CREATE TABLE ##TMPTABLE_PROVEEDOR_DATOS  (	
    
		categoria           NVARCHAR(MAX) NOT NULL,
		codigoProveedor     NVARCHAR(MAX) NOT NULL,
		sigla               NVARCHAR(MAX) NOT NULL,
		DescripcionCorta    NVARCHAR(MAX) NOT NULL,
		familiaEstadistica  NVARCHAR(MAX) NOT NULL,
		familiaEstadistica1 NVARCHAR(MAX) NOT NULL,
		familiaEstadistica2 NVARCHAR(MAX) NOT NULL,
		familiaEstadistica3 NVARCHAR(MAX) NOT NULL
	)

	    /**************************(CATEGORIA,CODIGOPROVEEDORE,SIGLA,DESCRIPCIONCORTA,FAMILIAESTADISTICA 0,1,2,3)*********************************/


		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PBAN',  'PBA-0002',   '0B145',   'BCO.CBA',    'NAC',	'SER',	 'BANCO',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PBAN',  'PBA-0007',   '0H059',   'HSBC',       'NAC',	'SER',	 'BANCO',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00001',	  '0A259',   'VH CHILE',   'EXT',	'VH',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00002',	  '0A264',   'HVI',        'EXT',	'VH',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00003',	  '0A433',   'IHM',        'EXT',	'VH',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00004',	  '0A220',   'AL UNNA',    'EXT',	'EXPRO', 'EXALU',	'EXPEA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00005',	  '0A242',   'INTERCOIL',  'EXT',	'EXPRO', 'EXVPR',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00008',	  '0A267',   'ZH',         'EXT',	'COMPL', 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00011',	  '0A284',   'PLONA',      'EXT',	'EXPRO', 'EXALU',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00014',	  '0A321',   'MOUSER ELE', 'EXT',	'EXPRO', 'EXDC',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00026',	  '0A377',   'HIDROS MAC', 'EXT',	'COMPL', 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PEXTE', 'E00029',	  '0A381',   'ONPOW PUSH', 'EXT',	'EXPRO', 'EXDC',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PGAS',  'PGA-0001',   '0A021',   'ALLIANZ',    'NAC',	'SER',	 'SEGUR',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PGAS',  'PGA-0002',   '0A040',   'KEEPER',     'NAC',	'SER',	 'PROTE',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PGAS',  'PGA-0008',   '0E076',   'E.P.E.C.',   'NAC',   'SER',   'ENERG',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PGAS',  'PGA-0016',   '0T005',   'TELECOM',    'NAC',	'SER',	 'TELFF',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00024',	  '0C165',   'CHECANOVSK', 'NAC',	'PRO',	 'VPROD',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00025',	  '0C185',   'CABRERA',    'NAC',	'PRO',	 'TRATM',	'TRATS')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00026',	  '0C266',   'CRUCIANELL', 'NAC',	'PRO',	 'FUND',	'FUNOD')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00028',	  '0D043',   'DANTRA',     'NAC',	'PRO',	 'TRATM',	'TRATT')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00036',	  '0F072',   'FABRYMET',   'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00037',	  '0F105',   'FORMULA100', 'NAC',	'PRO',	 'FILTR',	'DISTF')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00038',	  '0F112',   'FANUC',      'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00039',	  '0F116',   'FUSUR',      'NAC',	'PRO',	 'FUND',	'FUGRI')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PNAC',  'N00055',	  '0J025',   'JS FUND.',   'NAC',	'PRO',	 'FUNDA',	'GRAVE')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0001',   '0A001',   'ANDREANI',   'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0004',   '0A019',   'ALERCIA',    'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0005',   '0A024',   'ABC',        'NAC',   'AUX', 	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0014',   '0A121',   'AMIANGRAF',  'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0030',   '0A423',   'ENGIS',      'EXT',	'EXAUX', 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0031',   '0A438',   'BOXI LLC',   'EXT',	'EXAUX', 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0032',   '0A442',   'ODOO INC.',  'EXT',	'EXAUX', 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0057',   '0B176',   'BE TECH',    'NAC',	'SER',	 'CONSU',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0058',   '0C005',   'CONFECAT',   'NAC',	'AUX',	 'SEGDD',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0067',   '0C053',   'Ca.C.E.C.',  'NAC',	'SER',	 'COMEX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0119',   '0E103',   'EMBALAR',    'NAC',	'AUX',	 'VAUX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0212',   '0M236',   'METAC',      'NAC',	'AUX',	 'PQUIM',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0247',	  '0P075',   'PISTOIA',    'NAC',	'SER',	 'SMEDIC',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0253',	  '0Q005',   'QUAKER',     'NAC',	'AUX',	 'LUBRI',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0254',	  '0R011',   'RICHETTA',   'NAC',	'AUX',	 'ELCTD',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0332',	  '0V052',   'MONICA',     'NAC',	'DIR',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0333',	  '0V053',   'MARCO',      'NAC',	'DIR',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0338',	  '0V065',   'VENEX',      'NAC',	'AUX',	 'COMPU',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PVAR',  'PVA-0347',	  '0Z002',   'ZOFRACOR',   'NAC',	'SER',	 'COMEX',	'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PSUC',  'PSU-0001',	  '187',     'UNIVERSAL',  'NAC',	'SUCU',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PSUC',  'PSU-0017',	  '00136',	 'ALFA SERVI', 'NAC',	'SUCU',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PSUC',  'PSU-0043',	  '211',     'PINTU EXPR', 'NAC',	'SUCU',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PSUC',  'PSU-0044',	  '00195',	 'BULONERIA',  'NAC',	'SUCU',	 'ZNA',	    'ZNA')
		insert into ##TMPTABLE_PROVEEDOR_DATOS VALUES ('PSUC',  'PSU-0045',	  '00144',	 'EMBALAJE E', 'NAC',	'SUCU',	 'ZNA',	    'ZNA')





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

		DECLARE @categoria nvarchar(max)
		DECLARE @codigoProveedor NVARCHAR(MAX)
		DECLARE @sigla NVARCHAR(MAX) 
		DECLARE @DescripcionCorta nvarchar (MAX)
		DECLARE @familiaEstadistica NVARCHAR(MAX)
		DECLARE @familiaEstadistica1 NVARCHAR(MAX)
		DECLARE @familiaEstadistica2 NVARCHAR(MAX)
		DECLARE @familiaEstadistica3 NVARCHAR(MAX)

		SET @categoria ='' 
		SET @codigoProveedor = ''
		SET @sigla = ''
		SET @DescripcionCorta =''
		SET @familiaEstadistica = ''
		SET @familiaEstadistica1 = ''
		SET @familiaEstadistica2 = ''
		SET @familiaEstadistica3 = ''



		DECLARE PROVEEDOR_DATOS CURSOR 
			FOR
			SELECT *
			FROM ##TMPTABLE_PROVEEDOR_DATOS 

			OPEN PROVEEDOR_DATOS
			FETCH PROVEEDOR_DATOS INTO @categoria, @codigoProveedor, @sigla,@DescripcionCorta,@familiaEstadistica,@familiaEstadistica1,@familiaEstadistica2,@familiaEstadistica3
			WHILE(@@FETCH_STATUS=0)
			BEGIN

				INSERT INTO ##TMPDATA
				SELECT distinct 
					TP.INDICADOR_B,TPD.categoria,TPD.codigoProveedor, TP.ENAFLG , TP.BPRNAM ,TPD.DescripcionCorta, TP.CRY , TP.LAN , TP.CRN , TP.CUR , TP.ABCCLS ,TP.PLISTC , TP.BPTNUM ,      
					TP.MDL, TP.EECICT , TP.BPSTYP , TP.MATTOL ,  TP.OSTCTL, TP.OSTAUZAMT ,  TP.PAYLOKFLG, TP.DOUFLG  , TPD.familiaEstadistica,  TPD.familiaEstadistica1, TPD.familiaEstadistica2,    
					TP.[TSSCOD(3)],  TP.ACCCOD ,TP.PTE , TP.VACBPR,TP.XX12CHQNAM ,TP.XX12CHQORD , TP.XX12BPSCBU , TP.XX12NIF , TP.XX12PERFLG , TP.XX12SITGAN ,  TP.XX12REGIIBB,   
					TP.XX12IIBB , TP.XX12DOCTYP ,TP.XX12DOCNUM ,TP.XX12MTBBPR ,TP.XX12BPSEMB ,TP.XX12BPRINT , TP.XX12CTRFIS , TP.XX12SITIBCAB, TP.XX12ALLRET, TP.[*71],  
					TP.[*72],  TP.[*81], TP.[*82]           
				FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
				WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor

		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_A , TP.[BPAADD], TP.[BPADES] , TP.[BPAADDLIG(0)],TP.[BPAADDLIG(1)],TP.[POSCOD] , TP.[CRY2]  , TP.[BPAADDFLG],
			TP.[TEL(0)]  , TP.[TEL(1)]  ,TP.[BPTNUM],TP.[FAX]  ,TP.[FCYWEB], TP.[WEB(0)],TP.[WEB(1)],'','','','','','','',	
			'', '' , '' , '' ,'', '', '', '', '',  '',  '',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '', '',  '',   ''  
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor


		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_C ,TP.[CCNCRM] ,TP.[CNTTTL] ,TP.[CNTFNA] , TP.[CNTLNA] ,TP.[TEL] ,TP.[WEB] ,TP.[CNTFNC] ,TP.[CNTMSS] , '','','',
			'',  '',	'','', '', '', '',  '',  '',  '',  '',  '' , '' , '' , '', '',  '',  '',  '',  '',  '','',  '', '', '',  '',  '', 
			'',  '',  '', '', '', '','',  '',   ''   
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor



			INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_R ,TP.[XX12CRET] ,'' ,'' , '' ,'' ,'' ,'' ,'' , '','','',  '',  '',	'','', '', '',  
			'',  '',  '',  '',  '',  '' , '' , '' , '', '',  '',  '',  '',  '',  '','',  '', '', '',  '',  '',  '',
			'',  '', '', '', '','',  '',   ''   
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor




		/*INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_O , TP.[ODFCOD] , TP.[ODFVAL] , '',  '',  '',   '',    '', '',  '','', '','',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '' , '' , 
			'',  '',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',   '',''   
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor



		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_P , TP.[SAT] ,  TP.[DATDEB] , TP.[DATFIN], TP.[XX12CRET],'', '', '', '', '','',  '',  '', '', '',  '',  '',  '',  '',  '',  '',  '',  
			'',  '' , '' , '' , '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',   ''  
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor*/

		FETCH PROVEEDOR_DATOS INTO  @categoria, @codigoProveedor, @sigla,@DescripcionCorta, @familiaEstadistica, @familiaEstadistica1, @familiaEstadistica2, @familiaEstadistica3

		END

		CLOSE PROVEEDOR_DATOS

		DEALLOCATE PROVEEDOR_DATOS



		SELECT ISNULL(tmpData.Dato1,''), ISNULL(tmpData.Dato2, ''), ISNULL(tmpData.Dato3,''), ISNULL(tmpData.Dato4,''), ISNULL(tmpData.Dato5,''),
		       ISNULL(tmpData.Dato6, ''),ISNULL (tmpData.Dato7, ''),ISNULL(tmpData.Dato8,''), ISNULL(tmpData.Dato9,''), ISNULL(tmpData.Dato10,''),ISNULL(tmpData.Dato11,''),
			   ISNULL(tmpData.Dato12,''),ISNULL(tmpData.Dato13,''), ISNULL(tmpData.Dato14,''),ISNULL(tmpData.Dato15,''),ISNULL(tmpData.Dato16,''),ISNULL(tmpData.Dato17,''),
			   ISNULL(tmpData.Dato18,''),ISNULL(tmpData.Dato19,''), ISNULL(tmpData.Dato20,''),ISNULL(tmpData.Dato21,''),ISNULL(tmpData.Dato22,''),ISNULL(tmpData.Dato23,''),
			   ISNULL(tmpData.Dato24,''),ISNULL(tmpData.Dato26,''), ISNULL(tmpData.Dato27,''),ISNULL(tmpData.Dato28,''),ISNULL(tmpData.Dato29,''),
			   ISNULL(tmpData.Dato30,''),ISNULL(tmpData.Dato31,''), ISNULL(tmpData.Dato32,''),ISNULL(tmpData.Dato33,''),ISNULL(tmpData.Dato34,''),
			   ISNULL(tmpData.Dato35,''),ISNULL(tmpData.Dato36,''), ISNULL(tmpData.Dato37,''),ISNULL(tmpData.Dato38,''),ISNULL(tmpData.Dato39,''),ISNULL(tmpData.Dato40,''),
			   ISNULL(tmpData.Dato41,''),ISNULL(tmpData.Dato42,''), ISNULL(tmpData.Dato43,''),ISNULL(tmpData.Dato44,''),ISNULL(tmpData.Dato45,''),ISNULL(tmpData.Dato46,''),
			   ISNULL(tmpData.Dato47,''),ISNULL(tmpData.Dato48,'')

		FROM ##TMPDATA tmpData
	


