use Maestros
go

declare @Numero varchar(15);
declare @barra varchar(10);
declare @fechaDeInicio varchar(10);
declare @fechaDeFinalizacion varchar(10);


set @Numero = '00000000000000';
set @barra = '     ';

set @fechaDeInicio = '01/11/2021';
set @fechaDeFinalizacion = '30/11/2021';


SELECT  ROW_NUMBER() OVER(ORDER BY  (SELECT comp.CO_FECHA  )DESC) AS 'Número de Renglón',                    --Número de Renglón 
	   
	  
	   case comp.CO_CODIGO                                                  --tipo de comprobante
		when 'NCR' then @barra + 'C'
		when 'NDE' then @barra + 'D'
		when 'FAC' then @barra + 'F'
		when 'FAR' then @barra + 'F'
		when 'REC' then @barra + 'R'
		else comp.CO_CODIGO
	   end as 'Tipo de comprobante',
	   comp.CO_TIPO as 'Letra del Comprobante',                             --Letra de comprobante 
	   case len(comp.CO_NUMERO)                                             --Número de comprobante
		when 12 then comp.CO_NUMERO
		when 11 then substring(@Numero, 1, 1) + comp.CO_NUMERO
		when 10 then substring(@Numero, 1, 2) + comp.CO_NUMERO
		when 9 then substring(@Numero, 1, 3) + comp.CO_NUMERO
		when 8 then substring(@Numero, 1, 4) + comp.CO_NUMERO
		when 7 then substring(@Numero, 1, 5) + comp.CO_NUMERO
		when 6 then substring(@Numero, 1, 6) + comp.CO_NUMERO
	   end as 'Número de Comprobante',
	   case len(replace(replace(comp.CL_CUIT, '-',''), '.', ''))              --Número de cuit
		when 11 then replace(replace(comp.CL_CUIT, '-',''), '.', '')
		when  9 then '00' + replace(replace(comp.CL_CUIT, '-',''), '.', '')
	   end 'CUIT ',
	   case len(convert(varchar, comp.CO_FECHA, 103))                         --Fecha de percepción 
		when 10 then convert(varchar, comp.CO_FECHA, 103)
		when 9 then '0' + convert(varchar, comp.CO_FECHA, 103)
	   end as 'Fecha de Percepción',
	   case len(comp.CO_NETO)                                                 --Monto sujeto a percepción
		when 1 then substring(@Numero, 1, 14) + 
						convert(varchar,comp.CO_NETO)
		when 2 then substring(@Numero, 1, 13) + 
						convert(varchar,comp.CO_NETO)
		when 3 then substring(@Numero, 1, 12) +
						convert(varchar,comp.CO_NETO)
		when 4 then substring(@Numero, 1, 11) + 
						convert(varchar,comp.CO_NETO)
		when 5 then substring(@Numero, 1, 10) + 
						convert(varchar,comp.CO_NETO)
		when 6 then substring(@Numero, 1, 9) + 
						convert(varchar,comp.CO_NETO)
		when 7 then substring(@Numero, 1, 8) + 
						convert(varchar,comp.CO_NETO)
		when 8 then substring(@Numero, 1, 7) + 
						convert(varchar,comp.CO_NETO)
		when 9 then substring(@Numero, 1, 6) + 
						convert(varchar,comp.CO_NETO)
		when 10 then substring(@Numero, 1, 5) + 
						convert(varchar,comp.CO_NETO)
		when 11 then substring(@Numero, 1, 4) + 
						convert(varchar,comp.CO_NETO)
		when 12 then substring(@Numero, 1, 3) + 
						convert(varchar,comp.CO_NETO)
		when 13 then substring(@Numero, 1, 2) + 
						convert(varchar,comp.CO_NETO)
	   end as 'Monto Sujeto a Percepción',	

	   case len(convert(varchar, aliCuota.AIB_PORCEN))                     --Alicuota  
		when 1 then substring(@Numero, 1, 2) + 
						convert(varchar, aliCuota.AIB_PORCEN) + ',' + 
						substring(@Numero, 1, 2)
		when 2 then substring(@Numero, 1, 2) +
						convert(varchar, aliCuota.AIB_PORCEN) + ',' +
						substring(@Numero, 1, 2)
		when 3 then substring(@Numero, 1, 2) +		
						convert(varchar, aliCuota.AIB_PORCEN) + ',' + 
						substring(@Numero, 1, 2)
		when 4 then substring(@Numero, 1, 2) + 
						convert(varchar, aliCuota.AIB_PORCEN) + ',' + 
						substring(@Numero, 1, 2)
	   end as 'Alícuota',
	   comp.CO_PERIBR as 'Monto Percibido',                               --Monto percibido 
	   '001' as 'Tipo de Régimen de Percepción',                          --Tipo de régimen de percepción
	   '908' as 'Jurisdicción'                                            --Jurisdicción

from COMPROBANTES comp inner join ALICUOTA_INGBRU aliCuota
on comp.AIB_CODIGO = aliCuota.AIB_CODIGO
where comp.CO_SUCURSAL = '' and comp.CO_CODIGO in ('NCR', 'NDE', 'FAC', 'FAR', 'REC')
and comp.CO_FECHA between @fechaDeInicio and @fechaDeFinalizacion
order by comp.CO_FECHA desc
