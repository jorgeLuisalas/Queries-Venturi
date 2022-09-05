USE Venturi
GO

DECLARE @codigoCliente NVARCHAR(MAX)
DECLARE @nombreCliente NVARCHAR(MAX)
DECLARE @fechaInicio NVARCHAR(MAX)
DECLARE @fechaFin NVARCHAR(MAX)
DECLARE @compCodigo NVARCHAR(MAX)
DECLARE @compNumeroCodigo NVARCHAR(MAX)
DECLARE @compSucursal NVARCHAR(MAX)
DECLARE @compTipo NVARCHAR(MAX)
DECLARE @compCodigoComp NVARCHAR(MAX)
DECLARE @compValven NVARCHAR(MAX)
DECLARE @codigoDetCompr NVARCHAR(MAX)
DECLARE @sucursDetCompr NVARCHAR(MAX)
DECLARE @tipoDetCompr NVARCHAR(MAX)
DECLARE @numeroDetCompr NVARCHAR(MAX)

DECLARE @importDetCompro DECIMAL(10, 2)
DECLARE @compTotalImporte DECIMAL(30, 2)
DECLARE @contador DECIMAL(30, 2)

DECLARE @count INTEGER
DECLARE @verDatos INTEGER

DECLARE @fechaDetCompr SMALLDATETIME
DECLARE @fechaVencDetCompr SMALLDATETIME
DECLARE @compFecha SMALLDATETIME
DECLARE @compFechaVencimiento SMALLDATETIME


SET @compNumeroCodigo = ''
SET @contador = 0.0
SET @compTotalImporte = 0.0
SET @count = 0

--Poner las fechas de inicio y fechas de fin
SET @fechaInicio = '01/01/1900'
SET @fechaFin = '21/02/2022'

SET @verDatos = 0   --Para ver todos los comprobantes colocar 1, de lo contrario para no verlo y solo ver el saldo final poner 0

DECLARE @clientesSaldo TABLE (
	idCliente INTEGER PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	numeroCliente NVARCHAR(MAX),
	descripcionCliente NVARCHAR(MAX),
	saldoFinal NVARCHAR(MAX)
)

DECLARE @tablaSaldos TABLE (
	dato1 NVARCHAR(MAX) NULL,
	dato2 NVARCHAR(MAX) NULL,
	dato3 NVARCHAR(MAX) NULL,
	dato4 NVARCHAR(MAX) NULL,
	dato5 NVARCHAR(MAX) NULL,
	dato6 NVARCHAR(MAX) NULL,
	dato7 NVARCHAR(MAX) NULL
)

DECLARE CursorClientes CURSOR

	FOR
	SELECT TOP 100  CL_CODIGO, CL_NOMBRE 
	FROM Clientes
	--WHERE CL_CODIGO IN ('00009')	--Aqui colocar si es necesario que cliente buscar en particular traer todos los comprobantes
	ORDER BY CL_CODIGO ASC
		
OPEN CursorClientes	

	FETCH CursorClientes INTO @codigoCliente, @nombreCliente	
	
	WHILE(@@FETCH_STATUS=0)
	BEGIN	
			DECLARE ComprobantesCursor CURSOR
				FOR
				SELECT co_codigo, co_sucurs, co_numero, co_tipo, co_fecha, co_fecven, co_totcom, mo_codigo, md_valven 
				FROM COMPROBANTES
				WHERE CL_CODIGO = @codigoCliente AND CO_FECHA >= @fechaInicio AND CO_FECHA <= @fechaFin AND CO_CODIGO IN( 'ANT', 'FAC', 'FAR', 'NCR', 'NDE' ) AND CO_FECANU IS NULL
				--and CO_NUMERO not in ('00000048', '00002077')
				ORDER BY CO_FECHA, CO_CODIGO, CO_SUCURS, CO_NUMERO, CO_TIPO

			OPEN ComprobantesCursor
				FETCH ComprobantesCursor INTO @compCodigo, @compSucursal, @compNumeroCodigo, @compTipo, @compFecha, @compFechaVencimiento, @compTotalImporte, @compCodigoComp, @compValven
				
				WHILE(@@FETCH_STATUS=0)
				BEGIN	
				
					IF(@verDatos = 1) 
					BEGIN
						INSERT INTO @tablaSaldos
						SELECT '---------------', '---------------', '---------------', '---------------', '---------------', '---------------', '---------------'	
					END
										
					IF(@compCodigo = 'FAC' OR @compCodigo = 'NDE' OR @compCodigo = 'FAR')
					BEGIN
			
							SET @contador += @compTotalImporte							
							
							IF(@verDatos = 1) 
							BEGIN
								INSERT INTO @tablaSaldos
								SELECT @compCodigo + ' ' + @compSucursal  + '-' + @compNumeroCodigo  + '/' + @compTipo, 
								CONVERT(VARCHAR, @compFecha, 103), CONVERT(VARCHAR, @compFechaVencimiento, 103), (@compTotalImporte),
								@compCodigoComp, SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
							END									

							IF EXISTS (SELECT 
							                 C.CO_CODIGO + ' ' +	C.CO_SUCURS + '-' + C.CO_NUMERO + '/' + C.CO_TIPO, 
									   CONVERT(VARCHAR, C.CO_FECHA, 103), CONVERT(VARCHAR, C.CO_FECVEN, 103) , D.COD_IMPORT, '', 
									   SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
									   from COMP_DET D, COMPROBANTES C 
									   WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
									   COR_TIPO = @compTipo AND COR_CODIGO = @compCodigo AND COR_SUCURS = @compSucursal AND COR_NUMERO = @compNumeroCodigo AND C.CO_FECANU IS NULL AND
									   C.CO_CODIGO IN('REC','REB', 'IMP'))					
							BEGIN			
							
								SET @contador -= @compTotalImporte

								IF(@verDatos = 1) 
								BEGIN
									INSERT INTO @tablaSaldos
									SELECT C.CO_CODIGO + ' ' +	C.CO_SUCURS + '-' + C.CO_NUMERO + '/' + C.CO_TIPO, 
									CONVERT(VARCHAR, C.CO_FECHA, 103), CONVERT(VARCHAR, C.CO_FECVEN, 103) , '', CONVERT(VARCHAR, D.COD_IMPORT), 
									SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
									FROM COMP_DET D, COMPROBANTES C 
									WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
									COR_TIPO = @compTipo AND COR_CODIGO = @compCodigo AND COR_SUCURS = @compSucursal AND COR_NUMERO = @compNumeroCodigo AND C.CO_FECANU IS NULL AND
									C.CO_CODIGO IN('REC','REB','IMP')
								END

							END
							ELSE
							BEGIN
								IF EXISTS (
									SELECT compPag.*
									FROM COMP_PAG compPag
									WHERE compPag.CO_TIPO = @compTipo AND
									compPag.CO_CODIGO = @compCodigo AND
									compPag.CO_SUCURS = @compSucursal AND
									compPag.CO_NUMERO = @compNumeroCodigo
								)
								BEGIN

									SET @contador -= @compTotalImporte

									IF(@verDatos = 1) 
									BEGIN
										INSERT INTO @tablaSaldos
										SELECT ('Pago al contado'), '', '', '', CONVERT(VARCHAR, (SELECT SUM(CP_IMPORT) AS IMPORTE  
																						FROM COMP_PAG compPag
																						WHERE compPag.CO_TIPO = @compTipo AND
																						compPag.CO_CODIGO = @compCodigo AND
																						compPag.CO_SUCURS = @compSucursal AND
																						compPag.CO_NUMERO = @compNumeroCodigo)), @contador, ''
									END
								END
								ELSE
								BEGIN
									IF(@verDatos = 1) 
									BEGIN
										INSERT INTO @tablaSaldos
										SELECT 'Saldo', 'Comprobante', '', '', '', '', @compTotalImporte
									END
								END
							END							
						END

						IF(@compCodigo = 'NCR' OR @compCodigo = 'ANT')
						BEGIN
							SET @compTotalImporte *= -1

							SET @contador -= @compTotalImporte							
							
							IF(@verDatos = 1) 
							BEGIN
								INSERT INTO @tablaSaldos
								SELECT @compCodigo + ' ' + @compSucursal  + '-' + @compNumeroCodigo  + '/' + @compTipo, 
								CONVERT(VARCHAR, @compFecha, 103), CONVERT(VARCHAR, @compFechaVencimiento, 103), 
								@compCodigoComp, (@compTotalImporte)*(-1), SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
							END 
							
							IF EXISTS (
										SELECT C.CO_CODIGO + ' ' +	C.CO_SUCURS + '-' + C.CO_NUMERO + '/' + C.CO_TIPO, 
										CONVERT(VARCHAR, C.CO_FECHA, 103), CONVERT(varchar, C.CO_FECVEN, 103) , D.COD_IMPORT, '', 
										SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
										from COMP_DET D, COMPROBANTES C 
										WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
										COR_TIPO = @compTipo AND COR_CODIGO = @compCodigo AND COR_SUCURS = @compSucursal AND COR_NUMERO = @compNumeroCodigo AND C.CO_FECANU IS NULL AND
										C.CO_CODIGO IN('REC','REB', 'IMP')
							)							
							BEGIN							

								SET @contador += @compTotalImporte

								IF(@verDatos = 1) 
								BEGIN
									INSERT INTO @tablaSaldos
									SELECT C.CO_CODIGO + ' ' +	C.CO_SUCURS + '-' + C.CO_NUMERO + '/' + C.CO_TIPO, 
										CONVERT(VARCHAR, C.CO_FECHA, 103), CONVERT(VARCHAR, C.CO_FECVEN, 103) , CONVERT(VARCHAR, D.COD_IMPORT * (-1)), '', 
										SUBSTRING(CONVERT(VARCHAR, @contador), 0, CHARINDEX('.', CONVERT(VARCHAR, @contador)) + 3), ''
									FROM COMP_DET D, COMPROBANTES C 
									WHERE D.CO_TIPO = C.CO_TIPO AND D.CO_CODIGO = C.CO_CODIGO AND D.CO_SUCURS = C.CO_SUCURS AND D.CO_NUMERO = C.CO_NUMERO AND
									COR_TIPO = @compTipo AND COR_CODIGO = @compCodigo AND COR_SUCURS = @compSucursal AND COR_NUMERO = @compNumeroCodigo AND C.CO_FECANU IS NULL AND
									C.CO_CODIGO IN('REC','REB','IMP')
								END
							END
							ELSE
							BEGIN						 
								
								IF EXISTS (
									SELECT compPag.*
									FROM COMP_PAG compPag
									WHERE compPag.CO_TIPO = @compTipo AND
									compPag.CO_CODIGO = @compCodigo AND
									compPag.CO_SUCURS = @compSucursal AND
									compPag.CO_NUMERO = @compNumeroCodigo
								)
								BEGIN
									SET @contador += @compTotalImporte

									IF(@verDatos = 1) 
									BEGIN
										INSERT INTO @tablaSaldos
										SELECT ('Pago al contado'), '', '', '', CONVERT(VARCHAR, (SELECT sum(CP_IMPORT) as IMPORTE  
																						FROM COMP_PAG compPag
																						WHERE compPag.CO_TIPO = @compTipo AND
																						compPag.CO_CODIGO = @compCodigo AND
																						compPag.CO_SUCURS = @compSucursal AND
																						compPag.CO_NUMERO = @compNumeroCodigo)), @contador, ''
									END
								END
								ELSE
								BEGIN
									IF(@verDatos = 1) 
									BEGIN
										INSERT INTO @tablaSaldos
										SELECT 'Saldo', 'Comprobante', '', '', '', '', @compTotalImporte		
									END
								END
							END	
					 END		    
										
					FETCH ComprobantesCursor INTO @compCodigo, @compSucursal, @compNumeroCodigo, @compTipo, @compFecha, @compFechaVencimiento, @compTotalImporte, @compCodigoComp, @compValven

				END

			CLOSE ComprobantesCursor

			DEALLOCATE ComprobantesCursor

		INSERT INTO @clientesSaldo (numeroCliente, descripcionCliente, saldoFinal)
		VALUES (@codigoCliente, @nombreCliente, @contador)
						
		SET @contador = 0.0

		FETCH CursorClientes INTO @codigoCliente, @nombreCliente			
	END

CLOSE CursorClientes

DEALLOCATE CursorClientes



IF(@verDatos = 1) 
BEGIN
	INSERT INTO @tablaSaldos
	SELECT '---------------', '---------------', '---------------', '---------------', '---------------', '---------------', '---------------'
	   	 
	SELECT ISNULL(saldos.dato1,'') AS 'Comprobante', 
		   ISNULL(saldos.dato2,'') AS 'Emision', 
		   ISNULL(saldos.dato3,'') AS 'Vencimiento',
		   ISNULL(saldos.dato4,'') AS 'Debe', 
		   ISNULL(saldos.dato5,'') AS 'Haber', 
		   ISNULL(saldos.dato6,'') AS 'Saldo',
		   ISNULL(saldos.dato7,'') AS 'Saldo Compro'
	FROM @tablaSaldos saldos
END

SELECT cliSaldos.*
FROM @clientesSaldo cliSaldos



