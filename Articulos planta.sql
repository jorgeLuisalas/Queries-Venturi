/*********************ARTÍCULOS PLANTA********************************/

	select distinct
            'I'                     as 'INDICADOR',
			LEFT(art.AR_CODIGO,20)  as 'ITMREF',        --Articulos  ,Dato Obligatorio
			LEFT (SU_CODIGO,5)   as 'STOFCY',        --Planta Stock ,Dato Obligatorio
			'D'                     as 'ABCCLS',        --Categoria ABCD
			'3'                     as 'CUNCOD',        --Modo inventario,Dato Obligatorio
			'1'                     as 'STOCOD',        --Modo salida Stock,Dato Obligatorio
			'1'                     as 'QUAFLG',        --Sujeto a control ,Dato Obligatorio
			LEFT('',8)              as 'QLYCRD',        --Ficha técnica
			''                      as 'PCKFLG',        --Empaquetado 
			''                      as 'PCKSTKFLG',     --Detalle de stock
			''                      as 'PCK',           --Embalaje
			LEFT('',5)              as 'PCKCAP' ,       --Capacidad de embalaje 
			LEFT(st.ST_UBICAC,5 )   as 'DEFLOCTYP(0)',  --Tipo de ubicación por defecto
			LEFT('',5)              as 'DEFLOCTYP(1)',  --Tipo de ubicación por defecto
			LEFT('',5)              as 'DEFLOCTYP(2)',  --Tipo de ubicación por defecto
			LEFT('',5)              as 'DEFLOCTYP(3)',  --Tipo de ubicación por defecto
			LEFT('',5)              as 'DEFLOCTYP(4)',  --Tipo de ubicación por defecto
			LEFT('',10)             as 'DEFLOC(0)',     --Ubicaciones por defecto 
			LEFT('',10)             as 'DEFLOC(1)',     --Ubicaciones por defecto 
			LEFT('',10)             as 'DEFLOC(2)',     --Ubicaciones por defecto 
			LEFT('',10)             as 'DEFLOC(3)',     --Ubicaciones por defecto
			LEFT('',10)             as 'DEFLOC(4)',     --Ubicaciones por defecto 
			LEFT('',5)              as 'PLANNER' ,      --Planner
			LEFT('',5)              as 'BUY',           --Comprador   
			LEFT('',5)              as 'OFS',           --Plazo reaprov
			LEFT('',5)              as 'PRPLTI',        --Plazo fabricación 
			''                      as 'REOMGTCOD',     --Modo de reaprovisionamiento 
			LEFT('',3)              as 'REOPER',        --Periodicidad reaprov
			LEFT('',3)              as 'REOPOL',        --Política reaprov
			''                      as 'REOCOD',        --Tipo sugerencia 
			LEFT('',4)              as 'DAYCOV',        --Cobertura 
			LEFT('',4)              as 'Horizonte Solicitud', --Horizonte de solicitud
			LEFT(st.ST_MINIMO,15)   as 'SAFSTO',              --Stock de seguridad
			LEFT(st.ST_MAXIMO,15)   as 'MAXSTO',              --Límite de Reaprov
			LEFT('',15 )            as 'REOMINQTY',           --Lote económico 
			LEFT('',15)             as 'Lote Técnico',        --Lote Técnico
			LEFT('',3)              as 'VLTCOD'               --Método valorización 


	from ARTICULO art 
	left join SUCURSAL suc on 
	art.AR_CODIGO =suc.SU_CODIGO 
	inner join STOCK st on
	art.AR_CODIGO=st.AR_CODIGO 
	
	 


	


 --use VenturiFabrica
 --go
 --select*
 --from ARTICULO
 --select *
 --from CONTROLSTOCK_DET
 --select*
 --from STOCK