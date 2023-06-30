-- União da tabela Customer e Employee para mostrar o nome de todas as pessoas que são da cidade de Edmonton

CREATE VIEW IF NOT EXISTS VW_CUSTOMERS_EMPLOYEES AS

SELECT
	C.FIRSTNAME AS 'NOME DA PESSOA'
FROM
	CUSTOMER C
WHERE
	C.CITY IN ('Edmonton')
UNION 
SELECT 
	E.FIRSTNAME AS 'NOME DA PESSOA'
FROM 
	EMPLOYEE E
WHERE
	E.CITY IN ('Edmonton')
ORDER BY
	1
	
	
--SELECT * FROM VW_CUSTOMERS_EMPLOYEES vce 

				