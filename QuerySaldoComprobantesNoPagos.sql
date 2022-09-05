USE Venturi
GO

DECLARE @cliente VARCHAR(20)
DECLARE @fechaInicio VARCHAR(20)
DECLARE @fechaFin VARCHAR(20)

SET @cliente = '-1'  --Colocar -1 para traer todos los clientes, o el codigo del cliente que se desea traer

SET @fechaInicio = '01/01/1900'
SET @fechaFin =    '24/02/2022'


SELECT  * FROM (

  SELECT 
       comp.CL_CODIGO AS 'CODIGO CLIENTE', 
       comp.CL_NOMBRE AS 'NOMBRE CLIENTE',
	   comp.CO_CODIGO + ' ' + comp.CO_SUCURS + '-' + comp.co_numero + '/' + comp.co_tipo AS 'COMPROBANTE',  
	   CONVERT(VARCHAR, comp.co_fecha, 103)   AS 'FECHA', 
	   CONVERT(VARCHAR, comp.co_fecven, 103)  AS 'FECHA VENCIMIENTO', 
	   comp.co_totcom AS 'IMPORTE'

  FROM COMPROBANTES comp INNER JOIN CLIENTES cli
  ON comp.CL_CODIGO = cli.CL_CODIGO
  WHERE 
        comp.CL_CODIGO =	
	      			( 
	      				CASE @cliente
	      					WHEN '-1' THEN cli.CL_CODIGO
	      					ELSE @cliente
	      				END
	      			)
        AND comp.CO_FECHA >= @fechaInicio 
        AND comp.CO_FECHA <= @fechaFin 
        AND comp.CO_CODIGO IN( 'ANT','FAC', 'FAR', 'NCR', 'NDE' ) 
        AND comp.CO_FECANU IS NULL                                   --and CO_NUMERO not in ('00000048', '00002077')
        AND NOT EXISTS 
   (                                        
	SELECT compPag.*
	FROM COMP_PAG compPag
	WHERE 
	      compPag.CO_TIPO = comp.CO_TIPO AND
	      compPag.CO_CODIGO = comp.CO_CODIGO AND
	      compPag.CO_SUCURS = comp.CO_SUCURS AND
	      compPag.CO_NUMERO = comp.CO_NUMERO
    )
   AND NOT EXISTS 
   (
	SELECT 
	      C.CO_CODIGO,
	      C.CO_SUCURS, 
	      C.CO_NUMERO, 
	      C.CO_TIPO, 
	      C.CO_FECHA, 
	      C.CO_FECVEN , 
	      D.COD_IMPORT 
	FROM 
	COMP_DET D,COMPROBANTES C 
	WHERE 
	     D.CO_TIPO = C.CO_TIPO AND
	     D.CO_CODIGO = C.CO_CODIGO AND
	     D.CO_SUCURS = C.CO_SUCURS AND
	     D.CO_NUMERO = C.CO_NUMERO AND
	     COR_TIPO = comp.CO_TIPO  AND
	     COR_CODIGO = comp.CO_CODIGO AND
	     COR_SUCURS = comp.CO_SUCURS AND
	     COR_NUMERO = comp.CO_NUMERO AND
	     C.CO_FECANU IS NULL AND
	     C.CO_CODIGO IN('REC','REB','IMP') 
   )

UNION ALL

SELECT 
   comp.CL_CODIGO AS 'CODIGO CLIENTE',
   comp.CL_NOMBRE AS 'NOMBRE CLIENTE',
   comp.CO_CODIGO + ' ' + comp.CO_SUCURS + '-' + comp.co_numero + '/' + comp.co_tipo AS 'COMPROBANTE',  
   CONVERT(VARCHAR, comp.co_fecha, 103) AS 'FECHA', 
   CONVERT(VARCHAR, comp.co_fecven, 103)  AS 'FECHA VENCIMIENTO',
	(comp.co_totcom - (SELECT SUM(D.COD_IMPORT)
					   FROM COMP_DET D, COMPROBANTES C 
	                   WHERE 
					      D.CO_TIPO = C.CO_TIPO AND
					      D.CO_CODIGO = C.CO_CODIGO AND
					      D.CO_SUCURS = C.CO_SUCURS AND 
					      D.CO_NUMERO = C.CO_NUMERO AND
					      COR_TIPO = comp.CO_TIPO  AND 
					      COR_CODIGO = comp.CO_CODIGO AND 
					      COR_SUCURS = comp.CO_SUCURS AND
					      COR_NUMERO = comp.CO_NUMERO AND C.CO_FECANU IS NULL AND
	                      C.CO_CODIGO IN('REC','REB','IMP'))) AS 'IMPORTE'
                       FROM COMPROBANTES comp INNER JOIN CLIENTES cli
                       ON comp.CL_CODIGO = cli.CL_CODIGO
                       WHERE NOT (
	                               (SELECT SUM(D.COD_IMPORT)
	                                FROM COMP_DET D, COMPROBANTES C 
	                                WHERE 
									    D.CO_TIPO = C.CO_TIPO AND
									    D.CO_CODIGO = C.CO_CODIGO AND
									    D.CO_SUCURS = C.CO_SUCURS AND
									    D.CO_NUMERO = C.CO_NUMERO AND
	                                    COR_TIPO = comp.CO_TIPO  AND
									    COR_CODIGO = comp.CO_CODIGO AND
									    COR_SUCURS = comp.CO_SUCURS AND
									    COR_NUMERO = comp.CO_NUMERO AND
									    C.CO_FECANU IS NULL AND
	                                    C.CO_CODIGO IN('REC','REB','IMP')) > comp.co_totcom
                                  )
    AND comp.CL_CODIGO =	
					( 
						CASE @cliente
							WHEN '-1' THEN cli.CL_CODIGO
							ELSE @cliente
						END
					)
    AND comp.CO_FECHA >= @fechaInicio AND
	comp.CO_FECHA <= @fechaFin AND
	comp.CO_CODIGO IN( 'ANT', 'FAC', 'FAR', 'NCR', 'NDE' ) AND
	comp.CO_FECANU IS NULL AND
	(
	    ROUND(comp.co_totcom - (SELECT SUM(D.COD_IMPORT)
	    FROM COMP_DET D, COMPROBANTES C 
	    WHERE 
		   D.CO_TIPO = C.CO_TIPO AND
		   D.CO_CODIGO = C.CO_CODIGO AND
		   D.CO_SUCURS = C.CO_SUCURS AND
		   D.CO_NUMERO = C.CO_NUMERO AND
	       COR_TIPO = comp.CO_TIPO  AND
	       COR_CODIGO = comp.CO_CODIGO AND
	       COR_SUCURS = comp.CO_SUCURS AND
	       COR_NUMERO = comp.CO_NUMERO AND
	       C.CO_FECANU IS NULL AND
	       C.CO_CODIGO IN('REC','REB','IMP')),0) <> 0 
 )
) 
DATOS
ORDER BY DATOS.[CODIGO CLIENTE] ASC