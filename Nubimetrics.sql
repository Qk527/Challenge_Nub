SELECT
	PROV.CountryRegionCode,
	AVG(SALES.TaxRate) AS "average_taxRate"
FROM [Sales].[SalesTaxRate] AS SALES
INNER JOIN [Person].[StateProvince] AS PROV
	ON SALES.StateProvinceID = PROV.StateProvinceID
GROUP BY CountryRegionCode