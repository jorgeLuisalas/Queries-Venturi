USE Venturi
GO


SELECT 'I' AS 'I',
		LEFT(LTRIM(FA_CODIGO), 5) as TCLCOD,												  --Aqui hay que ver algunos n�meros especificos, CATEGORIA DE LOS ARTICULOS	

		/*
			Aqu� podria poner un CASE para comparar los valores, recordar que para Argentina tiene
			5 digitos para comparar, cual es correcto.

			No encuentro donde podr� estar la comparaci�n de esto
		*/
		UPPER(LEFT(REPLACE(REPLACE(RTRIM(A.AR_CODIGO),'-', ''), '.', ''), 20)) AS [ITMREF],   --C�DIGO DEL ARTICULO SIN ESPACIOS NI GUIONES
		UPPER(LEFT(A.AR_DESCRI, 30)) AS DES1AXX,											  --Descripci�n 1er m�ximo 30 caracteres		
		UPPER(SUBSTRING(A.AR_DESCRI, 31, 30)) AS DES2AXX,								      --Descripci�n 2do m�ximo 30 caracteres
		UPPER(SUBSTRING(A.AR_DESCRI, 61, 30)) AS DES3AXX,									  --Descripci�n 3er m�ximo 30 caracteres
		'' AS SEAKEY,																	      --Clave de busqueda
		'' AS CFGLIN,																		  --Linea de producto		
		AR_BARRAS AS EANCOD,																  --C�digo EAN
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



		1 AS [LOTMGTCOD],																	  --Gesti�n lote, 1) Sin gesti�n, 2) Lote opcional, 3) Lote (obligatorio), 4) Lote y sublote
		'' AS [LOTCOU],																		  --Contador lote
		1 AS [EXYMGTCOD],																	  --Gesti�n caducidad 1) Sin gesti�n 2) Sin redondeo 3) Redondeo de fin de mes 4) Redonde ini mes + 1 5) Entrada obligatoria 6) Entrada manual
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
		'' AS [ACCCOD],																		  --C�digo contable (A CONSULTAR)
		'' AS [VACITM(0)],																	  --Nivel impuesto  (A CONSULTAR)
		'' AS [VACITM(1)],																	  --Nivel impuesto
		'' AS FIMHOR,																		  --Horizonte firme
		'' AS FIMHORUOM,																	  --Unidad tpo hor.firme
		'' AS [CCE(0)],																		  --Secci�n an�litica
		'' AS [CCE(1)],																		  --Secci�n an�litica
		'' AS [CCE(2)],																		  --Secci�n an�litica
		'' AS [OFS],																		  --Plazo reaprov
		'' AS [*71],																		  --Texto compra
		'' AS [*72],																		  --Texto compra 
		'' AS [*81],																		  --Texto producci�n
		'' AS [*82],																		  --Texto producci�n
		'S' AS 'S',
		'' AS [SBSITM],																		  --Articulo sustituci�n
		'' AS [PCK],																		  --Embalaje
		'' AS [PCKCAP],																		  --Capacidad de embalaje
		'' AS [BASPRI],																		  --Precio de base
		'' AS [*71],																		  --Texto de venta
		'' AS [*72],																		  --Texto de venta
		'' AS [*81],																	      --Texto de producci�n
		'' AS [*82],																		  --Texto de producci�n
		'U' AS 'U',
       	LEFT(cliente.CL_CODIGO, 15)  AS [BPCNUM],										      --Cliente
		UPPER(LEFT(clienteArt.AR_CODIGO_CL, 20)) AS [ITMREFBPC],						      --Art�culo-cliente
                             
		'' AS [PCU1],																		  --Envasado 1
		'' AS [PCUSAUCOE1],																	  --Coef.  UE1-UV
		'' AS [PCK],																		  --Embalaje
		'' AS [PCKCAP],																		  --Capacidad embalaje
		'' AS [*71],																		  --Texto de venta
		'' AS [*72],																		  --Texto de venta
		'' AS [*81],																		  --Texto de preparaci�n
		'' AS [*82],																		  --Texto de preparaci�n
		'P' AS 'P',
		LEFT(AP.PR_CODIGO, 15) AS [BPSNUM],													  --Proveedor
		UPPER(LEFT(A.AR_DESCRI, 20)) AS [ITMREFBPS],										  --Art�culo proveedor
		'' AS [PIO],																		  --Prioridad (Entero corto)
		'' AS [EANCODBPS],																	  --C�digo EAN proveedor
		'' AS [PUU],																		  --Unidad compra
		'' AS [PUUSTUCOE],																	  --Coef. UC-US
		'' AS [PURMINQTY],																      --Cantidad minima de compra
		'' AS [PCU],																	      --Envasado
		'' AS [PCUPUUCOE],															          --Coef. UE-UC
		'' AS [*71],																          --Texto compra
		'' AS [*72],																		  --Texto compra
		'O' AS 'O',
		'' AS [ODFCOD],																		  --Otros datos locales
		'' AS [ODFVAL],																		  --Valor
		'Q' AS 'Q',
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