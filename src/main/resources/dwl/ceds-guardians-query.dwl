%dw 2.0
output application/java
---
"SELECT distinct [Family_Parent_Guardian_ID]
      ,[Guardian_No]
      ,[Family_Parent_Guardian_Title]
      ,[Family_Parent_Guardian_Family_Name]
      ,[Family_Parent_Guardian_Given_Names]
      ,[Family_Parent_Guardian_Email]
      ,[Family_Parent_Guardian_Mobile]
      ,[Family_Parent_Guardian_Phone]
      ,pg.[Student_ID]
FROM [dbo].[vw_INTEGRATION_Family_Parent_Guardian] pg
INNER JOIN [dbo].[vw_INTEGRATION_Enrolment] en
ON pg.Student_ID = en.Student_ID
INNER JOIN [dbo].[vw_INTEGRATION_Student] st
ON pg.Student_ID = st.Student_ID
WHERE 1=1
AND st.[Last_Update_Date] >= ISNULL('$(vars.lastUpdatedOn)', st.[Last_Update_Date])
ORDER BY Student_ID, Family_Parent_Guardian_ID OFFSET $(vars.offset) ROWS FETCH NEXT $(vars.limit) ROWS ONLY"