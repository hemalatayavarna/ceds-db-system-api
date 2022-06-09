%dw 2.0
output application/java
---
"SELECT [Country_ID]
      ,[Country]
      ,[ABS_Code]
  FROM [CEDS].[dbo].[vw_INTEGRATION_Country]"