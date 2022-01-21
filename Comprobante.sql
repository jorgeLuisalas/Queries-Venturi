use Venturi
go


--Declaramos el cursor

declare @co_codigo nvarchar(MAX)
declare @co_sucurs nvarchar(MAX)
declare @co_numero nvarchar(MAX)
declare @co_tipo nvarchar(MAX)
declare @co_fecha smalldatetime
declare @co_fecven smalldatetime
declare @co_totcom float
declare @mo_codigo nvarchar(MAX)
declare @md_valven float
declare @tipoComprobante bit
declare @verDatos bit

declare @codigoCliente nvarchar(max)
declare @nombreCliente nvarchar(max)
declare @fechaInicio nvarchar(max)
declare @fechaFin nvarchar(max)

declare @valueResultData decimal(30, 20)
declare @contador decimal(30, 20)
declare @pagoComprobante decimal(30, 20)

set @tipoComprobante = 0
set @contador = 0.0
set @pagoComprobante = 0.0

set @fechaInicio = '01/01/1900'
set @fechaFin = '13/12/2021'


set @verDatos = 0	--0 para no ver los select . 1 es para ver los select de los datos en comprobantes

--Declaramos la tabla de clientes para guardar su saldo

declare @clientesSaldo table (
	idCliente integer primary key identity(1, 1) not null,
	numeroCliente nvarchar(max),
	descripcionCliente nvarchar(max),
	saldoFinal nvarchar(max)
)


declare CursorClientes Cursor

	for 
	select top 10 CL_CODIGO, CL_NOMBRE
	from Clientes
	--WHERE CL_CODIGO IN ('60015')
	order by CL_CODIGO asc
		
	set @contador =  0.0

open CursorClientes	

	Fetch CursorClientes into @codigoCliente, @nombreCliente


	while(@@FETCH_STATUS=0)
	begin	

		insert into @clientesSaldo (numeroCliente, descripcionCliente, saldoFinal)
		values (@codigoCliente, @nombreCliente, 0)

		declare Cursor1 Cursor			
			for 	
			SELECT co_codigo, co_sucurs, co_numero, co_tipo, co_fecha, co_fecven, co_totcom, mo_codigo, md_valven 
			FROM COMPROBANTES
			WHERE CL_CODIGO = @codigoCliente AND CO_FECHA >= @fechaInicio AND CO_FECHA <= @fechaFin AND CO_CODIGO IN( 'ANT', 'FAC', 'FAR', 'NCR', 'NDE' ) AND CO_FECANU IS NULL
			--and CO_NUMERO not in ('00000048', '00002077')
			ORDER BY CO_FECHA, CO_CODIGO, CO_SUCURS, CO_NUMERO, CO_TIPO
			
						
		--Abrimos el cursor
		open Cursor1
			Fetch Cursor1 into @co_codigo, @co_sucurs, @co_numero, @co_tipo, @co_fecha, @co_fecven, @co_totcom, @mo_codigo, @md_valven
				
				if @co_codigo = 'NCR' or  @co_codigo = 'ANT'
				begin
					set @tipoComprobante = 1
					set @contador -= @co_totcom		
				end
				else
				begin
					set @contador += @co_totcom		
				end
			

		while(@@FETCH_STATUS=0)
		begin 
			if @verDatos = 1
			begin 
				select @co_codigo, @co_sucurs, @co_numero, @co_tipo, @co_fecha, @co_fecven, @co_totcom, @mo_codigo, @md_valven	
			
				if (SELECT COUNT(C.CO_NUMERO)
					FROM COMP_DET D, COMPROBANTES C 
					WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
					COR_TIPO   = @co_tipo AND COR_CODIGO = @co_codigo AND COR_SUCURS = @co_sucurs AND COR_NUMERO = @co_numero AND C.CO_FECANU IS NULL AND
					C.CO_CODIGO IN('REC','REB','IMP')) > 0
				begin
					SELECT C.CO_CODIGO, C.CO_SUCURS, C.CO_NUMERO, C.CO_TIPO, C.CO_FECHA, C.CO_FECVEN , D.COD_IMPORT 
					FROM COMP_DET D, COMPROBANTES C 
					WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
					COR_TIPO   = @co_tipo AND COR_CODIGO = @co_codigo AND COR_SUCURS = @co_sucurs AND COR_NUMERO = @co_numero AND C.CO_FECANU IS NULL AND
					C.CO_CODIGO IN('REC','REB','IMP') 
					ORDER BY C.CO_FECHA
				end
				else
				begin
					select 'NO SE PAGO DICHO COMPROBANTE' as 'INFORMACION'
				end
			end
									
			set @valueResultData = (SELECT SUM(D.COD_IMPORT)
									FROM COMP_DET D, COMPROBANTES C 
									WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
									COR_TIPO = @co_tipo AND COR_CODIGO = @co_codigo AND COR_SUCURS = @co_sucurs AND COR_NUMERO = @co_numero AND C.CO_FECANU IS NULL AND
									C.CO_CODIGO IN('REC','REB','IMP'))

			if @tipoComprobante = 1
			begin
				set @contador += (SELECT COALESCE(NULL, @valueResultData, 0))
			end
			else
			begin
				set @contador -= (SELECT COALESCE(NULL, @valueResultData, 0))
			end

			set @pagoComprobante = (SELECT sum(CP_IMPORT) as IMPORTE 
									FROM COMP_PAG 
									WHERE CO_TIPO = @co_tipo AND
									CO_CODIGO = @co_codigo AND
									CO_SUCURS = @co_sucurs AND
									CO_NUMERO = @co_numero)


			if @pagoComprobante > 0.0
			begin
				if @verDatos = 1
				begin
					select 'Pago de contado' as 'DATOS PAGO', substring(convert(varchar, @pagoComprobante), 0, 
					CHARINDEX('.', convert(varchar, @pagoComprobante)) + 3) as 'MONTO PAGADO'
				end
				
				SET @contador -= @pagoComprobante
			end			
			
			if @verDatos = 1
			begin
				select substring(convert(varchar, @contador), 0, CHARINDEX('.', convert(varchar, @contador)) + 3) AS 'TOTAL DEUDA'			
			end
						
	    	set @tipoComprobante = 0

			Fetch Cursor1 into @co_codigo, @co_sucurs, @co_numero, @co_tipo, @co_fecha, @co_fecven, @co_totcom, @mo_codigo, @md_valven
			
			update @clientesSaldo
			set saldoFinal = @contador
			where numeroCliente = @codigoCliente

		   set @contador += @co_totcom	
		   set @pagoComprobante = 0.0

		end	

		close Cursor1

		Deallocate Cursor1	
				
		Fetch CursorClientes into @codigoCliente, @nombreCliente
		set @contador =  0.0	
	end

close CursorClientes

Deallocate CursorClientes

select cli.numeroCliente as 'Numero de cliente', cli.descripcionCliente as 'Descripcion del cliente', 
substring(convert(varchar, cli.saldoFinal), 0, CHARINDEX('.', convert(varchar, cli.saldoFinal)) + 3) as 'Saldo del cliente'
from @clientesSaldo cli