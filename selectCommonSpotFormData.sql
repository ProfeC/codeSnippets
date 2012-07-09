select
	formInputControl.id
	, formInputControl.fieldName
	, data_fieldValue.authorID
	, data_fieldValue.dateAdded
	, data_fieldValue.dateApproved
	, data_fieldValue.fieldID
	, data_fieldValue.fieldValue
	, data_fieldValue.formID
	, data_fieldValue.itemID
	, data_fieldValue.memoValue
	, data_fieldValue.ownerID
	, data_fieldValue.versionID
from
	data_fieldValue
	, formInputControl
where
	(pageID={some page id} and versionState=2) and (data_fieldValue.fieldID=formInputControl.id)