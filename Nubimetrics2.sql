SELECT
	COUNTRY.Name AS "country_name",
	MONEDA.Name AS "currency_name",
	ROUND(AVG(AUXB.AverageRate),2) AS "currency_rate",
	ROUND(AVG(SALES.TaxRate),2) AS "average_tax_rate"
FROM [Sales].[SalesTaxRate] AS SALES

INNER JOIN [Person].[StateProvince] AS PROV
	ON SALES.StateProvinceID = PROV.StateProvinceID

INNER JOIN [Person].[CountryRegion] AS COUNTRY
	ON PROV.CountryRegionCode = COUNTRY.CountryRegionCode

INNER JOIN [Sales].[CountryRegionCurrency] AS AUX
	ON AUX.CountryRegionCode = PROV.CountryRegionCode

INNER JOIN [Sales].[Currency] AS MONEDA
	ON MONEDA.CurrencyCode = AUX.CurrencyCode

INNER JOIN [Sales].[CurrencyRate] AS AUXB
	ON AUXB.ToCurrencyCode = AUX.CurrencyCode

GROUP BY COUNTRY.Name, MONEDA.Name
ORDER BY COUNTRY.Name ASC