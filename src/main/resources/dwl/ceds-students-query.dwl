%dw 2.0
output application/java
---
"SELECT [Student_ID]
      ,[EDID]
      ,[First_Name]
      ,[Middle_Name]
      ,[Last_Name]
      ,[Preferred_Name]
      ,[Gender_ID]
      ,[CYPC_ID]
      ,[ABS_Country_Of_Birth_ID]
      ,[Birth_Date]
      ,[IsInternationalStudent]
      ,[HasCustodyOrder]
      ,[HasInterventionOrder]
      ,[Last_Update_Date]
  FROM [dbo].[vw_INTEGRATION_Student]
  WHERE Last_Update_Date >= '$(vars.lastUpdatedOn)'
ORDER BY Student_ID, EDID OFFSET $(vars.offset) ROWS FETCH NEXT $(vars.limit) ROWS ONLY"