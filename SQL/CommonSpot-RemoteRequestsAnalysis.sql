select top 5 * from remoterequests order by transactionid

select count(package) as packagecount, package
from remoterequests
group by package
order by packagecount desc

select count(method) as methodcount, method
from remoterequests
group by method
order by methodcount desc

select count(destserverid) as destserveridcount, destserverid
from remoterequests
group by destserverid
order by destserveridcount desc