--RETORNA AS FATURAS COM VALORES E ITENS DE UM CLIENTE ESPECÍFICO 

CREATE VIEW IF NOT EXISTS VW_FATURAS_CLIENTES
AS

SELECT
	C.FIRSTNAME || ' ' || C.LASTNAME AS CLIENTE,
	I.INVOICEID AS 'NÚMERO DA FATURA',
	DATE(I.INVOICEDATE) AS 'DATA DA FATURA',
	T.NAME AS 'MÚSICA', 
	A2.NAME AS 'CANTOR',
	IL.UNITPRICE AS 'PREÇO UNITÁRIO', 
	IL.QUANTITY AS 'QTD', 
	'R$ ' || CAST((IL.UNITPRICE * IL.QUANTITY) AS TEXT) AS 'TOTAL DO ITEM',
	'R$ ' || I.TOTAL AS 'TOTAL DA FATURA'
FROM
	INVOICE I
LEFT JOIN INVOICELINE IL ON
	I.INVOICEID = IL.INVOICEID
LEFT JOIN CUSTOMER C ON
	I.CUSTOMERID = C.CUSTOMERID
LEFT JOIN TRACK T ON
	IL.TRACKID = T.TRACKID
LEFT JOIN ALBUM A ON
	T.ALBUMID = A.ALBUMID
LEFT JOIN ARTIST A2 ON
	A.ARTISTID = A2.ARTISTID
WHERE 
	I.CUSTOMERID = 40
ORDER BY
	I.INVOICEID
	

--SELECT * FROM VW_FATURAS_CLIENTES 	