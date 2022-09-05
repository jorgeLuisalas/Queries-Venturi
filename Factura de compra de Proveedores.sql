

 declare   @tmpCompra table(

 E            nvarchar(max),
 FCY          nvarchar(max),
 PIVTYP       nvarchar(max),
 NUM          nvarchar(max),
 ACCDAT       nvarchar(max),
 BPR		  nvarchar(max),
 BPRSAC		  nvarchar(max),
 CUR		  nvarchar(max),
 RATMLT		  nvarchar(max),
 PAZ		  nvarchar(max),
 BPRVCR		  nvarchar(max),
 BPRDAT		  date,
 BPRPAY		  nvarchar(max),
 PTE		  nvarchar(max),
 STRDUDDAT	  date,
 INVREF		  nvarchar(max),
 DES0		  nvarchar(max),
 DES1		  nvarchar(max),
 DES2		  nvarchar(max),
 DEP		  nvarchar(max),
 SAT		  nvarchar(max),
 TOTLINAMT	  nvarchar(max),
 TOTTAXAMT	  nvarchar(max),
 E71		  nvarchar(max),
 E72		  nvarchar(max),
 E81		  nvarchar(max),
 E82		  nvarchar(max),
 
 V            nvarchar(max),
 XTBDOCAFIP   nvarchar(max),
 XTBDOC       nvarchar(max),
 XTBLET       nvarchar(max),
 XWSSTA		  nvarchar(max),
 XX12BPANAM	  nvarchar(max),
 XX12DOCNUM	  nvarchar(max),
 XX12DOCTYP	  nvarchar(max),
 XX12IIBB	  nvarchar(max),
 XX12NIF	  nvarchar(max),
 XX12SITIVA	  nvarchar(max),
 XSHPNUM	  nvarchar(max),
 XSEQ		  nvarchar(max),
 XCAICOD	  nvarchar(max),
 XBRA		  nvarchar(max),
 XADXNUM	  nvarchar(max),
 XDATEND	  nvarchar(max),
 
 L            nvarchar(max),
 TYPORI       nvarchar(max),
 NUMORI		  nvarchar(max),
 LINORI		  nvarchar(max),
 SEQORI		  nvarchar(max),
 ITMREF		  nvarchar(max),
 ITMDES		  nvarchar(max),
 UOM		  nvarchar(max),
 QTYUOM		  nvarchar(max),
 NETPRI		  nvarchar(max),
 AMTNOTLIN	  nvarchar(max),
 DISCRGVAL1	  nvarchar(max),
 DISCRGVAL2	  nvarchar(max),
 DISCRGVAL3	  nvarchar(max),
 VAT0		  nvarchar(max),
 VAT1		  nvarchar(max),
 VAT2		  nvarchar(max),
 PJT		  nvarchar(max),
 L91		  nvarchar(max),
 L92		  nvarchar(max)

)

insert into @tmpCompra
  
 select TOP 50
        'E'              as 'E',            --Indicador E
        '0001'     as 'FCY',          --Planta
        'FAMI'   as 'PIVTYP',       --Tipo de factura
        'VMI'+'-'+ co.CP_CODIGO +s.SU_CODIGO+CO.CP_NUMERO as 'NUM',          --Número de asiento  --- 
        '20220731'      as 'ACCDAT',       --Fecha contable
        t.sigla         as 'BPR',          --Tercero
        'PRVC'      as 'BPRSAC',       --Cuenta Control
        'ARS'           as 'CUR',          --Divisa
        '1'             as 'RATMLT',       --Cambio multiplicador
        '4'             as 'PAZ',          --Autorización de pago
        'VMI'+'-'+  co.CP_CODIGO+s.SU_CODIGO+CO.CP_NUMERO      as 'BPRVCR',       --Documento de origen
        co.CP_FECEMI    as 'BPRDAT',         --Fecha de origen
        t.codigoProveedor         as 'BPRPAY',         --Tercero pagador
        (CASE (LEFT(C.CVE_CODIGO,15)) 
			WHEN '001' THEN '001'
			WHEN '004' THEN '002'
			WHEN '008' THEN '004'
			WHEN '014' THEN '005'
			WHEN ''    THEN '001'
			else '001'
		END)            as 'PTE',          --Condición de pago

        case co.CP_FECVEN
		when ''  then  co.CP_FECEMI
		else co.CP_FECVEN end as 'STRDUDDAT',       --Inicio de vencimiento 

	

        'Prueba de importación'    as 'INVREF',     --Referencia interna 
        ''              as 'DES0',         --Comentario
        ''              as 'DES1',		   --Comentario
        ''              as 'DES2',         --Comentario
        ''              as 'DEP',          --Descuentos/Recargos
       CASE UPPER(prov.PO_DESCRI)
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
			END         as 'SAT',          --Provincia
        co.CP_NETO      as 'TOTLINAMT',    --Total AI líneas
        co.CP_NETO-co.CP_TOTAL             as 'TOTTAXAMT',    --Total impuestos
        ''              as 'E71',          --Texto cabecera
        ''              as 'E72',		   --Texto cabecera
        ''              as 'E81',          --Texto pie 
        ''              as 'E82',          --Texto pie
        /***************************************************************************************/   
        'V'  as 'V',            --Indicador V    
         case co.CP_CODIGO+co.CP_TIPO
		       when 'FACA' then '001'
			   when 'FACB' then '006'
			   when 'FACC' then '011'
			   when 'NDEA' then '002'
			   when 'NDEB' then '007'
			   when 'NDEC' then '012'
		 end as 'XTBDOCAFIP',   --Tipo de comprobante AFIP	 case 		VERIFICAR CUAL LE PASAMOS
        
		co.CP_CODIGO  as 'XTBDOC',       --Tipo de comprobante
        ''   as 'XTBLET',       --Letra
        '1'  as 'XWSSTA',      --Estado
        t.DescripcionCorta  as 'XX12BPANAM',   --Razón social
        ''  as 'XX12DOCNUM',   --Número de documento
        ''  as 'XX12DOCTYP',   --Tipo de documento 
        ''  as 'XX12IIBB',	   --Número de ingreso brutos
        ''  as 'XX12NIF',	   --Número de CUIT/CUIL
        ''  as 'XX12SITIVA',   --Situación IVA
        ''  as 'XSHPNUM',	   --Conocimiento embarque
        co.CP_NUMERO  as 'XSEQ',		   --Secuencia
        ''  as 'XCAICOD',	   --CAI/CAE código 
        s.SU_CODIGO  as 'XBRA',		   --Sucursal
        co.CP_CODIGO+s.SU_CODIGO+CO.CP_NUMERO  as 'XADXNUM',	   --Número fiscal
        ''  as 'XDATEND',	   --Fecha hasta
        /************************************************************************************/   
        'L'	as 'L',            --Indicador L 
        '5'  as 'TYPORI',	   --Origen de línea
        ''  as 'NUMORI',	   --Número de línea
        ''  as 'LINORI',	   --Línea de origen
        ''  as 'SEQORI',	   --Secuencia origen
        ''  as 'ITMREF',	   --Artículo
        ''  as 'ITMDES',	   --Descripción
         CASE a.UM_CODIGO
			WHEN 'MT' THEN 'M'
			WHEN 'UN' THEN 'UN'
			WHEN ''   THEN 'UN'
 			ELSE 'KG'
		   END    as  'UOM',		   --Unidad facturación
        '1' as 'QTYUOM',	   --Ctd facturada 
         '' as 'NETPRI',	   --Precio neto
        ''  as 'AMTNOTLIN',	   --Importe línea AI
        ''  as 'DISCRGVAL1',   --Valor 1 dto/gasto
        ''  as 'DISCRGVAL2',   --Valor 2 dto/gasto
        ''  as 'DISCRGVAL3',   --Valor 3 dto/gasto
        'IVA21'  as 'VAT0',	   --Impuesto
        ''  as 'VAT1',		   --Impuesto
        ''  as 'VAT2',		   --Impuesto
        ''  as 'PJT',		   --Proyecto
        ''  as 'L91',		   --Texto Linea
        ''  as 'L92'		   --Texto Linea

	from Venturi..SUCURSAL s
	left join VenturiFabrica..COMPPRO co
	on co.CP_SUCURS=s.SU_CODIGO
	left join  t_prov_Dat t 
	on t.sigla=co.PR_CODIGO
	left join PROVINCIA prov
	on prov.PO_CODIGO=s.PO_CODIGO
	left join CLIENTES c
	on co.CP_CODIGO=t.codigoProveedor
	left join ARTICULO A
	on A.MO_CODIGO=c.MO_CODIGO
	where co.CP_CODIGO in('FAC','FAR','NDE','NCR')


	



	/*left join COMPROBANTES co 
	on co.CO_SUCURS =s.SU_CODIGO
	left join CLIENTES c 
	on co.CL_CODIGO=c.CL_CODIGO
	inner join t_prov_Dat t 
	on t.sigla=c.CL_CODIGO
    inner join PROVINCIA prov
	on prov.PO_CODIGO=s.PO_CODIGO
	left join ARTICULO A
	on A.MO_CODIGO=c.MO_CODIGO
	where co.CO_CODIGO in('FAC','FAR','NDE')*/
	
	    IF OBJECT_ID('tempdb..##TMP_GRID') IS NOT NULL
			DROP TABLE ##TMP_GRID
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
	Dato27 NVARCHAR(MAX) NULL
	

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

 DECLARE FACTURA CURSOR FAST_FORWARD
	FOR
       SELECT DISTINCT *
			FROM t_prov_Dat 
			

		OPEN FACTURA

	FETCH   FACTURA INTO @categoria, @codigoProveedor, @sigla,@DescripcionCorta,@familiaEstadistica,@familiaEstadistica1,@familiaEstadistica2,@familiaEstadistica3

	WHILE(@@FETCH_STATUS=0)
	BEGIN

	INSERT INTO ##TMP_GRID
	SELECT  DISTINCT
	tc.E,tc.FCY,tc.PIVTYP,tc.NUM,tc.ACCDAT,tc.BPRPAY/*campo repetido de proveedor*/,tc.BPRSAC,tc.CUR,tc.RATMLT,tc.PAZ,tc.BPRVCR, rtrim(replace (tc.BPRDAT,'-','')),tc.BPRPAY,tc.PTE, rtrim(replace (tc.STRDUDDAT,'-','')),tc.INVREF,tc.DES0,tc.DES1,tc.DES2,tc.DEP,tc.SAT,tc.TOTLINAMT,
	tc.TOTTAXAMT,tc.E71,tc.E72,tc.E81,tc.E82

	FROM @tmpCompra tc,
	 Venturi..t_prov_Dat proveedor
	WHERE tc.BPR = proveedor.sigla and proveedor.codigoProveedor = @codigoProveedor

	


	INSERT INTO ##TMP_GRID
	SELECT  DISTINCT
	tc.V,tc.XTBDOCAFIP,tc.XTBDOC,tc.XTBLET,tc.XWSSTA,tc.XX12BPANAM,tc.XX12DOCNUM,tc.XX12DOCTYP,tc.XX12IIBB,tc.XX12NIF,tc.XX12SITIVA,tc.XSHPNUM,tc.XSEQ,tc.XCAICOD,tc.XBRA,tc.XADXNUM,tc.XDATEND
	,'','','','','','','','','',''
	FROM @tmpCompra tc,
	 Venturi..t_prov_Dat proveedor
	WHERE tc.BPR = proveedor.sigla and proveedor.codigoProveedor = @codigoProveedor  
	

	INSERT INTO ##TMP_GRID
	SELECT  DISTINCT
	tc.L,tc.TYPORI,tc.NUMORI,tc.LINORI,tc.SEQORI,tc.ITMREF,tc.ITMDES,tc.UOM,tc.QTYUOM,tc.NETPRI,tc.AMTNOTLIN,tc.DISCRGVAL1,tc.DISCRGVAL2,tc.DISCRGVAL3,tc.VAT0,tc.VAT1,tc.VAT2,tc.PJT,tc.L91,tc.L92
	,'','','','','','',''
	FROM @tmpCompra tc,
	 Venturi..t_prov_Dat proveedor
	WHERE tc.BPR = proveedor.sigla and proveedor.codigoProveedor = @codigoProveedor  


	  FETCH FACTURA INTO @categoria, @codigoProveedor, @sigla,@DescripcionCorta,@familiaEstadistica,@familiaEstadistica1,@familiaEstadistica2,@familiaEstadistica3
        END
        CLOSE FACTURA
        DEALLOCATE FACTURA
		



		SELECT	isnull(tmpGrid.Dato1,  ''), isnull(tmpGrid.Dato2, ''),  isnull(tmpGrid.Dato3, ''),  isnull(tmpGrid.Dato4, ''),  isnull(tmpGrid.Dato5, ''),
		        isnull(tmpGrid.Dato6,  ''), isnull(tmpGrid.Dato7, ''),  isnull(tmpGrid.Dato8, ''),  isnull(tmpGrid.Dato9, ''),  isnull(tmpGrid.Dato10, ''),
		        isnull(tmpGrid.Dato11, ''), isnull(tmpGrid.Dato12,''),  isnull(tmpGrid.Dato13, ''), isnull(tmpGrid.Dato14, ''), isnull(tmpGrid.Dato15, ''),
		        isnull(tmpGrid.Dato16, ''), isnull(tmpGrid.Dato17,''),  isnull(tmpGrid.Dato18, ''), isnull(tmpGrid.Dato19, ''), isnull(tmpGrid.Dato20, ''),
				isnull(tmpGrid.Dato21, ''), isnull(tmpGrid.Dato22,''),  isnull(tmpGrid.Dato23, ''), isnull(tmpGrid.Dato24, ''), isnull(tmpGrid.Dato25, '')
				,isnull(tmpGrid.Dato26,''), isnull(tmpGrid.Dato27,'')
		FROM	##TMP_GRID tmpGrid




