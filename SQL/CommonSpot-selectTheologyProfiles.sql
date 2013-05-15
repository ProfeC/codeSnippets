select pageid, versionid, authorid, ownerid, dateadded, itemid, fieldid, fieldvalue, memovalue
from data_fieldvalue
where fieldvalue like '201'
  and formID = 148360
  and fieldid = 148403
  and versionstate = 2
order by pageid