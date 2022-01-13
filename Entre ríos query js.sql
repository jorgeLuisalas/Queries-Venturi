/* Utilizar dirección *IP :172.16.2.53
                      *Password:4961262
					  *Base Venturi
					  *Ejecutar una vez al mes para hacer los cambios de retenciones correspondientes 
					  *Modificar la fecha correspodiente al mes que se quiere realizar la consulta*/

use Venturi
go

declare @Numero varchar(15);
declare @barra varchar(10);
declare @fechaDeInicio varchar(10);
declare @fechaDeFinalizacion varchar(10);





set @Numero = '00000000000000';
set @barra = '     ';

set @fechaDeInicio = '01/12/2021';
set @fechaDeFinalizacion = '31/12/2021';
                

select RIGHT(100000 + Row_number () Over(order by (select comp.CO_FECHA)ASC),5) AS'Número de Renglón',--Número de Renglón 	             
  case comp.CO_CODIGO                                                                                 --tipo de comprobante
		when 'NCR' then  + '102'
		when 'NDE' then  + '002'
		when 'FAC' then  + '001' 
		when 'FAR' then  + '001'
		when 'REC' then  + '003'
		else comp.CO_CODIGO
	   end as 'Tipo de comprobante',
	   comp.CO_TIPO as 'Letra del Comprobante', --Letra de comprobante 
  
    case len(comp.CO_NUMERO+comp.CO_SUCURS)                                --Número de comprobante
		when 12 then comp.CO_SUCURS+comp.CO_NUMERO
		end as 'Número de Comprobante',

  case len(replace(replace(comp.CL_CUIT, '-',''), '.', ''))              --Número de cuit
		when 11 then replace(replace(comp.CL_CUIT, '-',''), '.', '')
		when  9 then '00' + replace(replace(comp.CL_CUIT, '-',''), '.', '')
	   end 'CUIT ',
  case len(convert(varchar, comp.CO_FECHA, 103))                         --Fecha de percepción 
		when 10 then convert(varchar, comp.CO_FECHA, 103)
		when 9 then '0' + convert(varchar, comp.CO_FECHA, 103)
	    end as 'Fecha de Percepción',

CAST(CAST(comp.CO_NETO as numeric (17,6)) as decimal(10,2))as'Monto sujeto a percepción ',--Monto sujeto a percepción 	

  case len(convert (varchar, aliCuota.AIB_PORCEN))  --alicuota 
		when 1 then substring(@Numero, 1, 0) + 
						convert(varchar, aliCuota.AIB_PORCEN) + '.' + 
						substring(@Numero, 1, 2)
		when 2 then substring(@Numero, 1, 0) +
						convert(varchar, aliCuota.AIB_PORCEN) + '.' +
						substring(@Numero, 1, 2)
		when 3 then substring(@Numero, 1, 0) +		
						convert(varchar, aliCuota.AIB_PORCEN) + '.' + 
						substring(@Numero, 1, 2)
		
	   end as 'Alicuota' ,
	   
replace (comp.CO_PERIBR,',','.')+CAST((comp.CO_PERIBR) AS DECIMAL(10,2)) as 'Monto Percibido',             --Monto percibido 

	   '001' as 'Tipo de Régimen de Percepción',                          --Tipo de régimen de percepción
	   '908' as 'Jurisdicción'                                            --Jurisdicción

from COMPROBANTES comp inner join ALICUOTA_INGBRU aliCuota
on comp.AIB_CODIGO = aliCuota.AIB_CODIGO
where /*comp.CO_SUCURSAL = ''and */ comp.CO_CODIGO in ('NCR', 'NDE', 'FAC', 'FAR', 'REC')and comp.CO_SUCURS NOT IN ('0038', '0039', '0040', '0041', '0062')
and comp.CO_FECHA between @fechaDeInicio and @fechaDeFinalizacion
order by comp.CO_FECHA desc
