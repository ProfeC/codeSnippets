-- Select Business News ???
-- Originally created 20100301 @ 10:34

select
	data_fieldvalue.pageid
	, data_fieldvalue.fieldvalue
	, forminputcontrol.fieldname
FROM
	dbo.Data_FieldValue
	, dbo.FormControl
	, dbo.FormInputControl 
WHERE
	dbo.FormControl.ID = dbo.Data_FieldValue.FormID
	AND dbo.FormInputControl.ID = dbo.Data_FieldValue.FieldID
	AND dbo.Data_FieldValue.FormID = 1543
	AND dbo.Data_FieldValue.FieldValue LIKE '%business%'
	AND (dbo.Data_FieldValue.VersionState = 2)
ORDER BY
	Data_FieldValue.PageID
	, FormInputControl.FieldName