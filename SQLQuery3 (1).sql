USE Venturi
GO

IF OBJECT_ID(N'tempdb..#tmpSucursal') IS NOT NULL
	DROP TABLE #tmpSucursal

IF OBJECT_ID(N'tempdb..#DatosProveedores') IS NOT NULL
	DROP TABLE #DatosProveedores

IF OBJECT_ID(N'tempdb..#ConsultaDatosProveedor') IS NOT NULL
	DROP TABLE #ConsultaDatosProveedor
	
IF OBJECT_ID(N'tempdb..#ProveedoresData') IS NOT NULL
	DROP TABLE #ProveedoresData
			
IF OBJECT_ID('tempdb..##TMPDATA') IS NOT NULL
	DROP TABLE ##TMPDATA
	
IF OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR_DATOS') IS NOT NULL
	DROP TABLE ##TMPTABLE_PROVEEDOR_DATOS  	   

IF OBJECT_ID('tempdb..##TMPTABLE_PROVEEDOR')IS NOT NULL
	DROP TABLE ##TMPTABLE_PROVEEDOR

	DECLARE       @INDICADOR_B  VARCHAR(2)
	DECLARE		  @BSGCOD       NVARCHAR(2)  
	DECLARE		  @BPSNUM       NVARCHAR(max)
	DECLARE		  @ENAFLG       INT 
	DECLARE		  @BPRNAM       NVARCHAR( 40)
	DECLARE		  @BPRSHO       NVARCHAR (40)
	DECLARE		  @CRY          NVARCHAR(max)
	DECLARE		  @LAN          NVARCHAR  (3)
	DECLARE		  @CRN          NVARCHAR (13)
	DECLARE		  @CUR          NVARCHAR (3)
	DECLARE		  @ABCCLS       VARCHAR  (2) 
	DECLARE		  @PLISTC       NVARCHAR (max)
	DECLARE		  @BPTNUM       NVARCHAR (max)
	DECLARE		  @MDL          VARCHAR  (2)
	DECLARE		  @EECICT       NVARCHAR (max)
	DECLARE		  @BPSTYP       INT 
	DECLARE		  @MATTOL       NVARCHAR (max)
	DECLARE		  @OSTCTL       INT
	DECLARE		  @OSTAUZAMT    NVARCHAR (max)
	DECLARE		  @PAYLOKFLG    INT
	DECLARE		  @DOUFLG       INT 
	DECLARE		  @TSSCOD0      NVARCHAR (max)
	DECLARE		  @TSSCOD1      NVARCHAR (max)
	DECLARE		  @TSSCOD2      NVARCHAR (max)
	DECLARE		  @TSSCOD3      NVARCHAR (max)
	DECLARE		  @ACCCOD       NVARCHAR (max)
	DECLARE		  @PTE          NVARCHAR (40)
	DECLARE		  @VACBPR       NVARCHAR (max) 
	DECLARE		  @XX12CHQNAM   NVARCHAR (max)
	DECLARE		  @XX12CHQORD   NVARCHAR (max)
	DECLARE		  @XX12BPSCBU   NVARCHAR (max)
	DECLARE		  @XX12NIF      NVARCHAR (13)
	DECLARE		  @XX12PERFLG   NVARCHAR (max)
	DECLARE		  @XX12SITGAN   NVARCHAR (max) 
	DECLARE		  @XX12REGIIBB  NVARCHAR (max) 
	DECLARE		  @XX12IIBB     NVARCHAR (13)
	DECLARE		  @XX12DOCTYP   INT 
	DECLARE		  @XX12DOCNUM   NVARCHAR (13)
	DECLARE		  @XX12MTBBPR   NVARCHAR (max)
	DECLARE		  @XX12BPSEMB   NVARCHAR (max)
	DECLARE		  @XX12BPRINT   INT 
	DECLARE		  @XX12CTRFIS   NVARCHAR (max)
	DECLARE		  @XX12SITIBCAB NVARCHAR (max)
	DECLARE		  @XX12ALLRET   VARCHAR  (2)
	DECLARE		  @71          NVARCHAR (max)
	DECLARE		  @72          NVARCHAR (max)
	DECLARE		  @81          NVARCHAR (max)
	DECLARE		  @82          NVARCHAR (max)
			  
			  
	DECLARE		  @INDICADOR_A    VARCHAR  (2)
	DECLARE		  @BPAADD         NVARCHAR (3)
	DECLARE		  @BPADES         NVARCHAR (40)
	DECLARE		  @BPAADDLIG0     NVARCHAR (30)
	DECLARE		  @BPAADDLIG1     NVARCHAR (30)
	DECLARE		  @POSCOD         NVARCHAR (40) 
	DECLARE		  @CRY2           NVARCHAR (40)
	DECLARE		  @BPAADDFLG      INT 
	DECLARE		  @TEL0           NVARCHAR (30)
	DECLARE		  @TEL1           NVARCHAR (30)
	DECLARE		  @FAX            NVARCHAR (40)
	DECLARE		  @FCYWEB         NVARCHAR (50)
	DECLARE		  @WEB0           NVARCHAR (40)
	DECLARE		  @WEB1           NVARCHAR (50)
			  
	DECLARE		  @INDICADOR_C  VARCHAR  (2)
	DECLARE		  @CCNCRM       NVARCHAR (80)
	DECLARE		  @CNTTTL       NVARCHAR (20)
	DECLARE		  @CNTFNA       NVARCHAR (80)
	DECLARE		  @CNTLNA       NVARCHAR (20)
	DECLARE		  @TEL          NVARCHAR (20)
	DECLARE		  @WEB          NVARCHAR (80)
	DECLARE		  @CNTFNC       NVARCHAR (40)
	DECLARE		  @CNTMSS       NVARCHAR (40)
		  
			  
	DECLARE		  @INDICADOR_O    VARCHAR  (2)
	DECLARE		  @ODFCOD         NVARCHAR (80)
	DECLARE		  @ODFVAL         NVARCHAR (80)
			  
			  
	DECLARE		  @INDICADOR_P    VARCHAR  (2)
	DECLARE		  @SAT            NVARCHAR (80)
	DECLARE		  @DATDEB         NVARCHAR (80)
	DECLARE		  @DATFIN         NVARCHAR (80)
			  
			  
	DECLARE		  @INDICADOR_R    VARCHAR  (2)
	DECLARE		  @XX12CRET       NVARCHAR (3)
		  
    

CREATE TABLE #tmpSucursal (
	idSucursal INTEGER PRIMARY KEY NOT NULL,
	descripcion VARCHAR(25) NOT NULL
)

		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (1, 'FABR')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (2, 'BAH')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (3, 'BSAS')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (4, 'CBA')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (5, 'MZA')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (6, 'PAR')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (7, 'RIOIV')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (8, 'ROS')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (9, 'SFCO')
		INSERT INTO #tmpSucursal (idSucursal, descripcion) VALUES (10, 'TUC')


		CREATE TABLE #DatosProveedores (

			proveedor VARCHAR(50) NOT NULL,
			sigla VARCHAR(50) NOT NULL,
			descripcionCorta VARCHAR(50) NOT NULL,
			idSucurs INTEGER NULL,	
			FOREIGN KEY(idSucurs) REFERENCES #tmpSucursal(idSucursal)	
		)

		INSERT INTO #DatosProveedores VALUES	(   'PBA-0001',	'0A525',	'BCO.BMV',1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0002',	'0B145',	'BCO.CBA',	1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0003',	'0B146',	'BCO.JULIO',1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0004',	'0B147',	'GALICIA',	1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0005',	'0B148',	'BCO.NACION',1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0006',	'0B149',	'SANTANDER',1)
		INSERT INTO #DatosProveedores VALUES	(	'PBA-0007',	'0H059',	'HSBC',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00001',	'0A259',	'VH CHILE',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00002',	'0A264',	'HVI',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00003',	'0A433',	'IHM',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00004',	'0A220',	'AL UNNA ',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00005',	'0A242',	'INTERCOIL',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00006',	'0A256',	'BALFLEX',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00007',	'0A261',	'HYDROLINE ',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00008',	'0A267',	'ZH',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00009',	'0A270',	'INTEVA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00010',	'0A284',	'PLONA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00011',	'0A300',	'FUZHOU HAI',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00012',	'0A320',	'QUINGHE CO',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00013',	'0A321',	'MOUSER ELE',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00014',	'0A332',	'INDEMAR',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00015',	'0A333',	'NINGBO CHA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00016',	'0A336',	'BOLEV',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00017',	'0A340',	'SEPRO',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00018',	'0A341',	'UFI FILTER',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00019',	'0A348',	'EVEREST',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00020',	'0A352',	'MINIPRESS',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00021',	'0A353',	'ZHEJIANGSF',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00022',	'0A359',	'KINDE',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00023',	'0A368',	'WEIPU',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00024',	'0A369',	'GERBOLE',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00025',	'0A377',	'HIDROS MAC',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00026',	'0A379',	'RAYSTAR',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00027',	'0A380',	'ALTINKAYA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00028',	'0A381',	'ONPOW PUSH',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00029',	'0A383',	'GENEUO',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00030',	'0A384',	'GOLD.TRIAN',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00031',	'0A387',	'EZITOWN',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00032',	'0A392',	'JIANGSU SU',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00033',	'0A397',	'MARCHESINI',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00034',	'0A398',	'PRENSSO',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00035',	'0A399',	'SCHNORR',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00036',	'0A407',	'STONKAM CO',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00037',	'0A408',	'YUEQING',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00038',	'0A411',	'BOLLHOFF',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00039',	'0A414',	'YY MAGNETS',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00040',	'0A415',	'ESPERANCA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00041',	'0A420',	'NANTE',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00042',	'0A421',	'KORESON',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00043',	'0A422',	'EAST.WAVES',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00044',	'0A430',	'R.E PURVIS',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00045',	'0A431',	'NINGBO AND',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00046',	'0A432',	'TAIWAY',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00047',	'0A436',	'ATLAN.FLU.',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00048',	'0A440',	'HEBEI LEFL',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00049',	'0A446',	'DURALCROM',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00050',	'0A447',	'ALTA',	1)
		INSERT INTO #DatosProveedores VALUES	(	'E00051',	'0A448',	'MICRO SENS',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00052',	'0A450',	'SMIERVERDA',1)
		INSERT INTO #DatosProveedores VALUES	(	'E00053',	'0A452',	'GML STEEL ',1)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0001',	'0A021',	'ALLIANZ',1)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0002',	'0A040',	'KEEPER',1)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0003',	'0A073',	'ACE',1)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0004',	'0B046',	'BERKLEY',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0005',	'0B131',	'BBVA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0006',	'0C182',	'CHUBB',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0007',	'0C277',	'EL NORTE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0008',	'0E076',	'E.P.E.C.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0009',	'0F064',	'FIANYCRED',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0010',	'0G035',	'GAS CTRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0011',	'0I118',	'INTEGRITY',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0012',	'0M090',	'MAPFRE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0013',	'0M127',	'MUNIC.CBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0014',	'0S123',	'SMG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0015',	'0S193',	'SMG LIFE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0016',	'0T005',	'TELECOM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0017',	'0T070',	'TELEFONICA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0018',	'0T149',	'TELE.MOVIL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PGA-0019',	'0Z004',	'ZURICH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00001',	'0A038',	'OBERTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00002',	'0A055',	'ACINDAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00003',	'0A065',	'ELIZALDE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00004',	'0A070',	'ALLENDE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00005',	'0A096',	'ABACOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00006',	'0A103',	'ARTIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00007',	'0A108',	'ANANDA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00008',	'0A121',	'AMIANGRAF ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00009',	'0A123',	'COFER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00010',	'0A125',	'ACEROS S.H',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00011',	'0A131',	'FELMAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00012',	'0A142',	'ACEROPLAT ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00013',	'0A144',	'ASTRADA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00014',	'0A405',	'A.ALLENDE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00015',	'0A508',	'ACEROS FB',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00016',	'0A524',	'AVTOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00017',	'0A535',	'ARLEX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00018',	'0B080',	'BASER TEL ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00019',	'0B092',	'BATTISTINI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00020',	'0B096',	'EPOXICOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00021',	'0B157',	'BUL.CENTRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00022',	'0C054',	'C.PAN.ACER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00023',	'0C133',	'CESCA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00024',	'0C165',	'CHECANOVSK',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00025',	'0C185',	'CABRERA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00026',	'0C225',	'CITEM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00027',	'0C266',	'CRUCIANELL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00028',	'0D001',	'DIAMETRAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00029',	'0D043',	'DANTRA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00030',	'0D057',	'DEL METAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00031',	'0E018',	'ENPOLEX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00032',	'0E104',	'ELECTROCOM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00033',	'0E105',	'ELMON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00034',	'0E118',	'MAYER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00035',	'0F056',	'CARISSIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00036',	'0F070',	'FASTENER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00037',	'0F072',	'FABRYMET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00038',	'0F105',	'FORMULA100',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00039',	'0F112',	'FANUC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00040',	'0F116',	'FUSUR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00041',	'0F146',	'GATTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00042',	'0G016',	'GEACASTRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00043',	'0G022',	'ONELDO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00044',	'0G023',	'GOSCA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00045',	'0G075',	'GIORDANO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00046',	'0G138',	'G.CENTENO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00047',	'0H006',	'ARELLANO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00048',	'0H069',	'BULL MET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00049',	'0I005',	'SUIPACHA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00050',	'0I017',	'RACAMATO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00051',	'0I029',	'ALKA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00052',	'0I047',	'SKOTNICA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00053',	'0I114',	'CEN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00054',	'0I117',	'INDELFIL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00055',	'0I121',	'ISAMAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00056',	'0J025',	'JS FUND.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00057',	'0K009',	'KRUGER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00058',	'0M006',	'MERESHIAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00059',	'0M107',	'MEDIAVILLA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00060',	'0M142',	'MULTICOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00061',	'0M181',	'MEVACO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00062',	'0M186',	'BALMATIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00063',	'0M263',	'OXIMET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00064',	'0N003',	'NOR-DIN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00065',	'0N026',	'NETTING',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00066',	'0N028',	'NORAN ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00067',	'0O003',	'OVNISA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00068',	'0O024',	'OTIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00069',	'0O052',	'GEA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00070',	'0P004',	'PORTA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00071',	'0P032',	'PIZZI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00072',	'0P050',	'PACKING',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00073',	'0P073',	'PELLACANI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00074',	'0P096',	'PRIMALCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00075',	'0P115',	'PULGAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00076',	'0P157',	'PINNA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00077',	'0P160',	'PLASCOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00078',	'0P182',	'PICAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00079',	'0P189',	'PROD.SIDER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00080',	'0R027',	'ROGIRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00081',	'0R030',	'ROD.CAROYA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00082',	'0R040',	'LIBAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00083',	'0R046',	'SAV',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00084',	'0R078',	'TERRAGNI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00085',	'0R105',	'ROGRIM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00086',	'0R140',	'FABRESCOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00087',	'0S001',	'SABO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00088',	'0S008',	'SUDOSILO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00089',	'0S050',	'SIDERCA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00090',	'0S088',	'SIDERSA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00091',	'0S153',	'LACAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00092',	'0S158',	'SALADINO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00093',	'0S160',	'SERVI PLAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00094',	'0S190',	'SPRAYTEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00095',	'0T101',	'CRIPTON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00096',	'0T103',	'SUDANESA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00097',	'0T128',	'TELEFIJ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00098',	'0T134',	'TECNOPLAST',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00099',	'0T183',	'TUBOMET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00100',	'0V007',	'VIRMANIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00101',	'0V041',	'VANTRONIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00102',	'0V049',	'VALOTTO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'N00103',	'0W010',	'WINNER PAK',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0001',	'0A001',	'ANDREANI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0002',	'0A006',	'ANPEAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0003',	'0A014',	'BORETTO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0004',	'0A019',	'ALERCIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0005',	'0A024',	'ABC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0006',	'0A029',	'RIVAROLA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0007',	'0A035',	'ARIZMENDI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0008',	'0A041',	'ARGENSOLD',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0009',	'0A050',	'AGUADO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0010',	'0A093',	'ACERCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0011',	'0A106',	'CANALE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0012',	'0A115',	'ARCE GOMA ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0013',	'0A120',	'AHUMADA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0014',	'0A121',	'AMIANGRAF',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0015',	'0A122',	'ARCE JOSE ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0016',	'0A139',	'ABS NOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0017',	'0A144',	'ASTRADA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0018',	'0A152',	'ARROYO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0019',	'0A162',	'DEL RIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0020',	'0A164',	'DE VISU',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0021',	'0A165',	'MIHITARIAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0022',	'0A172',	'ARMANDO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0023',	'0A186',	'AMS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0024',	'0A188',	'ABO-COR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0025',	'0A190',	'ALFASER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0026',	'0A195',	'ALFA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0027',	'0A323',	'HARDINGE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0028',	'0A378',	'HURT INFER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0029',	'0A393',	'MAPAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0030',	'0A423',	'ENGIS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0031',	'0A438',	'BOXI LLC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0032',	'0A442',	'ODOO INC.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0033',	'0A531',	'ANTONINO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0034',	'0A536',	'ADONIX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0035',	'0A540',	'ASSISTECH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0036',	'0A558',	'ARIZM.COMP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0037',	'0A560',	'AMAYA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0038',	'0B013',	'BIANCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0039',	'0B017',	'BONOMI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0040',	'0B024',	'B.R.M.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0041',	'0B029',	'BERG.PAST.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0042',	'0B040',	'BORUR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0043',	'0B045',	'OERLIKON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0044',	'0B049',	'BECCACECE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0045',	'0B055',	'BUL.MEDIT.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0046',	'0B056',	'BELTRAM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0047',	'0B064',	'BARZON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0048',	'0B073',	'B Y C',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0049',	'0B079',	'BIELEWICZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0050',	'0B120',	'BORETTINI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0051',	'0B140',	'BENITO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0052',	'0B141',	'BYM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0053',	'0B164',	'BUCCI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0054',	'0B167',	'BMB FILTER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0055',	'0B170',	'BARABINO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0056',	'0B172',	'BLANCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0057',	'0B176',	'BE TECH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0058',	'0C005',	'CONFECAT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0059',	'0C008',	'CASA RAYO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0060',	'0C012',	'CONSTRULUZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0061',	'0C013',	'COMEL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0062',	'0C016',	'CBA GOMA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0063',	'0C023',	'MANRIQUE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0064',	'0C034',	'CUGAT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0065',	'0C038',	'FEYRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0066',	'0C039',	'CAROS.VAIR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0067',	'0C053',	'Ca.C.E.C.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0068',	'0C063',	'CELSIUS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0069',	'0C064',	'COM.I.C.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0070',	'0C068',	'CBA DESINF',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0071',	'0C069',	'COM.SUMA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0072',	'0C088',	'CYCLO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0073',	'0C100',	'CENTARTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0074',	'0C101',	'CERR.PINOS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0075',	'0C121',	'COVYAT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0076',	'0C125',	'CBA DIESEL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0077',	'0C130',	'CARRERA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0078',	'0C135',	'CEAM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0079',	'0C148',	'CACCIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0080',	'0C192',	'CARBALLO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0081',	'0C203',	'CUGAT SRL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0082',	'0C207',	'CASA BUENO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0083',	'0C214',	'POLAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0084',	'0C239',	'CTRO BOBIN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0085',	'0C255',	'CARLONI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0086',	'0C257',	'SIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0087',	'0C259',	'CATTANEO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0088',	'0C264',	'CONECTICA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0089',	'0C279',	'CGS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0090',	'0C287',	'CAPPDAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0091',	'0C290',	'CRE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0092',	'0C301',	'COMP GRAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0093',	'0C305',	'CIKA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0094',	'0C309',	'TAURO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0095',	'0D014',	'DITEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0096',	'0D025',	'FRAPPAMPIN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0097',	'0D042',	'DHL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0098',	'0D047',	'MAB',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0099',	'0D050',	'DAIMA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0100',	'0D068',	'DIXTOOLS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0101',	'0D069',	'DARSIE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0102',	'0D087',	'DIMOTEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0103',	'0D089',	'DI CARLOS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0104',	'0D101',	'DESCAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0105',	'0D117',	'DELLE GRAZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0106',	'0D131',	'D.FISC.CBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0107',	'0D134',	'DODERO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0108',	'0E004',	'MAG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0109',	'0E006',	'EL SOTANO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0110',	'0E010',	'SLP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0111',	'0E011',	'CARGO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0112',	'0E040',	'RIVADAVIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0113',	'0E049',	'EL AUDITOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0114',	'0E064',	'EGUIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0115',	'0E071',	'ELECTROMAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0116',	'0E079',	'BRIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0117',	'0E097',	'ERGIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0118',	'0E101',	'E.B.S.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0119',	'0E103',	'EMBALAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0120',	'0E106',	'ESCHOYEZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0121',	'0E117',	'ELECTR.CBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0122',	'0E123',	'LOS MOLINO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0123',	'0F003',	'MARCUZZI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0124',	'0F004',	'FERRUS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0125',	'0F006',	'FREIBERG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0126',	'0F017',	'FERRE-VAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0127',	'0F035',	'FERREYRA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0128',	'0F037',	'FORBAT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0129',	'0F038',	'FUCHS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0130',	'0F039',	'FUND.MEDIT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0131',	'0F069',	'CIARIMBOLI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0132',	'0F084',	'FAST-CHEM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0133',	'0F087',	'FAVEL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0134',	'0F090',	'FUSSE ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0135',	'0F096',	'FERRETTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0136',	'0F102',	'TRIANGULO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0137',	'0F123',	'TIGGER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0138',	'0F132',	'FADHER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0139',	'0F136',	'FINRIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0140',	'0F141',	'FONTOVA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0141',	'0F142',	'FINE&PURE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0142',	'0F145',	'FCA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0143',	'0F154',	'MARCUZZI ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0144',	'0G012',	'ISAIAS MIG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0145',	'0G015',	'PEDRO GIAC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0146',	'0G016',	'GEA Y CAST',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0147',	'0G027',	'GROSSO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0148',	'0G041',	'F.MARCUZZI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0149',	'0G065',	'GM ELECTRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0150',	'0G067',	'SAN BLAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0151',	'0G085',	'GEST.LABOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0152',	'0G094',	'GAMISOL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0153',	'0G097',	'GARNICA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0154',	'0G134',	'GESTECO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0155',	'0G142',	'GATTI COLD',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0156',	'0G146',	'GASES ARG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0157',	'0G147',	'GODINO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0158',	'0G149',	'GOLOSINAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0159',	'0G153',	'GM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0160',	'0H001',	'HERTIG',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0161',	'0H005',	'HELMFELT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0162',	'0H006',	'ARELLANO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0163',	'0H021',	'H & T',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0164',	'0H029',	'HIDROACCES',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0165',	'0H033',	'HERR.CORTE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0166',	'0H054',	'HARTEN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0167',	'0H058',	'HUERTA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0168',	'0I008',	'ITV AV. JA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0169',	'0I021',	'LAM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0170',	'0I025',	'ITV CBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0171',	'0I030',	'INSTRELEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0172',	'0I031',	'INFAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0173',	'0I032',	'INTERBANK',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0174',	'0I048',	'ISCAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0175',	'0I072',	'MAIER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0176',	'0I102',	'I.N.T.I.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0177',	'0I104',	'INT PROTEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0178',	'0I110',	'ILPEM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0179',	'0I119',	'IFX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0180',	'0I122',	'ITELSA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0181',	'0I123',	'INDART',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0182',	'0J009',	'J.J.JACOBO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0183',	'0K004',	'KONRAD',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0184',	'0K005',	'KAHNS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0185',	'0K006',	'KACHUKA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0186',	'0K013',	'KUM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0187',	'0K021',	'KOUSSIKIAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0188',	'0L025',	'LINK',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0189',	'0L061',	'LAPENTA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0190',	'0L072',	'LA BRISA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0191',	'0L096',	'LAGO HNOS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0192',	'0L101',	'LYON GROUP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0193',	'0L103',	'LCI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0194',	'0L107',	'LIFTGATE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0195',	'0L112',	'LIDERTECH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0196',	'0L119',	'LUPITA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0197',	'0M021',	'MARTINEZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0198',	'0M028',	'M.MISIONES',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0199',	'0M030',	'GERBAUDO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0200',	'0M042',	'M.METAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0201',	'0M052',	'MOTCOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0202',	'0M070',	'MACSI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0203',	'0M086',	'MISTEROMBU',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0204',	'0M096',	'MITUTOYO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0205',	'0M115',	'ORM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0206',	'0M121',	'MESURE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0207',	'0M125',	'MESS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0208',	'0M202',	'MARRUCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0209',	'0M205',	'MC ING',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0210',	'0M219',	'MAP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0211',	'0M226',	'MAZZA ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0212',	'0M236',	'METAC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0213',	'0M238',	'MART.GAMB.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0214',	'0M242',	'MEDIAVILLA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0215',	'0M244',	'MISIONERAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0216',	'0M247',	'MILO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0217',	'0M268',	'MARCUZZI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0218',	'0M275',	'MARCU',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0219',	'0M278',	'MASEFER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0220',	'0M283',	'MINCHIOTTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0221',	'0M286',	'MERCADOLIB',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0222',	'0M288',	'SUCRE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0223',	'0M290',	'MARTINEZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0224',	'0M296',	'MV SERVICE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0225',	'0M298',	'JAMA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0226',	'0N001',	'NOSIS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0227',	'0N004',	'CERETTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0228',	'0N022',	'N.R.Z.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0229',	'0N028',	'NORAN ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0230',	'0N034',	'NUT HOST',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0231',	'0N053',	'NAPO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0232',	'0N062',	'NAVASLARES',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0233',	'0N063',	'NANNINI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0234',	'0O008',	'OP.EST.SER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0235',	'0O019',	'OGLIENGO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0236',	'0O027',	'OSDE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0237',	'0O042',	'OLMEDO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0238',	'0O044',	'OSIM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0239',	'0O048',	'OSMOVIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0240',	'0O052',	'OLEO GEA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0241',	'0P012',	'PEPPA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0242',	'0P016',	'ECCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0243',	'0P039',	'PERALTAGOM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0244',	'0P047',	'PINTECORD',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0245',	'0P064',	'KENNAMETAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0246',	'0P065',	'PULVI MET.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0247',	'0P075',	'PISTOIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0248',	'0P084',	'SZUMIK',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0249',	'0P096',	'PRIMALCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0250',	'0P121',	'PAGLIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0251',	'0P132',	'PROIN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0252',	'0P180',	'PASUTTI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0253',	'0Q005',	'QUAKER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0254',	'0R011',	'RICHETTA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0255',	'0R015',	'POLAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0256',	'0R038',	'RC CONSULT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0257',	'0R042',	'LA VALVA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0258',	'0R049',	'SCAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0259',	'0R063',	'PMH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0260',	'0R064',	'REDIGAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0261',	'0R069',	'RECONQUIST',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0262',	'0R070',	'MEDITERRAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0263',	'0R076',	'REYNOSO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0264',	'0R078',	'TERRAGNI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0265',	'0R080',	'R. F.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0266',	'0R086',	'RODAM.ARG.',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0267',	'0R098',	'REFIL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0268',	'0R099',	'TECNI-COR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0269',	'0R106',	'ROSSI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0270',	'0R106',	'ROSSI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0271',	'0R111',	'CEBALL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0272',	'0R128',	'RUCCI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0273',	'0R129',	'RODABI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0274',	'0R136',	'REYNOSO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0275',	'0R139',	'RED PETRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0276',	'0R143',	'RIZZI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0277',	'0R144',	'ROSSO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0278',	'0R153',	'RESEARCH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0279',	'0R154',	'RANDSTAD',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0280',	'0R160',	'RESET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0281',	'0S027',	'SECO TOOLS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0282',	'0S039',	'SAILLEN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0283',	'0S049',	'SUMIAGRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0284',	'0S051',	'SIN-PAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0285',	'0S079',	'SIMBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0286',	'0S083',	'SOLDAAR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0287',	'0S085',	'SPECIALGAS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0288',	'0S111',	'SUPERCUT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0289',	'0S126',	'SAE GROUP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0290',	'0S156',	'SCHELSTRAE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0291',	'0S157',	'SOZZI CORN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0292',	'0S160',	'SERVIPLAST',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0293',	'0S162',	'SWISS MEDI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0294',	'0S177',	'SALTANOVIC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0295',	'0S187',	'SAV',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0296',	'0S188',	'SUPERCANAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0297',	'0S192',	'STI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0298',	'0S198',	'SIMES',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0299',	'0S205',	'SICCBA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0300',	'0S211',	'BEJERMAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0301',	'0T002',	'TYROLIT',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0302',	'0T004',	'TR MEDITER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0303',	'0T011',	'TRANSMECAN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0304',	'0T014',	'TORTONE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0305',	'0T035',	'TUV',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0306',	'0T040',	'MARRUCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0307',	'0T042',	'TECNIFOS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0308',	'0T059',	'TOMASSINI',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0309',	'0T068',	'TELECTRA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0310',	'0T088',	'TANTAL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0311',	'0T125',	'LEVY',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0312',	'0T127',	'CLAVERO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0313',	'0T130',	'BOUZA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0314',	'0T133',	'TRAFOCOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0315',	'0T138',	'GONZALEZ',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0316',	'0T154',	'TECNOCOLON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0317',	'0T156',	'TODOS RETE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0318',	'0T162',	'MARCELITO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0319',	'0T163',	'TWO HEADS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0320',	'0T169',	'TOOLSMANIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0321',	'0T171',	'TORTONE HU',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0322',	'0T174',	'TRADIMEX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0323',	'0T176',	'TAEGUTEC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0324',	'0T179',	'TISSERA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0325',	'0U001',	'UPS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0326',	'0U004',	'UNC',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0327',	'0U010',	'UTP',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0328',	'0V004',	'VEGLIA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0329',	'0V005',	'VEPROMET',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0330',	'0V050',	'CARLA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0331',	'0V051',	'DIEGO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0332',	'0V052',	'MONICA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0333',	'0V053',	'MARCO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0334',	'0V054',	'SANDRO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0335',	'0V055',	'FLAVIO',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0336',	'0V056',	'DANIELA',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0337',	'0V062',	'VIDALES',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0338',	'0V065',	'VENEX',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0339',	'0V069',	'VOESTALPIN',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0340',	'0V070',	'VISTAGE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0341',	'0W006',	'WATSON',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0342',	'0W009',	'WURTH',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0343',	'0W011',	'WALTER',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0344',	'0W015',	'WARBEL',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0345',	'0W020',	'WSM',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0346',	'0X001',	'XAMPERS',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0347',	'0Z002',	'ZOFRACOR',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PVA-0348',	'0Z003',	'SCHELSTRAE',	1	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0001',	'187',	'UNIVERSAL ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0002',	'00115',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0003',	'00040',	'ANCOIL OLE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0004',	'00298',	'YPF REDUCC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0005',	'00164',	'ROBERTO SC',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0006',	'00141',	'YPF SANTA ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0007',	'00551',	'YPF AVIADO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0008',	'00050',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0009',	'00147',	'METALURGIC',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0010',	'00005',	'ANDREOLI D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0011',	'00143',	'GUARDESE E',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0012',	'00025',	'UBAMBA VIA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0013',	'176',	'LA CASA DE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0014',	'00004',	'DISMAR DE ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0015',	'00187',	'HERRAJES V',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0016',	'00110',	'EMBALPEL D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0017',	'00136',	'ALFA SERVI',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0018',	'00013',	'MICRONORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0019',	'00006',	'CREMASCO V',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0020',	'00638',	'PAMPERO RI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0021',	'00382',	'PETROBRAS ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0022',	'00100',	'ROBERTO CA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0023',	'00007',	'ROBERTO GE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0024',	'00093',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0025',	'00190',	'DIESEL CEN',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0026',	'00221',	'VILCHEZ WA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0027',	'00180',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0028',	'00108',	'LA CASA DE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0029',	'00006',	'OXIGENO UN',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0030',	'00068',	'REPUESTOS ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0031',	'00171',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0032',	'00042',	'HECTOR E S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0033',	'00107',	'MARTINEZ L',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0034',	'00051',	'FLETES LUC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0035',	'00086',	'LAVALLE CE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0036',	'00058',	'EMBALAJES ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0037',	'00122',	'CUYO FILTR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0038',	'00078',	'SELGOM',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0039',	'00149',	'SERVICIOS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0040',	'00028',	'SCHRO ROGE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0041',	'00089',	'SERVICENTR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0042',	'32',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0043',	'211',	'PINTU EXPR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0044',	'00195',	'BULONERIA ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0045',	'00144',	'EMBALAJE E',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0046',	'00163',	'DIESEL CAM',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0047',	'336',	'EESS  EL C',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0048',	'00209',	'YPF DE MIG',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0049',	'00016',	'TODOLANDIA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0050',	'00020',	'ZELAYA JOS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0051',	'00183',	'GOMERIA Y ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0052',	'00193',	'EST. DE SE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0053',	'00045',	'GUARGNOLO ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0054',	'00021',	'GUDIÑO LUI',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0055',	'00065',	'HOTEL BELL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0056',	'00627',	'LA CUEVA D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0057',	'00126',	'METALÚRGIC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0058',	'00039',	'RODATUC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0059',	'00156',	'ZAIDA SERV',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0060',	'00345',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0061',	'00124',	'CLEMENZ AB',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0062',	'167',	'REPUESTOS ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0063',	'00217',	'LIMPITO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0064',	'00043',	'MAGGI RAUL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0065',	'00052',	'TODO VOLKS',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0066',	'00031',	'JENSEN JOS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0067',	'101',	'BORGIA LUI',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0068',	'00013',	'LIBERTAD D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0069',	'00135',	'AUTOMEC RE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0070',	'00093',	'CAVELLO JO',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0071',	'147',	'MARINERO A',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0072',	'00140',	'RAUL ALONS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0073',	'196',	'HOTEL CARM',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0074',	'177',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0075',	'00089',	'EE.SS PETR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0076',	'00163',	'CENTRO REN',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0077',	'00396',	'COMBUSTIBL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0078',	'1',	'ARGENSOLD',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0079',	'279',	'TRANSPORTE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0080',	'00033',	'TRACTOFER',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0081',	'266',	'ASTORGA AN',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0082',	'00099',	'HIDRA FIL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0083',	'00028',	'TECNOSERVI',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0084',	'00003',	'TORNIBULON',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0085',	'00466',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0086',	'00230',	'YPF MAGDAL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0087',	'2218',	'AVELLANEDA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0088',	'00084',	'HIMAN',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0089',	'00074',	'BOSSA JOSE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0090',	'00032',	'BIRKENMAIE',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0091',	'286',	'LEILA JACI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0092',	'166',	'PETROSOL D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0093',	'00026',	'TRANSPORTE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0094',	'00135',	'TODO CONEX',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0095',	'00066',	'ARGUELLO J',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0096',	'26',	'Matafuegos',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0097',	'1144',	'ESCAPES FA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0098',	'00175',	'ALQUIMAQ A',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0099',	'00061',	'DUHALDE RO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0100',	'109',	'INSER  CAR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0101',	'14',	'POTENCIA F',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0102',	'00025',	'RAUL AMBRO',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0103',	'00042',	'VELAZQUEZ ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0104',	'00100',	'DI PIAZZA ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0105',	'177',	'RAIJMAN JO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0106',	'00315',	'VIDRIOS LH',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0107',	'00110',	'DAKAR AUTO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0108',	'00060',	'TAXI EXPRE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0109',	'00637',	'HORACIO JA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0110',	'00576',	'MAS COMBUS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0111',	'00649',	'CORPACK RA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0112',	'00114',	'PARUSSA SE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0113',	'56',	'A & G  FER',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0114',	'00201',	'FURLAN REF',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0115',	'00315',	'ENCENDIDO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0116',	'PX042',	'EXPRESO MI',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0117',	'00103',	'SANTONI HE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0118',	'00013',	'PS OLEOHID',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0119',	'00019',	'PEVERENGO ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0120',	'00077',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0121',	'00127',	'FIORE GIOR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0122',	'00004',	'AIASSA MAR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0123',	'00060',	'YPF LA BAL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0124',	'00006',	'CASA MALDO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0125',	'189',	'SUCESION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0126',	'00193',	'TODO CRIST',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0127',	'00058',	'TRUJILLO R',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0128',	'00049',	'YMOBERDORF',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0129',	'00041',	'DETOMA MAU',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0130',	'42',	'Libreria L',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0131',	'00096',	'ACUMULADOR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0132',	'25',	'Limpiomat',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0133',	'00188',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0134',	'00053',	'HIDRAULICA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0135',	'91',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0136',	'00108',	'GENESIO JU',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0137',	'PX057',	'BRIZIO FAB',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0138',	'00159',	'HERRERA FE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0139',	'251',	'COMBUSTIBL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0140',	'12',	'NORTPLAS  ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0141',	'00087',	'MANNA MARC',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0142',	'PX028',	'MAC LUBRIC',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0143',	'23',	'MICRON MEC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0144',	'228',	'BULONERA N',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0145',	'00021',	'EL  REY - ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0146',	'00353',	'IMPRENTA Z',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0147',	'00177',	'ERNESTO CH',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0148',	'106',	'BONO RAUL ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0149',	'00240',	'PEREZ GUST',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0150',	'00216',	'RIO SOFT',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0151',	'00607',	'RICARDO HA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0152',	'00055',	'BENITEZ WA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0153',	'00001',	'SERRANO EX',	6	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0154',	'207',	'LURO BUS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0155',	'00575',	'HIDRAULICA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0156',	'00199',	'HIDRAULICA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0157',	'00228',	'QUALITY SE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0158',	'00071',	'MORANDI JU',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0159',	'00014',	'TRANSUR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0160',	'00019',	'OLEOHIDRAU',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0161',	'00099',	'DISTRIBUID',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0162',	'00190',	'JULIO CESA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0163',	'00071',	'MENDOIKA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0164',	'00116',	'FRIZZA MAR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0165',	'00142',	'DATAMAK de',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0166',	'PX010',	'PUNTA CANA',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0167',	'00112',	'BRITO DARD',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0168',	'00130',	'DURAN ALEJ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0169',	'00106',	'CASTRO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0170',	'00184',	'TALLER INT',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0171',	'00031',	'LONERA COR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0172',	'299',	'LUBRICANTE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0173',	'00226',	'SELLOS LUJ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0174',	'00019',	'MOSTAR INF',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0175',	'00110',	'GILETTA MA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0176',	'00120',	'TUNINETTI ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0177',	'00031',	'CIPOLLONE ',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0178',	'00115',	'MACARIO CR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0179',	'00080',	'ACONCAGUA ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0180',	'101',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0181',	'00196',	'SERGIO REP',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0182',	'00191',	'EXPRESO EL',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0183',	'00085',	'SHELL   EL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0184',	'00117',	'MAKERS Log',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0185',	'00125',	'CLEMENZ FE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0186',	'00184',	'SAMPER ACC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0187',	'00186',	'MARIO PERE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0188',	'00651',	'TRANSPORTE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0189',	'00162',	'EST. DE SE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0190',	'84',	'.COM.AR  S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0191',	'00017',	'NIETO OSCA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0192',	'00049',	'EXPRESO GO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0193',	'00206',	'LUCAS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0194',	'54',	'MADERPLAK',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0195',	'230',	'CUTINI HOR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0196',	'68461',	'TRANSPORTR',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0197',	'02200',	'EL PORTEÑO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0198',	'285',	'RODIMAR RE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0199',	'00056',	'REINOSO RE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0200',	'00205',	'AGRO REPUE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0201',	'660',	'MEYER ROBE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0202',	'2213',	'TECNO SERV',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0203',	'16',	'Accesorios',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0204',	'164',	'ACO-FLEX',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0205',	'00616',	'RIVERO DIE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0206',	'101',	'LA CASA DE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0207',	'156',	'MONTEVERDE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0208',	'00043',	'DIEZ DIEGO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0209',	'84646',	'ORLANDO HE',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0210',	'00129',	'FERREYRA H',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0211',	'00560',	'FRANCO MAT',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0212',	'00247',	'LONGO MAXI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0213',	'00265',	'HIDRAULICA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0214',	'00099',	'SAENZ SEBA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0215',	'2211',	'CHAYA GERA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0216',	'00237',	'SERVI SUR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0217',	'00645',	'MULTI PLAS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0218',	'9',	'RADIADORES',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0219',	'205',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0220',	'00162',	'TRANS-JO-B',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0221',	'00631',	'MATAFUEGOS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0222',	'196',	'GIGENA GAS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0223',	'00053',	'CHEUQUECOY',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0224',	'214',	'SARACCO MA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0225',	'00104',	'CARIGNANO ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0226',	'00078',	'FELLO GAST',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0227',	'33',	'CORREA ROL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0228',	'00278',	'LIMPLUS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0229',	'00255',	'DISTRIBUID',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0230',	'186',	'URUTRAC RE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0231',	'00148',	'ALQUILA BA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0232',	'00091',	'NICOLAS R.',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0233',	'00210',	'CONDORI CO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0234',	'2212',	'Papelera S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0235',	'00038',	'IMPULSO RE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0236',	'00408',	'GNC LAS VA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0237',	'00081',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0238',	'112',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0239',	'184',	'HIDRAULICO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0240',	'2201',	'FILTROS  N',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0241',	'00120',	'TORRESSI M',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0242',	'97',	'MUNDO FIAT',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0243',	'00048',	'EXPRESO SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0244',	'00172',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0245',	'287',	'ENCENDIDO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0246',	'85',	'ANTINORO F',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0247',	'00129',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0248',	'139',	'CLAUDIO GU',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0249',	'00097',	'TRANS ALAS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0250',	'00069',	'MEDINA MAR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0251',	'00010',	'RODAMIENTO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0252',	'1135',	'ASTUR LUBR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0253',	'00629',	'BULONERIA ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0254',	'202',	'ALEGRE NAD',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0255',	'00036',	'ALEM GAS -',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0256',	'00117',	'GUDIÑO BRU',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0257',	'51',	'HOTEL PETI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0258',	'00165',	'MENDO CARG',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0259',	'00177',	'HIDROZA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0260',	'00349',	'HIDRAULICA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0261',	'00055',	'LUBRICENTR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0262',	'83',	'LA QUERENC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0263',	'00220',	'PETROBRAS ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0264',	'00111',	'LUBRICENTR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0265',	'00002',	'ALKAR BULO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0266',	'59',	'FERRETERIA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0267',	'00598',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0268',	'00619',	'GREGO GAS ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0269',	'00094',	'PAPELERA R',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0270',	'198',	'HOTEL ARIA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0271',	'00079',	'SANITARIOS',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0272',	'00086',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0273',	'287',	'ORTIZ BEAT',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0274',	'00067',	'HIDRAFIL D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0275',	'00198',	'MARTA FLOR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0276',	'00105',	'MOTORES CU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0277',	'157',	'SS LIMAY V',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0278',	'00238',	'SULLIVAN I',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0279',	'158',	'EL MUNDO D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0280',	'00123',	'MARCO VALL',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0281',	'00121',	'BOSSIO SIL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0282',	'2204',	'PINTURERIA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0283',	'00104',	'SALMO SUED',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0284',	'00061',	'BULONERIA ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0285',	'86',	'HOTEL DARC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0286',	'68',	'MORAN VIDR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0287',	'00115',	'ELECTRO FU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0288',	'00051',	'COPYROOM  ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0289',	'00203',	'ARGENTINA ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0290',	'00086',	'LOPEZ LUCI',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0291',	'00412',	'CAR-GAS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0292',	'00023',	'TRANSPORTE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0293',	'00632',	'TRANSPORTE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0294',	'00208',	'YPF ESTACI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0295',	'67',	'GRAFICA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0296',	'105',	'DIPIAZZA L',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0297',	'2209',	'ALVAREZ SI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0298',	'00138',	'AUTOCENTRO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0299',	'00140',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0300',	'61',	'TALLER HER',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0301',	'154',	'GONZALEZ S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0302',	'2210',	'TUCUMAN LI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0303',	'00639',	'LA PROVISI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0304',	'00171',	'Diario Los',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0305',	'00040',	'SIMONASSI ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0306',	'62',	'VESINM S.A',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0307',	'00124',	'PRA BALDI ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0308',	'111',	'LA FERRETE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0309',	'01980',	'AXION ENER',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0310',	'305',	'DEHEZA SAI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0311',	'219',	'BANESTO S.',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0312',	'00065',	'PLASTICAUC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0313',	'00076',	'COOP. AGRO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0314',	'13',	'REFRIGERAC',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0315',	'00067',	'TRANSPORTE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0316',	'00128',	'REALI HNOS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0317',	'00074',	'AGRO MAZZU',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0318',	'00085',	'SAN MARTIN',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0319',	'00001',	'ESTACION E',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0320',	'00176',	'CENTRO AUT',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0321',	'47',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0322',	'PX031',	'CENTRO GRA',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0323',	'00062',	'ERGUANTI H',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0324',	'160',	'YPF LAS CA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0325',	'00043',	'EQUIPOS CI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0326',	'00225',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0327',	'00084',	'YPF ACEICO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0328',	'00008',	'TRAPOLIMP ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0329',	'00001',	'CELSIUS CO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0330',	'00131',	'LIBRERIA L',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0331',	'00003',	'COOPERATIV',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0332',	'00075',	'RIBEIRO SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0333',	'00090',	'M. FERNAND',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0334',	'91',	'MERCANTE H',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0335',	'00175',	'YPF ALFRED',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0336',	'334',	'CASTILLO  ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0337',	'00402',	'CASA CATTA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0338',	'00064',	'PEDRO GENE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0339',	'00170',	'COOP. DE T',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0340',	'00299',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0341',	'00118',	'PATRICIO P',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0342',	'00018',	'BOCANERA S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0343',	'00311',	'COOP. AGRO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0344',	'00079',	'CORDOBA GO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0345',	'00392',	'ITALSERVIC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0346',	'00473',	'SOC. BOMBE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0347',	'209',	'GRAN HOTEL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0348',	'00065',	'OCA SA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0349',	'191',	'LA ESTRADE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0350',	'00068',	'ARIAS HNOS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0351',	'00102',	'TEKNO PINT',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0352',	'00039',	'BAHIA AUTO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0353',	'103',	'FORTUNATO ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0354',	'00185',	'EXPRESO MA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0355',	'00101',	'GARBARINO ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0356',	'00088',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0357',	'00008',	'SAN JUAN Y',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0358',	'PX038',	'PEUSSO S.A',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0359',	'00047',	'CAROSSIO ,',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0360',	'00112',	'ESSO SERVI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0361',	'114',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0362',	'00180',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0363',	'00008',	'CEBEMAR DI',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0364',	'7',	'EST. DE SE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0365',	'100',	'MACHENA SR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0366',	'00176',	'EXPRESO AF',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0367',	'00084',	'BUCCOLINI ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0368',	'337',	'SHELL  POR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0369',	'00042',	'RULEMANES ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0370',	'00636',	'MUSIMUNDO ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0371',	'00066',	'BOLLINI  S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0372',	'00112',	'PONZETTI H',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0373',	'00116',	'COOP. ELEC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0374',	'00004',	'E.P.E.',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0375',	'00657',	'COOP DE SE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0376',	'PX036',	'LA VELOZ D',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0377',	'34',	'URQUIZA SR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0378',	'00036',	'PULLMAN GR',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0379',	'00102',	'SIERRAS CO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0380',	'183',	'LA ESTRELL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0381',	'181',	'EL RAPIDO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0382',	'00031',	'EMPRESA EL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0383',	'00004',	'CENTRAL AR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0384',	'00011',	'TUS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0385',	'00014',	'EMPRESA TR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0386',	'00009',	'RIO PARANA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0387',	'PX001',	'SERVICENTR',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0388',	'195',	'CONDOR SER',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0389',	'00017',	'TORESA SAC',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0390',	'00043',	'LANDER SAI',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0391',	'00229',	'AUTOTRANSP',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0392',	'89',	'CORAFAL NO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0393',	'00236',	'REPUESTOS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0394',	'00100',	'PETROLURO ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0395',	'00257',	'PEDRO Y CA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0396',	'58',	'ATENOR HNO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0397',	'00071',	'ORLANDO FE',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0398',	'186',	'SERVI RUTA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0399',	'187',	'NITRAM',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0400',	'00199',	'CRUZ DEL S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0401',	'00104',	'MOTORES Y ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0402',	'00147',	'SAMACO SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0403',	'00168',	'SAN CAYETA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0404',	'00041',	'FALFER SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0405',	'00352',	'CARLETTI H',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0406',	'00092',	'GILI Y CIA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0407',	'00014',	'AUTOTRANSP',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0408',	'PX007',	'MIGUEL ANG',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0409',	'00140',	'KATSUDA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0410',	'00617',	'RADIO ELEC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0411',	'00191',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0412',	'1148',	'HOTEL CORA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0413',	'00164',	'VALLECITO ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0414',	'00022',	'EXPRESO LU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0415',	'PX044',	'LA COSTERA',	6	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0416',	'00387',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0417',	'00017',	'EL RAYO DE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0418',	'00320',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0419',	'00012',	'MARTINEZ G',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0420',	'00650',	'CABLEVISIO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0421',	'00104',	'OSVALDO GO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0422',	'00029',	'MADERAS MI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0423',	'00072',	'KVA ARGENT',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0424',	'00049',	'PLUSMAR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0425',	'00045',	'BP  SOLUCI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0426',	'00025',	'EXPRESO EN',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0427',	'00161',	'YPF SUCESO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0428',	'00079',	'EXPRESO CA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0429',	'71',	'LA SEVILLA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0430',	'00081',	'BALUT HNOS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0431',	'00105',	'Estacion S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0432',	'00068',	'POURTAU CO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0433',	'00009',	'LIBRERIA S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0434',	'00033',	'TECNIDRA S',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0435',	'00208',	'QUIMICA IN',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0436',	'00612',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0437',	'00142',	'5H * CINCO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0438',	'00186',	'CONTESUR S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0439',	'00016',	'RODEL SRL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0440',	'00119',	'YPF EL TRE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0441',	'00181',	'ELECTRICID',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0442',	'182',	'SAN ALBERT',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0443',	'00178',	'TRIGÜY Y L',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0444',	'22',	'SUPERMERCA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0445',	'00153',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0446',	'00261',	'CENCOSUD S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0447',	'60',	'SUMAJ SRL.',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0448',	'00503',	'ACEROS SOL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0449',	'00106',	'ANSELMI Y ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0450',	'214',	'PETROBRAS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0451',	'00015',	'LOPEZ HNOS',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0452',	'00033',	'FALDANI NE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0453',	'1981',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0454',	'00111',	'COMPANIA R',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0455',	'00028',	'ANDESMAR S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0456',	'00119',	'VALENTIN C',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0457',	'00030',	'ECCO S.A.',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0458',	'00157',	'EXPRESO TA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0459',	'00021',	'ED-MAR ELE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0460',	'20',	'REFINOR  -',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0461',	'00169',	'RECTIFICAC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0462',	'149',	'DAL-CON SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0463',	'PX003',	'ÑANDU PAK',	6	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0464',	'00056',	'PASCAL',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0465',	'00030',	'INTERNATIO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0466',	'48',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0467',	'00217',	'SIVAL SRL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0468',	'00096',	'C.C.C ( CO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0469',	'28',	'Hipermerca',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0470',	'00001',	'SAN JUAN M',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0471',	'282',	'GM ELECTRO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0472',	'00078',	'YPF ALEM Y',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0473',	'00109',	'COMERCIAL ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0474',	'00300',	'PETROSURCO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0475',	'1128',	'CIFAMA SRL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0476',	'00057',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0477',	'00076',	'ECI - DIME',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0478',	'00063',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0479',	'00189',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0480',	'00141',	'ALVAREZ NE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0481',	'00165',	'YPF - RED ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0482',	'00098',	'HIERRONORT',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0483',	'00037',	'SEGUMAK',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0484',	'1145',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0485',	'00036',	'MOVISTAR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0486',	'00077',	'CASA BUENO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0487',	'00241',	'PATRIGAS S',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0488',	'00124',	'EXPRESO RI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0489',	'00215',	'EXPRESO OL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0490',	'77',	'Luis A. Ca',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0491',	'00106',	'PARABRISAS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0492',	'00087',	'SUC. DE MA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0493',	'00226',	'SHELL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0494',	'270',	'GNC LA SER',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0495',	'00211',	'YPF ICARDI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0496',	'00078',	'COMBUSTIBL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0497',	'209',	'GNC BALCAR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0498',	'141',	'G.V.C  SRL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0499',	'00058',	'ROCA COMBU',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0500',	'272',	'MAXIGAS SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0501',	'00063',	'ALDO BOLZA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0502',	'00022',	'BAHIA JUGO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0503',	'189',	'CARLOS A. ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0504',	'PX051',	'TELECOM AR',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0505',	'00210',	'TELEFONICA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0506',	'207',	'SERVICENTR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0507',	'00108',	'EST. DE SE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0508',	'00050',	'ACEROS ACO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0509',	'00031',	'PEREZ CURB',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0510',	'206',	'YPF PUENTE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0511',	'113',	'SANCHEZ RE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0512',	'146',	'PETROGAS T',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0513',	'00002',	'CASA DE TO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0514',	'00209',	'MER-GAS SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0515',	'00219',	'VIA CARGO ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0516',	'255',	'GNC',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0517',	'70',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0518',	'259',	'RUBO S.A.',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0519',	'00057',	'PETROLAUQU',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0520',	'00038',	'LA TACUARI',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0521',	'00069',	'EMPRESA DE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0522',	'1140',	'EMFACO SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0523',	'55',	'PAULICH MA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0524',	'23',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0525',	'00041',	'PRECISION ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0526',	'00407',	'PETROBRAS',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0527',	'00054',	'PINTURERIA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0528',	'00031',	'KADIMA SIS',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0529',	'00192',	'ESTACION D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0530',	'1134',	'SANTA BARB',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0531',	'185',	'MAXICOR S.',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0532',	'258',	'GAS Y GAS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0533',	'PX050',	'EL PRACTIC',	6	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0534',	'00018',	'EDESUR S.A',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0535',	'00237',	'MERCADO EL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0536',	'00044',	'EXTINDHER ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0537',	'00035',	'ASTILLERO ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0538',	'PX052',	'ADT SECURI',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0539',	'4',	'METROGAS',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0540',	'00098',	'CAMUZZI GA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0541',	'00082',	'DACOSTA E ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0542',	'44',	'EDET. (EMP',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0543',	'00105',	'PALOMEQUE ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0544',	'00084',	'LA PAMPA G',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0545',	'50',	'GNC  SIGMA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0546',	'00002',	'JUAN Y ANT',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0547',	'200',	'HOTEL DEL ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0548',	'00063',	'YPF',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0549',	'00120',	'PETROBRAS ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0550',	'00224',	'SHELL (VIC',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0551',	'00137',	'EL PARADOR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0552',	'00209',	'EST. DE SE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0553',	'00104',	'SERVIMAR N',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0554',	'90',	'CIVE S.A C',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0555',	'00081',	'BELL GAS',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0556',	'00516',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0557',	'00623',	'DEMATOR SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0558',	'00611',	'PARADOR LU',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0559',	'00235',	'LA BARRANC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0560',	'00030',	'M.DONZELLI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0561',	'00177',	'LOGHITEC S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0562',	'00219',	'YPF ESTACI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0563',	'00174',	'GEOS SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0564',	'00008',	'PRODEL SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0565',	'00642',	'SALVAC SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0566',	'00608',	'MOTORES & ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0567',	'215',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0568',	'00169',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0569',	'00056',	'CRUZ DEL S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0570',	'00156',	'CENTRO GOM',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0571',	'00089',	'OLEOHIDRAU',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0572',	'00506',	'ROMA COMBU',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0573',	'00061',	'CENTRO HID',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0574',	'46',	'AVANZAR S.',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0575',	'00067',	'PETROFRIAS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0576',	'65',	'EESS  REFI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0577',	'283',	'PEVISA   S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0578',	'2208',	'GONZALEZ T',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0579',	'00065',	'VERDINI',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0580',	'00166',	'ICE GNC SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0581',	'00046',	'OPERADORA ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0582',	'00129',	'REPRESENTA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0583',	'00085',	'AGRICOLA F',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0584',	'00029',	'COMBUSTIBL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0585',	'00057',	'TRANSPORTE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0586',	'00194',	'AGRO REPUE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0587',	'00414',	'COMBUSTIBL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0588',	'PX013',	'PINTECORD ',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0589',	'00411',	'ALGARROBIT',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0590',	'252',	'CUBA SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0591',	'00068',	'PETROSAM S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0592',	'00053',	'LA CASA DE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0593',	'00497',	'HERRAJES M',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0594',	'00160',	'FIDESUR SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0595',	'00007',	'ESTACION D',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0596',	'162',	'LA COLONIA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0597',	'1147',	'V.T.V NORO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0598',	'210',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0599',	'169',	'APPLUS ITU',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0600',	'00120',	'ELI S.A.',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0601',	'00160',	'YPF-GNC LA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0602',	'31',	'Autoservic',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0603',	'00007',	'PRODUCCION',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0604',	'74',	'PETROARSA ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0605',	'00077',	'ARROYO DUA',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0606',	'69',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0607',	'00007',	'TASCAR S.R',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0608',	'00059',	'LA POSTA D',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0609',	'00133',	'PETROPAMPA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0610',	'151',	'CHRICER SA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0611',	'152',	'LUCAIOLI',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0612',	'00067',	'GAMA SRL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0613',	'00203',	'EXPRESO DE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0614',	'00082',	'LA PLAZA S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0615',	'162',	'HOTEL VIEN',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0616',	'145',	'COMBUSTIBL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0617',	'38',	'PIAZZA S.A',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0618',	'104',	'LEON ALPER',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0619',	'49',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0620',	'293',	'OPESSA AUS',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0621',	'00029',	'MICRONORTE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0622',	'33',	'DEBONA MAR',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0623',	'00010',	'BUSES LEP',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0624',	'00130',	'DUEL SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0625',	'00069',	'SERVICENTR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0626',	'00041',	'EDES EMPRE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0627',	'00024',	'COMBUSTIBL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0628',	'47',	'ESTAC DE S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0629',	'00212',	'PAN AMERIC',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0630',	'00051',	'OLEOHIDRAU',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0631',	'144',	'REPUESTOS ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0632',	'205',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0633',	'00266',	'EICHLER SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0634',	'00257',	'REPUESTOS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0635',	'00176',	'ENERQUEN S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0636',	'00173',	'PARADOR RU',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0637',	'75',	'PETROCELA ',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0638',	'00117',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0639',	'00214',	'AGUADAS RI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0640',	'00641',	'MARIJO SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0641',	'183',	'EXPRESO EL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0642',	'00034',	'VERION I.C',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0643',	'00094',	'SLP SERVIC',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0644',	'00172',	'PETROBRAS ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0645',	'00145',	'INDESER SR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0646',	'202',	'ESTACIONES',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0647',	'PX015',	'EXPRESO BR',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0648',	'1157',	'L´EXPRESS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0649',	'76',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0650',	'00170',	'FLORENA eq',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0651',	'PX047',	'INTERCORDO',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0652',	'213',	'TRECONT SO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0653',	'00020',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0654',	'00023',	'UNION SRL',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0655',	'00138',	'ENCENDIDO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0656',	'00055',	'PETROESTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0657',	'00122',	'ACCESORIOS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0658',	'00012',	'TOTAL SRL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0659',	'00113',	'ZAPATA GOM',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0660',	'PX055',	'MAG SRL',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0661',	'00394',	'SABY HNOS ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0662',	'00126',	'TOMASGO S.',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0663',	'1027',	'BRAGAS SRL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0664',	'00391',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0665',	'00198',	'MORO HIDRA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0666',	'PX014',	'CHEVALLIER',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0667',	'264',	'SUMI S.A. ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0668',	'00062',	'YPF PANAME',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0669',	'00018',	'HYTEC SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0670',	'00056',	'RODRIGUEZ ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0671',	'00095',	'STAMP  SRL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0672',	'247',	'SERVICENTR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0673',	'00168',	'ELECTRO DO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0674',	'00001',	'PENTACOMB ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0675',	'00169',	'HAYCAR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0676',	'00091',	'GEOGAS SRL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0677',	'00234',	'CHATEL SA ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0678',	'98',	'Estacion d',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0679',	'00144',	'EL QUEBRAC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0680',	'00232',	'ENCENDIDO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0681',	'00197',	'HIDRAULICA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0682',	'00256',	'SALVADOR S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0683',	'00194',	'GRUPO SERR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0684',	'00052',	'ARRIETA SE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0685',	'00118',	'RAPI FLET ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0686',	'00180',	'SEOL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0687',	'00057',	'COMERCIAL ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0688',	'00077',	'CRUCERO DE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0689',	'00062',	'PRETROGUAZ',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0690',	'00232',	'BECHER LOG',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0691',	'100',	'PETROBAN S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0692',	'00167',	'ESSO SERVI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0693',	'00074',	'YPF GENERA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0694',	'00046',	'PROPACK SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0695',	'00037',	'ABSA AGUAS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0696',	'00013',	'ENCOPRESS ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0697',	'00107',	'ALFA RODAM',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0698',	'00072',	'LAS SIERRA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0699',	'PX023',	'INTEGRAL P',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0700',	'00032',	'MAQOIL  SA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0701',	'00074',	'kEH-COM S.',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0702',	'1025',	'EXFAKO SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0703',	'93',	'diviani gn',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0704',	'00063',	'I-RON S.R.',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0705',	'00200',	'PINTURERIA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0706',	'00080',	'SHELL AUTO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0707',	'00022',	'IMHOFF HER',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0708',	'00047',	'TRANSPORTE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0709',	'51898',	'TAPIA TRAC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0710',	'00220',	'ACEROS RIO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0711',	'00086',	'LAS ACACIA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0712',	'00333',	'EESS  YPF ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0713',	'00150',	'AUTOMECANI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0714',	'00103',	'LA PICHONA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0715',	'00234',	'ESTACION L',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0716',	'00013',	'BULONERA C',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0717',	'00409',	'COMBUSTIBL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0718',	'00211',	'GRAL. PACH',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0719',	'00207',	'AV EXPRESS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0720',	'00144',	'CARBOMEN S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0721',	'225',	'EG TRANSPO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0722',	'174',	'MARTINEZ D',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0723',	'00110',	'LA CUEVA R',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0724',	'00157',	'CERRO INDU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0725',	'2216',	'VTV  LA BA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0726',	'00072',	'YPF LOS OL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0727',	'00029',	'DISTRIBUID',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0728',	'00048',	'RODAEVER  ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0729',	'78',	'NORGAS S.R',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0730',	'1026',	'THAGAS SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0731',	'00115',	'METALGOM S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0732',	'1126',	'LA FONTANA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0733',	'00036',	'CORREO OFI',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0734',	'00170',	'ITALSERVIC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0735',	'00011',	'ANDRES MER',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0736',	'00401',	'SERVICENTR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0737',	'00114',	'CASA ELICE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0738',	'00013',	'SAT',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0739',	'1024',	'SERVIDUAL ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0740',	'284',	'R.F  TRANS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0741',	'00001',	'ANDRECARGA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0742',	'338',	'LA RED  SA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0743',	'00171',	'ECO COMBUS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0744',	'00106',	'TODO COMPU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0745',	'00106',	'GRIMAU NEU',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0746',	'00064',	'EVER WEAR ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0747',	'00007',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0748',	'00017',	'JUMBO MEND',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0749',	'00044',	'HERBO MEND',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0750',	'00131',	'SHELL LA F',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0751',	'87',	'Estacion V',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0752',	'00219',	'GROSCAN SR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0753',	'30',	'MUNDO FERR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0754',	'1029',	'LAS FLORES',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0755',	'00502',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0756',	'00203',	'XIUN SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0757',	'00621',	'F & C GRUP',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0758',	'00233',	'PETRO NORT',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0759',	'00084',	'LUIS Y NOR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0760',	'00255',	'WIND S.A. ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0761',	'00139',	'LUBRICENTR',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0762',	'00075',	'INTERGAS S',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0763',	'00173',	'ROBERTO SO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0764',	'00217',	'KM 711 SA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0765',	'00030',	'EMDA HIDRA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0766',	'00090',	'centro de ',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0767',	'00191',	'PETROAZUL ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0768',	'00056',	'BORTOLON Y',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0769',	'107',	'HOTEL MIRA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0770',	'179',	'AGRO RUTA ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0771',	'39',	'Transporte',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0772',	'00062',	'SERVEN S.A',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0773',	'00248',	'MENDOZA FU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0774',	'00088',	'LA AGUADA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0775',	'00082',	'OFIMAX de ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0776',	'00231',	'REPUESTOS ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0777',	'00128',	'AIASSA DIE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0778',	'00069',	'LFS COMBUS',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0779',	'00264',	'REVISIONES',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0780',	'161',	'RUTA 33',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0781',	'00151',	'BAMORE SRL',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0782',	'00197',	'HARD WORKE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0783',	'00057',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0784',	'596',	'ALTECO SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0785',	'00113',	'GIORDANO V',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0786',	'1030',	'GNC DEL CA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0787',	'00008',	'AGUAS SANT',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0788',	'203',	'SHELL SHOP',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0789',	'00021',	'AGUAS y SA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0790',	'00077',	'LOGISTICA ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0791',	'138',	'JENSPECK S',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0792',	'00083',	'EL ARENAL ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0793',	'00088',	'CAÑIFLEX D',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0794',	'00221',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0795',	'24',	'IPEVESA S.',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0796',	'157',	'ESTACION D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0797',	'36',	'CENTRAL NO',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0798',	'00097',	'SERVICIOS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0799',	'00145',	'PALMA SCAP',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0800',	'00187',	'TALLERES S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0801',	'24',	'RTO REVISI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0802',	'00313',	'MERCEDES E',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0803',	'00080',	'MASSIO S.A',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0804',	'166',	'KNG NEUMAT',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0805',	'52',	'RESMATUC S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0806',	'00622',	'FINRIO SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0807',	'254',	'GNC LEZAMA',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0808',	'121',	'GODINO HNO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0809',	'00189',	'MANTELLO N',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0810',	'280',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0811',	'00020',	'PAPELERA G',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0812',	'00146',	'TORNERIA M',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0813',	'00499',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0814',	'1150',	'SALADILLO ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0815',	'00080',	'HIDRA COR ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0816',	'597',	'METALURGIC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0817',	'2203',	'LUBRE S.R.',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0818',	'00024',	'REPUESTOS ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0819',	'00262',	'WINE GAS S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0820',	'73',	'HOTEL GREG',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0821',	'281',	'ESTACION S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0822',	'00658',	'PLANTA SEG',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0823',	'00094',	'GROSSO TRA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0824',	'PX048',	'SENDBOX',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0825',	'00253',	'EXPRESO VA',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0826',	'00413',	'TRANSBUS J',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0827',	'00256',	'REAL COLOR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0828',	'00212',	'ANCOIL SA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0829',	'00201',	'DRAGOMEN A',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0830',	'163',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0831',	'00235',	'PUNTA CAÑU',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0832',	'00385',	'AGROSERVIC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0833',	'00150',	'ALL SERVIC',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0834',	'00073',	'ANKA LOGIS',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0835',	'00655',	'SERVICIOS ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0836',	'00630',	'FINARVIS G',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0837',	'110',	'PETROLERA ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0838',	'00197',	'DOÑA RAMON',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0839',	'1133',	'PETRO ROLD',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0840',	'00039',	'REPIC ASEN',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0841',	'53',	'JET  EXPRE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0842',	'222',	'COMBUSTIBL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0843',	'204',	'GASIFICADO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0844',	'00652',	'BUENO GROU',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0845',	'00263',	'MARCO VALL',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0846',	'00620',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0847',	'00628',	'RIO CUARTO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0848',	'221',	'PACKSUR S.',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0849',	'00647',	'FEDECAR SA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0850',	'00085',	'PELLEGRINI',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0851',	'00088',	'ASUPAPEL  ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0852',	'00215',	'SERVEX PAN',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0853',	'1127',	'NCT SRL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0854',	'00109',	'BIAVA OSCA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0855',	'00107',	'Seguridad ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0856',	'223',	'EL PRINCIP',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0857',	'285',	'COMBUSTIBL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0858',	'283',	'BULONERA D',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0859',	'00022',	'MAROLA ATI',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0860',	'00061',	'EMUGAS S.A',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0861',	'150',	'EL COYOTE ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0862',	'206',	'MD CARGAS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0863',	'00656',	'LH PLAST S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0864',	'00252',	'TECNOLUBE ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0865',	'201',	'ZITO Y PRI',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0866',	'00054',	'FASIK  SRL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0867',	'00107',	'VALSUSO SR',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0868',	'00136',	'AUTOWAGEN ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0869',	'1154',	'OPERADORA ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0870',	'224',	'ROGELIO Y ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0871',	'00094',	'OLEOHIDRAU',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0872',	'6836',	'COMBUSTIBL',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0873',	'1124',	'SERVICIOS ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0874',	'00251',	'SERVIMEC C',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0875',	'00091',	'ECO COLOR ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0876',	'00057',	'HIDRAULICA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0877',	'191',	'CARLOS ANS',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0878',	'2220',	'PAMPENORTE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0879',	'00653',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0880',	'340',	'TS  OASIS ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0881',	'00038',	'TRANSPORTE',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0882',	'00223',	'GNC AU VIL',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0883',	'00072',	'ACTIVE SEC',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0884',	'00126',	'GNC FULL S',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0885',	'00089',	'MAC S.R.L',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0886',	'80',	'AGRO PARTE',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0887',	'00122',	'FSN REPUES',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0888',	'00027',	'FRANMA  SR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0889',	'339',	'EST.  BICE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0890',	'79',	'F &  M  SR',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0891',	'00659',	'MAR JOUS S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0892',	'35',	'SEGURIDAD ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0893',	'00103',	'DIVISION S',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0894',	'145',	'CENTRAL DE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0895',	'26',	'COMBUSTIBL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0896',	'6838',	'CLUB ECLIP',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0897',	'00126',	'MASTER GEA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0898',	'335',	'LA COLORAD',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0899',	'00205',	'TECHNOLOGY',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0900',	'25',	'EXPRESO DE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0901',	'00626',	'SERVICENTR',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0902',	'87',	'AIRON SRL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0903',	'00021',	'EXPRESO CU',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0904',	'00096',	'MOGUS SRL',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0905',	'8',	'CASA AHUAL',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0906',	'00654',	'LA PAMPAGO',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0907',	'2202',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0908',	'282',	'NEUMATICOS',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0909',	'00300',	'EL OMBU GR',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0910',	'00216',	'EMPRESA CO',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0911',	'00006',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0912',	'00015',	'GIUSTA JAV',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0913',	'00111',	'ARGUELLO R',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0914',	'00127',	'DINAMICA &',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0915',	'00400',	'AMOR Y PAZ',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0916',	'00130',	'METALURGIC',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0917',	'342',	'ESTACION P',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0918',	'2205',	'TRANSPORTE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0919',	'00048',	'SERVICIOS ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0920',	'228',	'RAYO VIGIL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0921',	'00009',	'FERRETERIA',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0922',	'229',	'TRANSPORTE',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0923',	'00050',	'EPEC',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0924',	'00037',	'PUNTAL SRL',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0925',	'00049',	'RICARDO RI',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0926',	'00102',	'FRANCISCO ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0927',	'00134',	'LA CAMIONE',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0928',	'00010',	'ESTACION D',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0929',	'00087',	'EL PLATA S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0930',	'00233',	'OFICASA',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0931',	'00052',	'GENOVESI H',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0932',	'00125',	'QUIMICUY S',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0933',	'2217',	'Sanatorio ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0934',	'00047',	'CATA CARGO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0935',	'181',	'CASA BERNA',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0936',	'00515',	'ESTACION D',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0937',	'00185',	'VIVERO PAL',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0938',	'00102',	'BAHIA FILT',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0939',	'18',	'TRANSPORTE',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0940',	'268',	'GUAYABERA ',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0941',	'00105',	'BOTTA RESP',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0942',	'00130',	'EL MAGO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0943',	'00121',	'SERVICENTR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0944',	'00055',	'EL CRUCE',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0945',	'00045',	'PAMPACER S',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0946',	'PX054',	'DISTRIBUID',	4	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0947',	'00179',	'EL LUCERO ',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0948',	'00079',	'venado con',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0949',	'46',	'MESSINA S.',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0950',	'148',	'VTV VERIFI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0951',	'102',	'PAKING EXP',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0952',	'00061',	'LA CUARTA ',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0953',	'265',	'RUMAOS S.A',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0954',	'592',	'CORREO AND',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0955',	'00067',	'NICO',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0956',	'00014',	'LOGISTICA ',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0957',	'29',	'PETROLUC .',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0958',	'00070',	'BUS PACK S',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0959',	'00002',	'CSS COMPAN',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0960',	'00202',	'MAPUCHE SR',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0961',	'00142',	'RIO SALADO',	2	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0962',	'00065',	'LOI S.R.L.',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0963',	'00061',	'ESTACION D',	8	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0964',	'00155',	'IRON BLACK',	5	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0965',	'00614',	'GOLF S.A.',	7	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0966',	'108',	'SAN LUIS S',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0967',	'105',	'JOSE VIÑA',	10	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0968',	'00099',	'CILINDROS ',	9	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0969',	'199',	'PUNTO MEDI',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0970',	'290',	'CASEROS GN',	3	)
		INSERT INTO #DatosProveedores VALUES	(	'PSU-0971',	'00268',	'SERVILIM S',	5	)



		CREATE TABLE #ConsultaDatosProveedor (
			idDatosProvedor INTEGER NOT NULL,
			descripcion VARCHAR(25) NOT NULL
		)


		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'PAR'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'PAR'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'PAR'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'PAR'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'CBA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BAH'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'ROS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'RIOIV'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'TUC'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'SFCO'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'BSAS'
		INSERT INTO #ConsultaDatosProveedor SELECT idSucursal, descripcion FROM #tmpSucursal WHERE descripcion = 'MZA'


CREATE TABLE #ProveedoresData (
	PR_CODPOS NVARCHAR(8) NULL,
	TIP_CODIGO NVARCHAR(2) NULL,
	PR_POSIBR SMALLINT NULL,
	PR_LOCALI NVARCHAR(30) NULL,
	PR_EMAIL NVARCHAR(40) NULL,
	PR_TELEF2 NVARCHAR(30) NULL,
	PR_TELEF1 NVARCHAR(30) NULL,
	PR_CATGAN SMALLINT NULL,
	PR_CONTAC NVARCHAR(40) NULL,
	PR_CATIBR SMALLINT NULL,
	PR_DIRECC NVARCHAR(30) NULL,
	CCM_CODIGO NVARCHAR(3) NULL,
	PR_IBR NVARCHAR(12) NULL,
	PR_CUIT NVARCHAR(13) NULL,
	PR_IVA SMALLINT NULL,
	PR_NOMBRE NVARCHAR(40) NULL,
	PO_CODIGO NVARCHAR(2) NULL,
	PR_DATOS NVARCHAR(4000) NULL,
	PL_IVANOI NVARCHAR(4) NULL,
	PL_OPC03 NVARCHAR(4) NULL,
	PL_OPC02 NVARCHAR(4) NULL,
	PR_POSGAN SMALLINT NULL,
	PL_IVA27 NVARCHAR(4) NULL,
	PL_IVAINS NVARCHAR(4) NULL,
	PL_IMPINT NVARCHAR(4) NULL,
	PL_PERCEP NVARCHAR(4) NULL,
	PL_EXENTO NVARCHAR(4) NULL,
	PL_NOGRAV NVARCHAR(4) NULL,
	PL_APROVE NVARCHAR(4) NULL,
	PL_COMPRA NVARCHAR(4) NULL,
	PL_OPC01 NVARCHAR(4) NULL,
	PR_CODIGO NVARCHAR(5) NOT NULL,
	EG_CODIGO NVARCHAR(2) NULL,
	PR_CALSIJP NVARCHAR(1) NULL,
	CC_CODIGO NVARCHAR(3) NULL,
	PR_PORRETGAN FLOAT NULL,
	GRP_CODIGO NVARCHAR(4) NULL,
	ESP_CODIGO NVARCHAR(2) NULL,
	PR_FECHASGAN SMALLDATETIME NULL,
	PR_FECHASIBR SMALLDATETIME NULL,
	MO_CODIGO NVARCHAR(2) NULL,
	PR_FECHA_CAI SMALLDATETIME NULL,
	PR_NUMERO_CAI NVARCHAR(14) NULL,
	PR_CALRETLIMP NVARCHAR(1) NULL,
	PR_CALRETSEG VARCHAR(1) NULL,
	
	proveedor VARCHAR(50) NOT NULL,
	sigla VARCHAR(50) NOT NULL,
    descripcionCorta VARCHAR(50) NOT NULL,
	
)

--Tipo 1 Fabrica (53)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	,  prov.[proveedor], prov.[sigla], prov.[descripcionCorta] 
	FROM VenturiFabrica.dbo.PROVEEDORES proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 1


--Tipo 4 Cordoba (19)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	  proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	  proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	  proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	  proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	, prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.10.100].[CordobaZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON prov.sigla = proveed.PR_CODIGO
	WHERE prov.idSucurs = 4

					  

--Tipo 9 San Francisco  (80)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	  proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	  proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	  proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	  proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG],
	 prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.1.100].[SanFcoZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 9

	/*
--Tipo 7 Rio Cuarto  (202)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	  proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	  proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	  proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	  proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	,  prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.4.100].[RioIVZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 7*/

/*
--Tipo 5 Mendoza (139)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	   proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	   proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	   proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	   proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	,  proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	,  proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	,  prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.2.100].[MendozaZeus].[dbo].[PROVEEDORES] proveedINNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 5
	
	
--Tipo 2 Bahia Blanca (166)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	, prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.3.100].[BahiaZeus].[dbo].[PROVEEDORES] proveedINNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 2*/
						  
						  
--Tipo 10 Tucuman (170)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	, prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.6.100].[TucumanZeus].[dbo].[PROVEEDORES] proveed, #DatosProveedores prov 
	WHERE proveed.PR_CODIGO = prov.sigla AND prov.idSucurs = 10
						  

--Tipo 6 Parana (1)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	  proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	  proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	  proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	  proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	, proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	, proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	, prov.[proveedor], prov.[sigla],  prov.[descripcionCorta]
	FROM [172.17.7.100].[ParanaZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 6


--Tipo 8 Rosario (36)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	   proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	   proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	   proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	   proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	,  proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	,  proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	,  prov.[proveedor], prov.[sigla], prov.[descripcionCorta]
	FROM [172.17.8.100].[RosarioZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 8

						  
--Tipo 3 Bs As (155)
INSERT INTO #ProveedoresData
	SELECT DISTINCT proveed.[PR_CODPOS], proveed.[TIP_CODIGO], proveed.[PR_POSIBR], proveed.[PR_LOCALI], proveed.[PR_EMAIL], 
	   proveed.[PR_TELEF2], proveed.[PR_TELEF1], proveed.[PR_CATGAN], proveed.[PR_CONTAC], proveed.[PR_CATIBR], proveed.[PR_DIRECC],
	   proveed.[CCM_CODIGO], proveed.[PR_IBR], proveed.[PR_CUIT], proveed.[PR_IVA], proveed.[PR_NOMBRE], proveed.[PO_CODIGO], proveed.[PR_DATOS], 
	   proveed.[PL_IVANOI], proveed.[PL_OPC03], proveed.[PL_OPC02], proveed.[PR_POSGAN], proveed.[PL_IVA27], proveed.[PL_IVAINS], proveed.[PL_IMPINT],
	   proveed.[PL_PERCEP], proveed.[PL_EXENTO], proveed.[PL_NOGRAV], proveed.[PL_APROVE], proveed.[PL_COMPRA], proveed.[PL_OPC01], proveed.[PR_CODIGO] 
	,  proveed.[EG_CODIGO], proveed.[PR_CALSIJP], proveed.[CC_CODIGO], proveed.[PR_PORRETGAN], proveed.[GRP_CODIGO], proveed.[ESP_CODIGO], proveed.[PR_FECHASGAN] 
	,  proveed.[PR_FECHASIBR], proveed.[MO_CODIGO], proveed.[PR_FECHA_CAI], proveed.[PR_NUMERO_CAI], proveed.[PR_CALRETLIMP], proveed.[PR_CALRETSEG]
	,  prov.[proveedor], prov.[sigla],  prov.[descripcionCorta]
	FROM [172.17.9.100].[BsAsZeus].[dbo].[PROVEEDORES] proveed
	INNER JOIN #DatosProveedores prov 
	ON proveed.PR_CODIGO = prov.sigla 
	WHERE prov.idSucurs = 3  


CREATE TABLE ##TMPTABLE_PROVEEDOR
(  
	          INDICADOR_B    VARCHAR (2)not null,
			  [BSGCOD]       NVARCHAR(2)  null,
			  [BPSNUM]       NVARCHAR(max)null,
			  [ENAFLG]       INT NULL,
			  [BPRNAM]       NVARCHAR( 40)null,
			  [BPRSHO]       NVARCHAR (40)null,
			  [CRY]          NVARCHAR(max)null,
			  [LAN]          NVARCHAR  (3)null,
			  [CRN]          NVARCHAR (13)null,
			  [CUR]          NVARCHAR  (3)null,
			  [ABCCLS]       VARCHAR   (2)null, 
			  [PLISTC]       NVARCHAR (max)null,
			  [BPTNUM]       NVARCHAR (max)null,
			  [MDL]          VARCHAR  (2)null,
			  [EECICT]       NVARCHAR (max)null,
			  [BPSTYP]       INT null,
			  [MATTOL]       NVARCHAR (max)null,
			  [OSTCTL]       INT null,
			  [OSTAUZAMT]    NVARCHAR (max)null,
			  [PAYLOKFLG]    INT null,
			  [DOUFLG]       INT null,
			  [TSSCOD(0)]    NVARCHAR (max)null,
			  [TSSCOD(1)]    NVARCHAR (max)null,
			  [TSSCOD(2)]    NVARCHAR (max)null,
			  [TSSCOD(3)]    NVARCHAR (max)null,
			  [ACCCOD]       NVARCHAR (max)null,
			  [PTE]          NVARCHAR (40)null,
			  [VACBPR]       NVARCHAR (max) null, 
			  [XX12CHQNAM]   NVARCHAR (max)null,
			  [XX12CHQORD]   NVARCHAR (max)null,
			  [XX12BPSCBU]   NVARCHAR (max)null,
			  [XX12NIF]      NVARCHAR (13)null,
			  [XX12PERFLG]   NVARCHAR (max)null,
			  [XX12SITGAN]   NVARCHAR (max) null,
			  [XX12REGIIBB]  NVARCHAR (max) null,
			  [XX12IIBB]     NVARCHAR (13)null,
			  [XX12DOCTYP]   INT null,
			  [XX12DOCNUM]   NVARCHAR (13)null,
			  [XX12MTBBPR]   NVARCHAR (max)null,
			  [XX12BPSEMB]   NVARCHAR (max)null, 
			  [XX12BPRINT]   INT null,
			  [XX12CTRFIS]   NVARCHAR (max)null,
			  [XX12SITIBCAB] NVARCHAR (max)null,
			  [XX12ALLRET]   VARCHAR  (2)null,
			  [*71]          NVARCHAR (max)null,
			  [*72]          NVARCHAR (max)null, 
			  [*81]          NVARCHAR (max)null,
			  [*82]          NVARCHAR (max)null,


			  INDICADOR_A    VARCHAR  (2)not null,
			  [BPAADD]       NVARCHAR (3)null,
			  [BPADES]       NVARCHAR (40)null,
			  [BPAADDLIG(0)] NVARCHAR (30)null,
			  [BPAADDLIG(1)] NVARCHAR (30)null,
			  [POSCOD]       NVARCHAR (40) null,
			  [CRY2]         NVARCHAR (40)null,
			  [BPAADDFLG]    INT null,
			  [TEL(0)]       NVARCHAR (30)null,
			  [TEL(1)]       NVARCHAR (30)null,
			  [FAX]          NVARCHAR (40)null,
			  [FCYWEB]       NVARCHAR (50)null,
			  [WEB(0)]       NVARCHAR (40)null,
			  [WEB(1)]       NVARCHAR (50)null,


			  INDICADOR_C    VARCHAR  (2)not null,
			  [CCNCRM]       NVARCHAR (80)null,
			  [CNTTTL]       NVARCHAR (20)null,
			  [CNTFNA]       NVARCHAR (80)null,
			  [CNTLNA]       NVARCHAR (20)null,
			  [TEL]          NVARCHAR (20)null,
			  [WEB]          NVARCHAR (80)null,
			  [CNTFNC]       NVARCHAR (40)null,
			  [CNTMSS]       NVARCHAR (40)null,


			  INDICADOR_O    VARCHAR  (2)not null,
			  [ODFCOD]       NVARCHAR (80)null,
			  [ODFVAL]       NVARCHAR (80)null,


			  INDICADOR_P    VARCHAR  (2)not null,
			  [SAT]          NVARCHAR (80)null, 
			  [DATDEB]       NVARCHAR (80)null,
			  [DATFIN]       NVARCHAR (80)null,


			  INDICADOR_R    VARCHAR  (2)not null,
			  [XX12CRET]     NVARCHAR (3)null
)


INSERT INTO ##TMPTABLE_PROVEEDOR
	  
	  SELECT  
		'B' AS 'INDICADOR_B',
		P.TIP_CODIGO AS [BSGCOD],									   --Categoría
		P.PR_CODIGO AS [BPSNUM]	,								       --Proveedor
	
		CASE P.[ESP_CODIGO]
			WHEN '01' THEN 2
			WHEN '02' THEN 1
			ELSE 2
		END AS [ENAFLG]	,											   --Activo  1) No  2) Si

		UPPER(LEFT(P.[PR_NOMBRE], 35))  AS [BPRNAM],				   --Razón Social

		LEFT (PR_NOMBRE,10) AS [BPRSHO],							   --Descrip. corta, abreviación de la razón social, se puede dejar en blanco

	
		        (SELECT CASE UPPER(PR.PO_DESCRI)
					--LISTADO PAISES
					WHEN 'BOLIVIA'    THEN 'BO' 
					WHEN 'BRASIL'     THEN 'BR' 
					WHEN 'ARGENTINA'  THEN 'AR'
					WHEN 'CHILE'      THEN 'CL'
					WHEN 'COLOMBIA'   THEN 'CO'
					WHEN 'ECUADOR'    THEN 'EC'
					WHEN 'ESTADOS UNIDOS' THEN 'US'
					WHEN 'GUATEMALA'  THEN 'GT'
					WHEN 'ITALIA'     THEN 'IT'
					WHEN 'MEXICO'     THEN 'MX'
					WHEN 'PANAMA'     THEN 'PA'
					WHEN 'PARAGUAY'   THEN 'PY'
					WHEN 'PERU'       THEN 'PE'
					WHEN 'SUIZA'      THEN 'SZ'
					WHEN 'UCRANIA'    THEN 'UA'
					WHEN 'URUGUAY'    THEN 'UY'
					WHEN 'VENEZUELA'  THEN 'VE'
			
					--PROVINCIAS
			        WHEN 'FORMOSA'    THEN 'AR'
			        WHEN 'JUJUY'      THEN 'AR'
			        WHEN 'LA PAMPA'   THEN 'AR'
			 	    WHEN 'LA RIOJA'   THEN 'AR'
				    WHEN 'MENDOZA'    THEN 'AR'
				    WHEN 'MISIONES'   THEN 'AR'
				    WHEN 'NEUQUEN'    THEN 'AR'
				    WHEN 'RIO NEGRO'  THEN 'AR'
				    WHEN 'BUENOS AIRES' THEN 'AR'
				    WHEN 'CAPITAL FEDERAL' THEN 'AR'
				    WHEN 'CATAMARCA'  THEN 'AR'
				    WHEN 'CHACO'      THEN 'AR'
				    WHEN 'CHUBUT'     THEN 'AR'
				    WHEN 'CORDOBA'    THEN 'AR'
				    WHEN 'CORRIENTES' THEN 'AR'
			 	    WHEN 'ENTRE RIOS' THEN 'AR'
				    WHEN 'SALTA'      THEN 'AR'
				    WHEN 'SAN JUAN'   THEN 'AR'
				    WHEN 'SAN LUIS'   THEN 'AR'
				    WHEN 'SANTA CRUZ' THEN 'AR'
				    WHEN 'SANTA FE'   THEN 'AR'
				    WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				    WHEN 'TUCUMAN'    THEN 'AR'
				    WHEN 'TIERRA DEL FUEGO'    THEN 'AR'
			    ELSE ''END)  AS [CRY],   									   --País  

		'SPA' AS [LAN],												       --Idioma del proveedor SPA-Español, ENG-Inglés
			

		REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','') AS [CRN],		       --N.I.F.  En Argentina es el número de CUIT

	   
		'ARS' AS [CUR],														--Divisa ARS Peso Argentino, USD Dólar
		'D'   AS [ABCCLS],												    --Categoría ABC  1) Clase A.  2) Clase B.  3)Clase C.  4)Clase D
		''    AS [PLISTC],													--Estructura tarifa
		''    AS [BPTNUM],													--Transportista
		''    AS [MDL],														--Modo de entrega
		''    AS [EECICT],													--Incoterm
		'1'   AS [BPSTYP],											        --Tipo proveedor  1) Normal  2) Prospecto  3) Varios
		''    AS [MATTOL],													--Regla conciliación
		'2'   AS [OSTCTL]	,										        --Control encurso    1) Controlado  2) Libre  3) Bloqueado
		''    AS [OSTAUZAMT],												--Encurso autorizado
		'1'   AS [PAYLOKFLG],											    --Bloqueo pago. 1) No  2) Si
		'1'   AS [DOUFLG],											        --Litigio.  1) No 2) Aviso  3) Bloqueante
		''    AS [TSSCOD(0)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(1)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(2)],												--Familia estadística DEFINIR
		''    AS [TSSCOD(3)],												--Familia estadística DEFINIR
		                                                                    --LEFT('AR_FOR_NAC', 10)
		'STD' AS [ACCCOD],											        --Código contable
	   
		 (CASE condCompra.CCM_CODIGO
		    WHEN '001' THEN '001'
			WHEN '002' THEN '004'
			WHEN '003' THEN '002'
			WHEN '004' THEN '007'
			WHEN '005' THEN '006'
			WHEN '006' THEN ''
			WHEN '007' THEN '005'
			WHEN '008' THEN '001'
            WHEN ''    THEN '001' 
		  END) AS [PTE],													--Condición pago
	  	   									

			
		CASE P.PR_IVA 
				WHEN 1 THEN 'CF'
				WHEN 2 THEN 'RI'
				WHEN 3 THEN 'RNI'
				WHEN 4 THEN 'EXE'
				WHEN 5 THEN ''
				WHEN 6 THEN ''
				WHEN 7 THEN 'EXE'
				WHEN 8 THEN 'RM'  --En Zeus 'Responsable Monotributo'- En SAGE 'Regimen Monotributista'
				WHEN 9 THEN 'RNC' --En Zeus 'Sujeto no categorizado' - En SAGE 'Responsable no categorizado'
				ELSE ''
		   END AS [VACBPR],		                                            --LEFT('ARS', 5)  AS [VACBPR], --Reg.impuesto										
	   	 
		'' AS [XX12CHQNAM],													--Cheque a la orden de (Razón social del beneficiario)
		'' AS [XX12CHQORD],													--Cheque no a la Orden. Si se utiliza cheques no a la orden, Opción 1) NO 2) SI
		'' AS [XX12BPSCBU],													--CBU de la cuenta bancaria asociada al proveedor	

		REPLACE(REPLACE(p.PR_CUIT, '-', ''), '.','')  AS [XX12NIF],		    --Número de CUIT/CUIL del cliente sin guiones

		'' AS [XX12PERFLG],													--Agente de Per. IVA


		(	CASE P.PR_POSGAN
				WHEN 1 THEN 'AC'
				WHEN 2 THEN 'NI'
				WHEN 3 THEN 'EX'
			END
		) AS [XX12SITGAN],			 				                        --Situación Ganancias    /*Verificar */
																		
		(CASE p.PR_CATIBR
			WHEN 0 THEN ''
			WHEN 1 THEN '2'
			WHEN 2 THEN '1'
		 END)  AS [XX12REGIIBB],											--Régimen IIBB   
																			/*
																				1) Convenio Multilateral (2 en Zeus) , 
																				2) Local (1 en Zeus ,  
																				3) Todas
																			*/																	
         (case P.PR_IBR
		     
			 when '' then p.PR_CUIT
			 else P.PR_IBR
	    end ) AS [XX12IIBB],
	
		--REPLACE(REPLACE(P.PR_IBR, '-', ''), '.','') AS [XX12IIBB],	    --Num Ingresos Brutos
		
		'80' AS [XX12DOCTYP],												--Tipo Documento.  CUIT: 80, CUIL:  86. DNI: 96

		REPLACE(REPLACE(P.PR_CUIT, '-', ''), '.','') AS [XX12DOCNUM],		--Número de Documento Ver guiones espacios
	
	   
		'' AS [XX12MTBBPR],												--Monotributo
		'' AS [XX12BPSEMB],												--Embargado, Se completara automaticamente con la importación de padrones. Dejar vacío.
		'1' AS [XX12BPRINT],											--Tercero Interno:  1) No -  2) Si
		'' AS [XX12CTRFIS],												--CAE no obligatorio.  1) No  - 2) Si
		'' AS [XX12SITIBCAB],											--Situación IB CABA. 1) Alto Riesgo 2) Reg. Simplificado 3) Reg. General
		'2' AS [XX12ALLRET],			 								--Todas las Retenciones. 1) No - 2) Si
		'' AS [*71],													--Texto pedido
		'' AS [*72],													--Texto pedido
		'' AS [*81],													--Texto devolución
		'' AS [*82],													--Texto devolución

		/************************************************INDICADOR A******************************************************************/

		'A' AS 'INDICADOR_A',	
		
		'PRI' AS [BPAADD],												--Dirección
		'PRINCIPAL' AS [BPADES]	,										--Descripción max 30
		UPPER(LEFT(P.[PR_DIRECC], 50)) AS [BPAADDLIG(0)],				--Línea dirección
		UPPER(SUBSTRING(P.[PR_DIRECC], 51, 50)) AS [BPAADDLIG(1)],		--Línea dirección

		P.PR_CODPOS AS [POSCOD],   --Código Postal
		                              
		 											                
		
		(SELECT CASE UPPER(PR.PO_DESCRI)
					--LISTADO PAISES
					WHEN 'BOLIVIA'   THEN 'BO' 
					WHEN 'BRASIL'    THEN 'BR' 
					WHEN 'ARGENTINA' THEN 'AR'
					WHEN 'CHILE'     THEN 'CL'
					WHEN 'COLOMBIA'  THEN 'CO'
					WHEN 'ECUADOR'   THEN 'EC'
					WHEN 'ESTADOS UNIDOS' THEN 'US'
					WHEN 'GUATEMALA' THEN 'GT'
					WHEN 'ITALIA'    THEN 'IT'
					WHEN 'MEXICO'    THEN 'MX'
					WHEN 'PANAMA'    THEN 'PA'
					WHEN 'PARAGUAY'  THEN 'PY'
					WHEN 'PERU'      THEN 'PE'
					WHEN 'SUIZA'     THEN 'SZ'
					WHEN 'UCRANIA'   THEN 'UA'
					WHEN 'URUGUAY'   THEN 'UY'
					WHEN 'VENEZUELA' THEN 'VE'
			
					--PROVINCIAS
					WHEN 'FORMOSA'  THEN 'AR'
				    WHEN 'JUJUY'    THEN 'AR'
				    WHEN 'LA PAMPA' THEN 'AR'
				    WHEN 'LA RIOJA' THEN 'AR'
				    WHEN 'MENDOZA'  THEN 'AR'
				    WHEN 'MISIONES' THEN 'AR'
				    WHEN 'NEUQUEN'  THEN 'AR'
				    WHEN 'RIO NEGRO'THEN 'AR'
				    WHEN 'BUENOS AIRES'    THEN 'AR'
				    WHEN 'CAPITAL FEDERAL' THEN 'AR'
				    WHEN 'CATAMARCA'  THEN 'AR'
				    WHEN 'CHACO'      THEN 'AR'
				    WHEN 'CHUBUT'     THEN 'AR'
				    WHEN 'CORDOBA'    THEN 'AR'
				    WHEN 'CORRIENTES' THEN 'AR'
				    WHEN 'ENTRE RIOS' THEN 'AR'
				    WHEN 'SALTA'      THEN 'AR'
				    WHEN 'SAN JUAN'   THEN 'AR'
				    WHEN 'SAN LUIS'   THEN 'AR'
				    WHEN 'SANTA CRUZ' THEN 'AR'
				    WHEN 'SANTA FE'   THEN 'AR'
				    WHEN 'SANTIAGO DEL ESTERO' THEN 'AR'
				    WHEN 'TUCUMAN'             THEN 'AR'
				    WHEN 'TIERRA DEL FUEGO'    THEN 'AR'

				    ELSE ''		END) AS [CRY2],                             --País
		   	
				   												    

		'002' AS [BPAADDFLG],													--Por defecto
        LEFT(P.[PR_TELEF1], 20) AS [TEL(0)], 								--Teléfono
		LEFT(P.[PR_TELEF2], 20) AS [TEL(1)],    							--Teléfono 
	    '' AS [FAX],														--Fax
		'' AS [FCYWEB],							    				        --Sitio Web
		UPPER(LEFT(P.[PR_EMAIL], 80)) AS [WEB(0)],							--Dirección Internet
		'' AS [WEB(1)],													    --Dirección Internet

		/************************************************INDICADOR_C***************************************************************/

		'C' AS 'INDICADOR_C',														
		
		'' AS [CCNCRM],														--Código contrato
		'SEÑOR' AS [CNTTTL],												--Trato   1-Señor, 2-Señora, 3-Señorita
		 LEFT(PR_NOMBRE,20) AS CNTFNA,                                      --Nombre
        'SD' AS [CNTLNA],													--Apellidos
        '' AS [TEL],														--Teléfono
		LEFT(p.PR_EMAIL,80)    as 'WEB',							        --E-mail
		'' AS [CNTFNC],														--Función
        '' AS [CNTMSS],														--Rol

		/*************************************************INDICADOR_O***********************************************************************/

		'O' AS 'INDICADOR_O',	
		
		'' AS [ODFCOD],														--Otros Datos Locales
		'' AS [ODFVAL],														--Valor
	
	    /*************************************************INDICADOR_P************************************************************************/

		'P' AS 'INDICADOR_P',	
		
		'' AS [SAT],	            										--Provincia
		'' AS [DATDEB],														--Fecha desde
		'' AS [DATFIN],														--Fecha hasta

		/*************************************************INDICADOR_R*************************************************************************/

		'R' AS 'INDICADOR_R',						

		'GEN' AS [XX12CRET]								                     --Control
	
	
	FROM [VenturiFabrica].[dbo].[PROVEEDORES] P	
	LEFT JOIN [VenturiFabrica].[dbo].[PROVINCIA] PR
	ON PR.[PO_CODIGO] = P.[PO_CODIGO]
	LEFT JOIN Venturi.dbo.COND_COMPRA condCompra
	ON P.CCM_CODIGO = condCompra.CCM_CODIGO
	where P.PR_CODPOS!='' 



		IF OBJECT_ID('tempdb..##TMPDATA') IS NOT NULL
		DROP TABLE ##TMPDATA

CREATE TABLE ##TMPDATA (	
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
			Dato27 NVARCHAR(MAX) NULL,
			Dato28 NVARCHAR(MAX) NULL,
			Dato29 NVARCHAR(MAX) NULL,
			Dato30 NVARCHAR(MAX) NULL,
			Dato31 NVARCHAR(MAX) NULL,
			Dato32 NVARCHAR(MAX) NULL,
			Dato33 NVARCHAR(MAX) NULL,
			Dato34 NVARCHAR(MAX) NULL,
			Dato35 NVARCHAR(MAX) NULL,
			Dato36 NVARCHAR(MAX) NULL,
			Dato37 NVARCHAR(MAX) NULL,
			Dato38 NVARCHAR(MAX) NULL,
			Dato39 NVARCHAR(MAX) NULL,
			Dato40 NVARCHAR(MAX) NULL,
			Dato41 NVARCHAR(MAX) NULL,
			Dato42 NVARCHAR(MAX) NULL,
			Dato43 NVARCHAR(MAX) NULL,
			Dato44 NVARCHAR(MAX) NULL,
			Dato45 NVARCHAR(MAX) NULL,
			Dato46 NVARCHAR(MAX) NULL,
			Dato47 NVARCHAR(MAX) NULL,
			Dato48 NVARCHAR(MAX) NULL
	
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



		DECLARE PROVEEDOR_DATOS CURSOR 
			FOR
			SELECT DISTINCT *
			FROM t_prov_Dat 

			OPEN PROVEEDOR_DATOS
			FETCH PROVEEDOR_DATOS INTO @categoria, @codigoProveedor, @sigla,@DescripcionCorta,@familiaEstadistica,@familiaEstadistica1,@familiaEstadistica2,@familiaEstadistica3
			WHILE(@@FETCH_STATUS=0)
			BEGIN

				INSERT INTO ##TMPDATA
				SELECT distinct 
					TP.INDICADOR_B,TPD.categoria,TPD.codigoProveedor, TP.ENAFLG , TP.BPRNAM ,TPD.DescripcionCorta, TP.CRY , TP.LAN , TP.CRN , TP.CUR , TP.ABCCLS ,TP.PLISTC , TP.BPTNUM ,      
					TP.MDL, TP.EECICT , TP.BPSTYP , TP.MATTOL ,  TP.OSTCTL, TP.OSTAUZAMT ,  TP.PAYLOKFLG, TP.DOUFLG  , TPD.familiaEstadistica,  TPD.familiaEstadistica1, TPD.familiaEstadistica2,    
					TP.[TSSCOD(3)],  TP.ACCCOD ,TP.PTE , TP.VACBPR,TP.XX12CHQNAM ,TP.XX12CHQORD , TP.XX12BPSCBU , TP.XX12NIF , TP.XX12PERFLG , TP.XX12SITGAN ,  TP.XX12REGIIBB,   
					TP.XX12IIBB , TP.XX12DOCTYP ,TP.XX12DOCNUM ,TP.XX12MTBBPR ,TP.XX12BPSEMB ,TP.XX12BPRINT , TP.XX12CTRFIS , TP.XX12SITIBCAB, TP.XX12ALLRET, TP.[*71],  
					TP.[*72],  TP.[*81], TP.[*82]           
				FROM ##TMPTABLE_PROVEEDOR TP
				INNER JOIN t_prov_Dat TPD
				ON TP.BPSNUM = TPD.sigla 
				WHERE TPD.codigoProveedor = @codigoProveedor

		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_A , TP.[BPAADD], TP.[BPADES] , TP.[BPAADDLIG(0)],TP.[BPAADDLIG(1)],TP.[POSCOD] , TP.[CRY2]  , TP.[BPAADDFLG],
			TP.[TEL(0)]  , TP.[TEL(1)]  ,TP.[BPTNUM],TP.[FAX]  ,TP.[FCYWEB], TP.[WEB(0)],TP.[WEB(1)],'','','','','','','',	
			'', '' , '' , '' ,'', '', '', '', '',  '',  '',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '', '',  '',   ''  
		FROM ##TMPTABLE_PROVEEDOR TP
				INNER JOIN t_prov_Dat TPD
				ON TP.BPSNUM = TPD.sigla 
				WHERE TPD.codigoProveedor = @codigoProveedor


		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_C ,TP.[CCNCRM] ,TP.[CNTTTL] ,TP.[CNTFNA] , TP.[CNTLNA] ,TP.[TEL] ,TP.[WEB] ,TP.[CNTFNC] ,TP.[CNTMSS] , '','','',
			'',  '',	'','', '', '', '',  '',  '',  '',  '',  '' , '' , '' , '', '',  '',  '',  '',  '',  '','',  '', '', '',  '',  '', 
			'',  '',  '', '', '', '','',  '',   ''   
		FROM ##TMPTABLE_PROVEEDOR TP
				INNER JOIN t_prov_Dat TPD
				ON TP.BPSNUM = TPD.sigla 
				WHERE TPD.codigoProveedor = @codigoProveedor



			INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_R ,TP.[XX12CRET] ,'' ,'' , '' ,'' ,'' ,'' ,'' , '','','',  '',  '',	'','', '', '',  
			'',  '',  '',  '',  '',  '' , '' , '' , '', '',  '',  '',  '',  '',  '','',  '', '', '',  '',  '',  '',
			'',  '', '', '', '','',  '',   ''   
		FROM ##TMPTABLE_PROVEEDOR TP
				INNER JOIN t_prov_Dat TPD
				ON TP.BPSNUM = TPD.sigla 
				WHERE TPD.codigoProveedor = @codigoProveedor




		/*INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_O , TP.[ODFCOD] , TP.[ODFVAL] , '',  '',  '',   '',    '', '',  '','', '','',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '' , '' , 
			'',  '',  '', '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',   '',''   
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor



		INSERT INTO ##TMPDATA
		SELECT DISTINCT 
			TP.INDICADOR_P , TP.[SAT] ,  TP.[DATDEB] , TP.[DATFIN], TP.[XX12CRET],'', '', '', '', '','',  '',  '', '', '',  '',  '',  '',  '',  '',  '',  '',  
			'',  '' , '' , '' , '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',  '',   ''  
		FROM ##TMPTABLE_PROVEEDOR TP, ##TMPTABLE_PROVEEDOR_DATOS TPD
		WHERE TP.BPSNUM = TPD.sigla and TPD.codigoProveedor = @codigoProveedor*/

		FETCH PROVEEDOR_DATOS INTO  @categoria, @codigoProveedor, @sigla,@DescripcionCorta, @familiaEstadistica, @familiaEstadistica1, @familiaEstadistica2, @familiaEstadistica3

		END

		CLOSE PROVEEDOR_DATOS

		DEALLOCATE PROVEEDOR_DATOS



		SELECT ISNULL(tmpData.Dato1,''), ISNULL(tmpData.Dato2, ''), ISNULL(tmpData.Dato3,''), ISNULL(tmpData.Dato4,''), ISNULL(tmpData.Dato5,''),
		       ISNULL(tmpData.Dato6, ''),ISNULL (tmpData.Dato7, ''),ISNULL(tmpData.Dato8,''), ISNULL(tmpData.Dato9,''), ISNULL(tmpData.Dato10,''),ISNULL(tmpData.Dato11,''),
			   ISNULL(tmpData.Dato12,''),ISNULL(tmpData.Dato13,''), ISNULL(tmpData.Dato14,''),ISNULL(tmpData.Dato15,''),ISNULL(tmpData.Dato16,''),ISNULL(tmpData.Dato17,''),
			   ISNULL(tmpData.Dato18,''),ISNULL(tmpData.Dato19,''), ISNULL(tmpData.Dato20,''),ISNULL(tmpData.Dato21,''),ISNULL(tmpData.Dato22,''),ISNULL(tmpData.Dato23,''),
			   ISNULL(tmpData.Dato24,''),ISNULL(tmpData.Dato26,''), ISNULL(tmpData.Dato27,''),ISNULL(tmpData.Dato28,''),ISNULL(tmpData.Dato29,''),
			   ISNULL(tmpData.Dato30,''),ISNULL(tmpData.Dato31,''), ISNULL(tmpData.Dato32,''),ISNULL(tmpData.Dato33,''),ISNULL(tmpData.Dato34,''),
			   ISNULL(tmpData.Dato35,''),ISNULL(tmpData.Dato36,''), ISNULL(tmpData.Dato37,''),ISNULL(tmpData.Dato38,''),ISNULL(tmpData.Dato39,''),ISNULL(tmpData.Dato40,''),
			   ISNULL(tmpData.Dato41,''),ISNULL(tmpData.Dato42,''), ISNULL(tmpData.Dato43,''),ISNULL(tmpData.Dato44,''),ISNULL(tmpData.Dato45,''),ISNULL(tmpData.Dato46,''),
			   ISNULL(tmpData.Dato47,''),ISNULL(tmpData.Dato48,'')

		FROM ##TMPDATA tmpData
	








