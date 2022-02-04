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

 select DISTINCT 

			'B'                 as 'INDICADOR_B',
			LEFT(p.PR_CODIGO,15)as 'BPRNUM',            --Código de tercero
			LEFT(p.PR_NOMBRE,35)as 'BPRNAM',            --Razón social (Verficar que sea la misma que el nombre)
			LEFT(p.PR_NOMBRE,10)as 'BPRSHO',            --Descripción corta --Verifar 
			LEFT(p.PR_CODIGO,10)as 'BPRLOG',            --Sigla
			LEFT('ARS',3)       as 'CUR',               -- Divisa
			(SELECT CASE UPPER(LEFT (prov.PO_DESCRI,3))         --País
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
		                    Else '' 
							END) AS 'CRY',
	   
			LEFT('SPA',3)	     AS 'LAN',                   --Idioma

			(CASE LEFT(p.PR_CUIT,20)                                  --N.I.F
						WHEN '' THEN ''
						ELSE p.PR_CUIT
					END)
				   AS 'CRN',
	   
			LEFT(p.PR_IBR,15)         as 'XX12IIBB',          --Nro.Ing.Brutos
			LEFT('',20)      as 'DOCTYP',            --Tipo de documento 
			SUBSTRING(P.PR_CUIT,3,8)  as 'XX12DOCNUM',        --Nro.documento
			LEFT(p.PR_CUIT,11)        as 'XX12NIF',           --Nro.Cuit

            'A'                       as 'INDICADOR_A',
		    'PRI'                     as 'BPAADD',           --Dirección
			'PRINCIPAL'               as 'BPADES',           --Descripción
			LEFT(p.PR_DIRECC,50)      as '[BPAADDLIG(0)]',   --Línea de dirección
			''                        as '[BPAADDLIG(1)]',   --Línea de dirección
			''                        as '[BPAADDLIG(2)]',   --Línea de dirección
			left(p.PR_CODPOS,10)      as 'POSCOD',           --Código postal 


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

			LEFT(p.PR_LOCALI,40)        as 'CTY',                   --Ciudad

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
			               else ''
			               END)   AS 'B_CRY' ,
				 

			/*(select stuff ((select ' / ' + clientesContactos.CLC_TELEFO 
			from CLIENTES_CONTACTO clientesContactos 
			where clientesContactos.CL_CODIGO = c.CL_CODIGO
			for xml path('')), 1,1,''))	*/
							
			LEFT('',20)		     as 'TEL',
		    LEFT('',20)          as 'FAX',                   --Fax
			'2'                  as 'BPAADDFLG',             --Por defecto 
           /* 'R'                  as 'INDICADOR_R',
			(SELECT CASE UPPER(LEFT(prov.PO_DESCRI,10))               --País
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
			LEFT('',15)         as 'CCNCRM',                      --Código de contrato
			'SEÑOR'             as 'CNTTTL',                      --Trato
	   	    '' AS CNTFNA,
			''AS CNTLNA,
		  
		  /*PARSENAME(REPLACE((LEFT(CLC_NOMBRE,20)),' ','.'),2)*/     --Nombre 
          /*PARSENAME(REPLACE((LEFT(CLC_NOMBRE,35)),' ','.'),1) */    --Apellidos
	  --  LEFT(cc.CLC_TELEFO,20)	AS 'C_TEL', 

			/* CASE (CC.CLC_TIPO)                                   --Función
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
	               END */''AS 'CNTFNC',
			LEFT('',20)              as 'C_FAX',                             --Fax
			LEFT(p.PR_EMAIL,80)    as 'WEB'                                --E-mail

  from  [VenturiFabrica].[dbo].PROVEEDORES p
  LEFT JOIN [Venturi].[dbo].PROVINCIA prov
  ON P.PO_CODIGO = prov.PO_CODIGO
  WHERE P.PR_CODIGO IN( 
'0B145','0H059','0A259','0A264','0A433','0A220','0A242','0A267','0A284','0A321','0A377','0A381','0A021','0A040','0','0T005','0C165','0C185','0C266'
	)


		DECLARE @TMTABLE_PROV TABLE
		(
		Codprov VARCHAR(max) NOT NULL,
		Sigla VARCHAR(max) NOT NULL
		)
	
	    insert into @TMTABLE_PROV VALUES   ('PBA-0002', '0B145')
		insert into @TMTABLE_PROV VALUES   ('PBA-0007', '0H059')
		insert into @TMTABLE_PROV VALUES   ('E00001',	 '0A259')
		insert into @TMTABLE_PROV VALUES   ('E00002',	 '0A264')
		insert into @TMTABLE_PROV VALUES   ('E00003',	 '0A433')
		insert into @TMTABLE_PROV VALUES   ('E00004',	 '0A220')
		insert into @TMTABLE_PROV VALUES   ('E00005',	 '0A242')
		insert into @TMTABLE_PROV VALUES   ('E00008',	 '0A267')
		insert into @TMTABLE_PROV VALUES   ('E00011',	 '0A284')
		insert into @TMTABLE_PROV VALUES   ('E00014',	 '0A321')
		insert into @TMTABLE_PROV VALUES   ('E00026',	 '0A377')
		insert into @TMTABLE_PROV VALUES   ('E00029',	 '0A381')
		insert into @TMTABLE_PROV VALUES   ('PGA-0001', '0A021')
		insert into @TMTABLE_PROV VALUES   ('PGA-0002', '0A040')
		insert into @TMTABLE_PROV VALUES   ('PGA-0008', '0')
		insert into @TMTABLE_PROV VALUES   ('PGA-0016', '0T005')
		insert into @TMTABLE_PROV VALUES   ('N00024',	 '0C165')
		insert into @TMTABLE_PROV VALUES   ('N00025',	 '0C185')
		insert into @TMTABLE_PROV VALUES   ('N00026',	 '0C266')
	

	
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

	DECLARE @Codprov NVARCHAR(MAX)
	DECLARE @sigla NVARCHAR(MAX) 

	SET @Codprov=''
	SET @sigla=''


	DECLARE TERCEROS CURSOR 
		FOR
		SELECT *
		FROM @TMTABLE_PROV

	OPEN TERCEROS
		FETCH TERCEROS INTO  @Codprov,@sigla

		WHILE(@@FETCH_STATUS=0)
		BEGIN

		INSERT INTO ##TMPGRID
			SELECT distinct 
			      TT.INDICADOR_A,TC.Codprov,TT.BPRNAM,TT.BPRSHO,TT.BPRLOG,TT.CUR,TT.CRY,TT.LAN,TT.CRN,TT.XX12IIBB,TT.DOCTYP,TT.XX12DOCNUM,TT.XX12NIF
            FROM @TMPTABLE_TERCEROS AS TT, @TMTABLE_PROV AS TC
			WHERE TT.BPRNUM=TC.Sigla and TC.Codprov=@Codprov

			
		INSERT INTO ##TMPGRID
		    SELECT distinct 
				   TT.INDICADOR_B, TT.BPAADD, TT.BPADES, TT.[BPAADDLIG(0)],TT.[BPAADDLIG(1)],TT.[BPAADDLIG(2)],TT.POSCOD,TT.SAT,TT.CTY,TT.B_CRY,TT.TEL,
				   TT.FAX,TT.BPAADDFLG
		    FROM @TMPTABLE_TERCEROS AS  TT,@TMTABLE_PROV  AS TC
		    WHERE TT.BPRNUM=TC.Sigla and TC.Codprov=@Codprov


			/*INSERT INTO ##TMPGRID
			SELECT distinct 
			     TT.INDICADOR_R,TT.R_CRY,TT.BIDNUM,TT.PAB1,TT.BPAADD,'','','','','','','',''
			FROM @TMPTABLE_TERCEROS AS  TT,@TMTABLE_CUSTOMER  AS TC
            WHERE TT.BPRNUM=TC.Sigla and TC.CodCliente=@CodCliente*/

			INSERT INTO ##TMPGRID
			SELECT distinct 
			    TT.INDICADOR_C,TT.CCNCRM,TT.CNTTTL,TT.CNTFNA,TT.CNTLNA,TT.CNTFNC,TT.C_FAX,TT.WEB,'','','','',''
			FROM @TMPTABLE_TERCEROS AS  TT,@TMTABLE_PROV  AS TC
			WHERE TT.BPRNUM=TC.Sigla and TC.Codprov=@Codprov
			FETCH TERCEROS INTO @Codprov,@sigla
	
		END
	
	CLOSE TERCEROS

	DEALLOCATE TERCEROS
	
	SELECT tmpGrid.Dato1,ISNULL(tmpGrid.Dato2,''),ISNULL(tmpGrid.Dato3,''),ISNULL(tmpGrid.Dato4,'SD'),ISNULL(tmpGrid.Dato5,'SD'),
	ISNULL(tmpGrid.Dato6,''),ISNULL(tmpGrid.Dato7,''),ISNULL(tmpGrid.Dato8,''),ISNULL(tmpGrid.Dato9,''),ISNULL(tmpGrid.Dato10,''),
	ISNULL(tmpGrid.Dato11,''),ISNULL(tmpGrid.Dato12,''),ISNULL(tmpGrid.Dato13,''),ISNULL(tmpGrid.Dato13,'')
    FROM ##TMPGRID tmpGrid