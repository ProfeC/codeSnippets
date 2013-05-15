select name, audienceid, subsiteid, pagetype, filename, DATEADDED
from sitepages
where lower(name) in (
   select lower(name)
   from sitepages
   group by lower(name), audienceid, subsiteid, pagetype
   having count(name) > 1
)
order by lower(name), subsiteid, dateadded;

select distinct creatorid
from sitepages
where lower(name) in (
    select lower(name)
    from sitepages
    group by lower(name), audienceid, subsiteid, pagetype
    HAVING COUNT(NAME) > 1
);

/*
SELECT *
from csusers.users
where id in
(1000014, 1000045, 1001959, 1000155, 1000280, 1000083, 1000148, 1000018, 1000017, 1000150, 1000216, 1000215,1000049)
ORDER BY LASTLOGIN DESC
*/

SELECT ID, PARENTID, SUBSITEURL, SUBSITEDIR
FROM SUBSITES
ORDER BY ID, PARENTID
