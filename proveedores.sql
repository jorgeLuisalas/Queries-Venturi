USE VenturiFabrica
GO

SELECT  top 10
	'B' AS 'B',
	P.TIP_CODIGO AS [BSGCOD],											--Categor�a
	P.PR_CODIGO AS [BPSNUM],											--Proveedor

	CASE P.[ESP_CODIGO]
		WHEN '01' THEN 2
		WHEN '02' THEN 1
		ELSE 2
	END AS [ENAFLG],													--Activo  1) No  2) Si

	UPPER(LEFT(P.[PR_NOMBRE], 35))  AS [BPRNAM],						--Raz�n Social

	 LEFT (PR_NOMBRE,10) AS [BPRSHO],														--Descrip. corta, abreviaci�n de la raz�n social, se puede dejar en blanco

	
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
				WHEN 'TF' THEN 'TF - A DEFINIR �TIERRA DEL FUEGO?'
			
				ELSE 'A DEFINIR'					
			END) 
	   AS [CRY],   														--Pa�s  AR-Argentina, BR-Brasil, US-Estados Unidos.

	'' AS [LAN],														--Idioma del proveedor SPA-Espa�ol, ENG-Ingl�s
			

	REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','') AS [CRN],			    --N.I.F.  En Argentina es el n�mero de CUIT

	   
	'ARS' AS [CUR],														--Divisa ARS Peso Argentino, USD D�lar
	'D' AS [ABCCLS],														--Categor�a ABC  1) Clase A.  2) Clase B.  3)Clase C.  4)Clase D
	'' AS [PLISTC],														--Estructura tarifa
	'' AS [BPTNUM],														--Transportista
	'' AS [MDL],														--Modo de entrega
	'' AS [EECICT],														--Incoterm
	'1' AS [BPSTYP],											        --Tipo proveedor  1) Normal  2) Prospecto  3) Varios
	'' AS [MATTOL],														--Regla conciliaci�n
	'2' AS [OSTCTL],											            --Control encurso    1) Controlado  2) Libre  3) Bloqueado
	'' AS [OSTAUZAMT],													--Encurso autorizado
	'1' AS [PAYLOKFLG],											        --Bloqueo pago. 1) No  2) Si
	'1' AS [DOUFLG],											        --Litigio.  1) No 2) Aviso  3) Bloqueante
	'' AS [TSSCOD(0)],													--Familia estad�stica DEFINIR
	'' AS [TSSCOD(1)],													--Familia estad�stica DEFINIR
	'' AS [TSSCOD(2)],													--Familia estad�stica DEFINIR
	'' AS [TSSCOD(3)],													--Familia estad�stica DEFINIR
	--LEFT('AR_FOR_NAC', 10)
	'A DEFINIR' AS [ACCCOD],											--C�digo contable
	   
	 (CASE condCompra.CCM_DESCRI
		WHEN '' THEN 'A DEFINIR'
		ELSE condCompra.CCM_DESCRI
	  END) AS [PTE],													--Condici�n pago
	  	   									

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
	   	 
	'' AS [XX12CHQNAM],													--Cheque a la orden de (Raz�n social del beneficiario)
	'' AS [XX12CHQORD],													--Cheque no a la Orden. Si se utiliza cheques no a la orden, Opci�n 1) NO 2) SI
	'' AS [XX12BPSCBU],													--CBU de la cuenta bancaria asociada al proveedor	

	REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','')  AS [XX12NIF],		    --N�mero de CUIT/CUIL del cliente sin guiones

	'' AS [XX12PERFLG],													--Agente de Per. IVA


	(	CASE P.PR_POSGAN
			WHEN 1 THEN 'RI'
			WHEN 2 THEN 'RNI'
			WHEN 3 THEN 'EXE'
		END
	) AS [XX12SITGAN],													--Situaci�n Ganancias
																		/*
																			CF: Consumidor final
																			EXC: Cliente del exterior
																			EXE: Exento
																			EXP: Proveedores del exterior
																			INR: Inscripto no responsable
																			RI: R�gimen inscripto
																			RM: R�gimen monotributista
																			RNC: Responsable no categorizado			
																			RNI: Responsable no inscripto
																		*/

	(CASE p.PR_CATIBR
		WHEN 0 THEN ''
		WHEN 1 THEN '2'
		WHEN 2 THEN '1'
	 END)  AS [XX12REGIIBB],											--R�gimen IIBB   
																		/*
																			1) Convenio Multilateral (2 en Zeus) , 
																			2) Local (1 en Zeus ,  
																			3) Todas
																		*/																	

	
	REPLACE(REPLACE(P.PR_IBR, '-', ''), '.','') AS [XX12IIBB],			--Num Ingresos Brutos
		
	'80' AS [XX12DOCTYP],												--Tipo Documento. C�digo del documento identificatorio. CUIT: 80, CUIL:  86. DNI: 96
	REPLACE(REPLACE(P.PR_CUIT, '-', ''), '.','') AS [XX12DOCNUM],		--N�mero de Documento Ver guiones espacios
	
	   
	'' AS [XX12MTBBPR],													--Monotributo
																		/*
																			CF: Consumidor final
																			EXC: Cliente del exterior
																			EXE: Exento
																			EXP: Proveedores del exterior
																			INR: Inscripto no responsable
																			RI: Regimen inscripto
																			RM: R�gimen monotributista
																			RNC: Responsable no categorizado
																			RNI: Responsable no inscripto
																		*/
	'' AS [XX12BPSEMB],													--Embargado, Se completara automaticamente con la importaci�n de padrones. Dejar vac�o.
	'1' AS [XX12BPRINT],													--Tercero Interno:  1) No -  2) Si
	'' AS [XX12CTRFIS],													--CAE no obligatorio.  1) No  - 2) Si
	'' AS [XX12SITIBCAB],												--Situaci�n IB CABA. 1) Alto Riesgo 2) Reg. Simplificado 3) Reg. General
	'2' AS [XX12ALLRET],													--Todas las Retenciones. 1) No - 2) Si
	'' AS [*71],														--Texto pedido
	'' AS [*72],														--Texto pedido
	'' AS [*81],														--Texto devoluci�n
	'' AS [*82],														--Texto devoluci�n
	'A' AS 'A',															--
	'PRI' AS [BPAADD],														--Direcci�n
	'PRINCIPAL' AS [BPADES],														--Descripci�n max 30
	UPPER(LEFT(P.[PR_DIRECC], 50)) AS [BPAADDLIG(0)],					--L�nea direcci�n
	UPPER(SUBSTRING(P.[PR_DIRECC], 51, 50)) AS [BPAADDLIG(1)],			--L�nea direcci�n

	(CASE LEFT(P.PR_CODPOS, 10) 
		WHEN '' THEN 'A DEFINIR'	
		ELSE LEFT(P.PR_CODPOS, 10) 
	END)
	AS [POSCOD],														--C�digo Postal
		
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
				WHEN 'TF' THEN 'TF - A DEFINIR �TIERRA DEL FUEGO?'
			
				ELSE 'A DEFINIR'					
			END) 
	   AS [CRY],   														--Pa�s

	2 AS [BPAADDFLG],													--Por defecto



	/*Se ha generado la query para enviar a la gente de Venturi y decidan sobre los telefonos proveedores */

	LEFT(P.[PR_TELEF1], 20) AS [TEL(0)], 								--Tel�fono
	LEFT(P.[PR_TELEF2], 20) AS [TEL(1)],    							--Tel�fono

	/******************************************************************************************************/


	'' AS [FAX],														--Fax
	'' AS [FCYWEB],													    --Sitio Web
	UPPER(LEFT(P.[PR_EMAIL], 80)) AS [WEB(0)],							--Direcci�n Internet
	'' AS [WEB(1)],													    --Direcci�n Internet
	'C' AS 'C',															--
	'' AS [CCNCRM],														--C�digo contrato
	'' AS [CNTTTL],														--Trato   1-Se�or, 2-Se�ora, 3-Se�orita
    '' AS [CNTFNA],														--Nombre

	/****Se ha generado la query para enviar a la gente de Venturi y decidan sobre contactos PR_CONTAC*****/

	'' AS [CNTLNA],														--Apellidos

	/******************************************************************************************************/

	'' AS [TEL],														--Tel�fono
	'' AS [WEB],														--E-mail
	'' AS [CNTFNC],														--Funci�n 1)P.D.G. 2)Director Comercial 3) Director T�cnico 4)Responsable de compras 5)Comprador
																		--6)Responsable de stocks 7)Director Financiero y jur�dico 8)Responsable import/export
																		--9)Director de planta 10)Operador externo 11)Varios 12)Interlocutor Reach	
	'' AS [CNTMSS],														--Rol
	'O' AS 'O',															--
	'' AS [ODFCOD],														--Otros Datos Locales
	'' AS [ODFVAL],														--Valor


	'' AS 'P',															--
	'' AS [SAT],	            										--Provincia
	'' AS [DATDEB],														--Fecha desde
	'' AS [DATFIN],														--Fecha hasta
	--'R' AS 'R',														--Indicador R, en este caso no va
	'GEN' AS [XX12CRET]													--Control
FROM [VenturiFabrica].[dbo].[PROVEEDORES] P	
LEFT JOIN [VenturiFabrica].[dbo].[PROVINCIA] PR
ON PR.[PO_CODIGO] = P.[PO_CODIGO]
LEFT JOIN Venturi.dbo.COND_COMPRA condCompra
ON P.CCM_CODIGO = condCompra.CCM_CODIGO
ORDER BY P.[PO_CODIGO]

