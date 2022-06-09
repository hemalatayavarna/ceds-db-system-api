%dw 2.0
output application/java
---
"SELECT distinct [Enrolment_ID]
      ,en.[Student_ID]
      ,[Org_Unit_ID]
      ,[Campus_Org_Unit_ID]
      ,[Enrolment_Status_ID]
      ,[Year_Level_ID]
      ,[Disability_Status_ID]
      ,[Date_Enrolled]
      ,[Date_Left]
      ,[Roll_Class]
      ,[Multiple_Enrolment_RN]
FROM [dbo].[vw_INTEGRATION_Enrolment] en
INNER JOIN [dbo].[vw_INTEGRATION_Student] st
ON en.Student_ID = st.Student_ID
WHERE 1=1
AND st.[Last_Update_Date] >= ISNULL('$(vars.lastUpdatedOn)', st.[Last_Update_Date])
ORDER BY Student_ID, Org_Unit_ID OFFSET $(vars.offset) ROWS FETCH NEXT $(vars.limit) ROWS ONLY"