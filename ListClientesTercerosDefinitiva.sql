use Venturi
go



DECLARE  @TMPTABLE_TERCEROS TABLE
(
		   INDICADOR_A     VARCHAR (max) NULL, --1
		   BPRNUM          VARCHAR (max) NULL, --2
		   BPRNAM          VARCHAR (max) NULL, --3
		   BPRSHO          VARCHAR (max) NULL, --4
		   BPRLOG          VARCHAR (max) NULL, --5
		   CUR             VARCHAR (max) NULL, --6
		   CRY             VARCHAR (max) NULL, --7
		   LAN             VARCHAR (max) NULL, --8
		   CRN             VARCHAR (max) NULL, --9
		   XX12IIBB        VARCHAR (max) NULL, --10
		   DOCTYP          VARCHAR (max) NULL, --11
		   XX12DOCNUM      VARCHAR (max) NULL, --12
		   XX12NIF         VARCHAR (max) NULL, --13

		   INDICADOR_B     VARCHAR (max) NULL,--14
		   BPAADD          VARCHAR (max) NULL,--15
		   BPADES		   VARCHAR (max) NULL,--16
		   [BPAADDLIG(0)]  VARCHAR (max) NULL,--17
		   [BPAADDLIG(1)]  VARCHAR (max) NULL,--18
		   [BPAADDLIG(2)]  VARCHAR (max) NULL,--19
		   POSCOD          VARCHAR (max) NULL,--20
		   SAT             VARCHAR (max) NULL,--21
		   CTY		       VARCHAR (max) NULL,--22
		   B_CRY           VARCHAR (max) NULL,--23
		   TEL             VARCHAR (max) NULL,--24
		   FAX             VARCHAR (max) NULL,--25
		   BPAADDFLG       VARCHAR (max) NULL,--26


		   /*INDICADOR_R     VARCHAR (max) NULL,--27
		   R_CRY           VARCHAR (max) NULL,--28
		   BIDNUM          VARCHAR (max) NULL,--29
		   PAB1            VARCHAR (max) NULL,--30
		   R_BPAADD        VARCHAR (max) NULL,--31*/


		   INDICADOR_C     VARCHAR (max) NULL,--32
		   CCNCRM          VARCHAR (max) NULL,--33
		   CNTTTL          VARCHAR (max) NULL,--34
		   CNTFNA          VARCHAR (max) NULL,--35
		   CNTLNA          VARCHAR (max) NULL,--36
		   --C_TEL           VARCHAR (max) NULL,--37
		   CNTFNC          VARCHAR (max) NULL,--38
		   C_FAX           VARCHAR (max) NULL,--39
		   WEB             VARCHAR (max) NULL --40
		   
 )

 INSERT INTO @TMPTABLE_TERCEROS
 
 select 

			'B'                 as 'INDICADOR_B',
			LEFT(c.CL_CODIGO,15)as 'BPRNUM',					--Código de tercero
			LEFT(c.CL_NOMBRE,35)as 'BPRNAM',					--Razón social (Verficar que sea la misma que el nombre)
			LEFT(c.CL_NOMBRE,10)as 'BPRSHO',					--Descripción corta --Verifar 
			LEFT(c.CL_CODIGO,10)as 'BPRLOG',					--Sigla
			LEFT('ARS',3)       as 'CUR',						--Divisa
			(SELECT CASE UPPER(LEFT (prov.PO_DESCRI,3))			--País
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
		                  
							END) AS 'CRY',
	   
			LEFT('SPA',3)	     AS 'LAN',                   --Idioma

			(CASE LEFT(C.CL_CUIT,20)                         --N.I.F
				  WHEN '' THEN ''
				  ELSE C.CL_CUIT
			 END) AS 'CRN',
	   
			LEFT(c.CL_IBR,15)         as 'XX12IIBB',          --Nro.Ing.Brutos
			LEFT(c.CL_TIPDOC,20)      as 'DOCTYP',            --Tipo de documento 
			SUBSTRING(c.CL_CUIT,3,8)  as 'XX12DOCNUM',        --Nro.documento
			LEFT(c.CL_CUIT,11)        as 'XX12NIF',           --Nro.Cuit

            'A'                       as 'INDICADOR_A',
		    'PRI'                     as 'BPAADD',            --Dirección
			'PRINCIPAL'               as 'BPADES',            --Descripción
			 CASE UPPER (LEFT (prov.PO_DESCRI,35))            --Provincia
			
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
			               ELSE 'AR' end  as '[BPAADDLIG(0)]',   --Línea de dirección
			
			LEFT(c.CL_DIRECC,50)          as '[BPAADDLIG(1)]',   --Línea de dirección
			''                            as '[BPAADDLIG(2)]',   --Línea de dirección
			LEFT(c.CL_CODPOS,10)          as 'POSCOD',           --Código postal 


			CASE UPPER (LEFT (prov.PO_DESCRI,35))            --Provincia
			WHEN 'FORMOSA' THEN 'FMA'
			WHEN 'JUJUY' THEN 'JJY'
			WHEN 'LA PAMPA' THEN 'LPA'
			WHEN 'LA RIOJA' THEN 'LRJ'
			WHEN 'MENDOZA' THEN 'MDZ'
			WHEN 'MISIONES' THEN 'MIS'
			WHEN 'NEUQUEN' THEN 'NQN'
			WHEN 'RIO NEGRO' THEN 'RNG'
			WHEN 'BUENOS AIRES' THEN 'BUE'
			WHEN 'CAPITAL FEDERAL' THEN 'CFE'
			WHEN 'CATAMARCA' THEN 'CTC'
			WHEN 'CHACO' THEN 'CHA'
			WHEN 'CHUBUT' THEN 'CHU'
			WHEN 'CORDOBA' THEN 'CBA'
			WHEN 'CORRIENTES' THEN 'COR'
			WHEN 'ENTRE RIOS' THEN 'ERI'
			WHEN 'SALTA' THEN 'SLA'
			WHEN 'SAN JUAN' THEN 'SJN'
			WHEN 'SAN LUIS' THEN 'SLS'
			WHEN 'SANTA CRUZ' THEN 'SCZ'
			WHEN 'SANTA FE' THEN 'SFE'
			WHEN 'SANTIAGO DEL ESTERO' THEN 'SDE'
			WHEN 'TUCUMAN' THEN 'TUC'
			WHEN 'TIERRA DEL FUEGO' THEN 'TDF'
			ELSE ''
			END AS 'SAT',

			LEFT(c.CL_LOCALI,40)        as 'CTY',                     --Ciudad

			(SELECT CASE UPPER (LEFT(prov.PO_DESCRI,10))              --País
							
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
			               
			               END)   AS 'B_CRY' ,
				 

		
							
			LEFT('',20)		     as 'TEL',
		    LEFT('',20)          as 'FAX',                   --Fax
			'2'                  as 'BPAADDFLG',             --Por defecto 
           /* 'R'                  as 'INDICADOR_R',
			(SELECT CASE UPPER(LEFT(prov.PO_DESCRI,10))      --País
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
			                ELSE ''
							END) AS 'R_CRY' ,
			LEFT('',30)         as 'BIDNUM',                     --Consultar que es 
			LEFT('',35)         as 'PAB1',                       --Domiciliación ¿?
			LEFT(c.CL_DIRECC,5) as 'R_BPAADD',                   --Dirección*/

			
		  'C'                 as 'INDICADOR_C',
		  RIGHT(100000 + Row_number () Over(order by (select C.CL_CODIGO)ASC),5) AS 'CCNCRM',   --Código de contrato//se agrego un código de contacto 
		  'SEÑOR'             as 'CNTTTL',                                    --Trato
	   	  PARSENAME( REPLACE((LEFT(CLC_NOMBRE,20)),' ','.'),2) AS CNTFNA,    --Nombre 
          PARSENAME( REPLACE((LEFT(CLC_NOMBRE,35)),' ','.'),1) AS CNTLNA,    --Apellidos
		--LEFT(cc.CLC_TELEFO,20)	AS 'C_TEL', 

			 CASE (CC.CLC_TIPO)                                   --Función
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
	               END AS 'CNTFNC',
			LEFT('',20)              as 'C_FAX',                             --Fax
			LEFT(cc.CLC_EMAIL,80)    as 'WEB'                                --E-mail

  from CLIENTES c
  LEFT JOIN CLIENTES_CONTACTO cc 
  on c.CL_CODIGO=cc.CL_CODIGO
  LEFT JOIN [Venturi].[dbo].PROVINCIA prov
  ON c.PO_CODIGO = prov.PO_CODIGO
  where c.CL_CODPOS!=''
 
	
	
if OBJECT_ID('tempdb..##TMPGRID') IS NOT NULL
	   DROP TABLE ##TMPGRID


	   CREATE TABLE ##TMPGRID (
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
		Dato13 NVARCHAR(MAX) NULL
		
		
		
	)	

	DECLARE @CodCliente NVARCHAR(MAX)
	DECLARE @sigla NVARCHAR(MAX) 

	SET @CodCliente=''
	SET @sigla=''


	DECLARE TERCEROS CURSOR 
		FOR
		SELECT *
		FROM Venturi..lct

	OPEN TERCEROS
		FETCH TERCEROS INTO  @CodCliente,@sigla

		WHILE(@@FETCH_STATUS=0)
		BEGIN

		INSERT INTO ##TMPGRID
			SELECT distinct 
			      TT.INDICADOR_A,TC.dat1,TT.BPRNAM,TT.BPRSHO,TT.BPRLOG,TT.CUR,'AR',TT.LAN,TT.CRN,TT.XX12IIBB,TT.DOCTYP,TT.XX12DOCNUM,TT.XX12NIF
            FROM @TMPTABLE_TERCEROS AS TT 
			INNER JOIN  Venturi..lct  TC 
			ON TT.BPRNUM=TC.dat2 and TC.dat1=@CodCliente
			 

			
		INSERT INTO ##TMPGRID
		    SELECT distinct 
				   TT.INDICADOR_B, TT.BPAADD, TT.BPADES, TT.[BPAADDLIG(0)],TT.[BPAADDLIG(1)],TT.[BPAADDLIG(2)],TT.POSCOD,TT.SAT,TT.CTY,TT.B_CRY,TT.TEL,
				   TT.FAX,TT.BPAADDFLG
		    FROM @TMPTABLE_TERCEROS AS  TT
			INNER JOIN  Venturi..lct   TC ON 
		    TT.BPRNUM=TC.dat2 and TC.dat1=@CodCliente


			/*INSERT INTO ##TMPGRID
			SELECT distinct 
			     TT.INDICADOR_R,TT.R_CRY,TT.BIDNUM,TT.PAB1,TT.BPAADD,'','','','','','','',''
			FROM @TMPTABLE_TERCEROS AS  TT,@TMTABLE_CUSTOMER  AS TC
            WHERE TT.BPRNUM=TC.Sigla and TC.CodCliente=@CodCliente*/

			INSERT INTO ##TMPGRID
			SELECT distinct 
			    TT.INDICADOR_C,TT.CCNCRM,TT.CNTTTL,'',TT.CNTFNC,TT.C_FAX,TT.WEB,'','','','','',''
			FROM @TMPTABLE_TERCEROS AS  TT
			INNER JOIN  Venturi..lct  TC ON 
			TT.BPRNUM=TC.dat2 and TC.dat1=@CodCliente
			
			FETCH TERCEROS INTO @CodCliente,@sigla
	
		END
	
	CLOSE TERCEROS

	DEALLOCATE TERCEROS
	
	SELECT tmpGrid.Dato1,ISNULL(tmpGrid.Dato2,''),ISNULL(tmpGrid.Dato3,''),ISNULL(tmpGrid.Dato4,'SD'),ISNULL(tmpGrid.Dato5,'SD'),
	ISNULL(tmpGrid.Dato6,''),ISNULL(tmpGrid.Dato7,''),ISNULL(tmpGrid.Dato8,''),ISNULL(tmpGrid.Dato9,''),ISNULL(tmpGrid.Dato10,''),
	ISNULL(tmpGrid.Dato11,''),ISNULL(tmpGrid.Dato12,''),ISNULL(tmpGrid.Dato13,''),ISNULL(tmpGrid.Dato13,'')
    FROM ##TMPGRID tmpGrid

	/***********************************Información de seteo de campos*******************************************/

		/*(select stuff ((select ' / ' + clientesContactos.CLC_TELEFO 
			from CLIENTES_CONTACTO clientesContactos 
			where clientesContactos.CL_CODIGO = c.CL_CODIGO
			for xml path('')), 1,1,''))	 */