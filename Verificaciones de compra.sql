Use VenturiFabrica
go 

/*SELECT comppro.*, 
       comppro_cuo.cpc_fecha, 
	   comppro_cuo.cpc_cuota,  
	   comppro_cuo.cpc_import, 
	   comppro_cuo.cpc_imppag
	   
	    FROM comppro_cuo, comppro 

WHERE /*comppro.pr_codigo = '0A404' 
AND  */cpc_feccan IS NULL 
AND comppro.cp_fecanu IS NULL 
AND comppro.pr_codigo = comppro_cuo.pr_codigo 
AND comppro.cp_codigo = comppro_cuo.cp_codigo 
AND comppro.cp_sucurs = comppro_cuo.cp_sucurs 
AND comppro.cp_numero = comppro_cuo.cp_numero 
AND comppro.cp_tipo = comppro_cuo.cp_tipo 
AND comppro.cp_copia = comppro_cuo.cp_copia 
AND comppro.cp_codigo IN ('NCR', 'FAC', 'FAR', 'NDE', 'NCI', 'NDI', 'FRE', 'NDF', 'ANT')  
AND COMPPRO_CUO.CP_AUTORIZ ='S'


ORDER BY comppro.pr_nombre*/



SELECT    DISTINCT comppro.*, 
       ccc.cpc_fecha, 
	   ccc.cpc_cuota,  
	   ccc.cpc_import, 
	   ccc.cpc_imppag
	    
	   
	    FROM comppro_cuo ccc
		INNER JOIN  comppro 
		ON COMPPRO.PR_CODIGO=ccc.PR_CODIGO
        AND cpc_feccan IS NULL 
        AND comppro.cp_fecanu IS NULL 
        AND comppro.cp_codigo = ccc.cp_codigo 
        AND comppro.cp_sucurs = ccc.cp_sucurs 
        AND comppro.cp_numero = ccc.cp_numero 
	    AND comppro.cp_tipo =  ccc.cp_tipo   
        AND comppro.cp_copia = ccc.cp_copia     --verificar tipo de copía que significa??
        AND comppro.cp_codigo IN ('NCR', 'FAC', 'FAR', 'NDE')  
        AND CCC.CP_AUTORIZ ='S'
	

ORDER BY comppro.pr_nombre





--WHERE /*comppro.pr_codigo = '0A404' 
--AND  */cpc_feccan IS NULL 
--AND comppro.cp_fecanu IS NULL 
--AND comppro.pr_codigo = comppro_cuo.pr_codigo 
--AND comppro.cp_codigo = comppro_cuo.cp_codigo 
--AND comppro.cp_sucurs = comppro_cuo.cp_sucurs 
--AND comppro.cp_numero = comppro_cuo.cp_numero 
--AND comppro.cp_tipo = comppro_cuo.cp_tipo 
--AND comppro.cp_copia = comppro_cuo.cp_copia 
--AND comppro.cp_codigo IN ('NCR', 'FAC', 'FAR', 'NDE', 'NCI', 'NDI', 'FRE', 'NDF', 'ANT')  
--AND COMPPRO_CUO.CP_AUTORIZ ='S'


--ORDER BY comppro.pr_nombre


 select DISTINCT top 1000 
                COUNT(COMPPRO.CP_COPIA),
                COMPPRO.CP_COPIA AS COPIA
 FROM COMPPRO 
 GROUP BY CP_COPIA
 ORDER BY COMPPRO.CP_COPIA ASC


 select DISTINCT top 1000
                COUNT  (COMPPRO_CUO.CP_COPIA ),
                COMPPRO_CUO.CP_COPIA AS COPIA
 FROM  COMPPRO_CUO
 GROUP BY CP_COPIA
 ORDER BY COMPPRO_CUO.CP_COPIA ASC