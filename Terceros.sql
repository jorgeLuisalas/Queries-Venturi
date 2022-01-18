use Venturi
go


select

''                  as 'A',
''                  as 'BPRNUM',  --C�digo de tercero �?
c.CL_NOMBRE         as 'BPRNAM',  --Raz�n social (Verficar que sea la misma que el nombre)
''                  as 'BPRSHO',  --Descripci�n corta --Verifar 
c.CL_CODIGO         as 'BPRLOG', --Sigla
'ARS'               as 'CUR',-- Divisa
 (SELECT CASE UPPER(prov.PO_DESCRI) --Pa�s
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
			
				
								
			END) 
	   AS 'CRY',
	   
'SPA'	            as 'LAN', --Idioma

(CASE C.CL_CUIT              --N.I.F
			WHEN '' THEN 'A DEFINIR'
			ELSE C.CL_CUIT
	    END)
	   AS 'CRN',
	   
c.CL_IBR            as 'XX12IIBB',--Nro.Ing.Brutos
c.CL_TIPDOC         as 'DOCTYP',--Tipo de documento 
SUBSTRING(c.CL_CUIT,3,8)  as 'XX12DOCNUM',--Nro.documento
c.CL_CUIT           as 'XX12NIF',--Nro.Cuit
''                  as 'B',
C.CL_DIRECC         as 'BPAADD',--Direcci�n
''                  as 'BPADES',        --Descripci�n
''                  as 'BPAADDLIG(0)',   --L�nea de direcci�n
''                  as 'BPAADDLIG(1)',   --L�nea de direcci�n
''                  as 'BPAADDLIG(2)',   --L�nea de direcci�n
c.CL_CODPOS         as 'POSCOD',         --C�digo postal 


 CASE UPPER(prov.PO_DESCRI)       ---Provincia
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
				WHEN 'TUCUMAN' THEN 'AR' end as 'SAT',

c.CL_LOCALI         as 'CTY',  --Ciudad

(SELECT CASE UPPER(prov.PO_DESCRI)  --Pa�s
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
			
				
									
			END) 
	   AS 'CRY' ,

cc.CLC_TELEFO       as 'TEL',  --Tel�fono 
''                  as 'FAX',  --Fax
'2'                 as 'BPAADDFLG', --Por defecto 
''                  as 'R',
(SELECT CASE UPPER(prov.PO_DESCRI)  --Pa�s
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
			
				
									
			END) 
	   AS 'CRY' ,
''                  as 'BIDNUM', ---Consultar que es 
''                  as 'PAB1',  --Domiciliaci�n �?
c.CL_DIRECC         as 'BPAADD', --Direcci�n
''                  as 'C',
''                  as 'CCNCRM', --C�digo de contrato
'SE�OR'             as 'CNTTTL',  --Trato
PARSENAME(REPLACE(CLC_NOMBRE,' ','.'),2) AS CNTFNA,    --Nombre 
PARSENAME(REPLACE(CLC_NOMBRE,' ','.'),1) AS CNTLNA,    --Apellidos 
cc.CLC_TELEFO       as 'TEL' ,      --Tel�fono
 CASE (CC.CLC_TIPO)         --Funci�n
	   WHEN  'Gerente de Compras' THEN '4'
	   WHEN  'Gerente de Ventas'  THEN '2'
	   WHEN  'Gerente de General' THEN '1'
	   WHEN  'Servicio T�cnico'   THEN '11'
	   WHEN  'Pagos'              THEN '11'
	   WHEN  'Encargado de Pagos' THEN '11'
	   WHEN  'Banco Galicia'      THEN '11'
	   WHEN  'ANIBAL'             THEN '11'
	   WHEN  'Administracion'     THEN '11'
	   WHEN  'Encargado de Cobranzas' THEN '7'
	   WHEN  'pago'               THEN '11'
	   WHEN  'Administraci�n'     THEN '11'
	   WHEN  'Consultas'          THEN '11'
	   WHEN  'Contabilidad y Finanzas' THEN '7'
	   WHEN  'Ventas'             THEN '2'
	   WHEN  'Pago a proveedores' THEN '11'
	   WHEN  'Compras '           THEN '4'
	   WHEN  'Pagos - Compras '   THEN '4'
	   WHEN  'Tesorer�a '         THEN '7'  
	   WHEN  'Banco Patagonia '   THEN '11'
	   WHEN  'Finanzas '          THEN '7'
	        
			END AS 'CNTFNC',
''                  as 'FAX',       --Fax
cc.CLC_EMAIL        as 'WEB'        --E-mail

from CLIENTES c
LEFT JOIN CLIENTES_CONTACTO cc 
on c.CL_CODIGO=cc.CL_CODIGO
LEFT JOIN [Venturi].[dbo].PROVINCIA prov
ON c.PO_CODIGO = prov.PO_CODIGO


