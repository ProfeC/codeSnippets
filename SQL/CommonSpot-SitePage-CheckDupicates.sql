-- Thanks ssmith@paperthin.com for this little tidbit.
-- The results of this query will show entries in the sitepages table where the name (file name) is similar, 
-- regardless of case. It is useful when migrating sites from a db structure that is case insensitive to one that is.

select *
from sitepages
where lower(name) in (
   select lower(name)
   from sitepages
   group by lower(name), audienceid, subsiteid, pagetype
   having count(name) > 1
)
order by lower(name), subsiteid
