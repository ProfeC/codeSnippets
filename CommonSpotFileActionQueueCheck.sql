-- select sourceServerID, destServerID, file1, file2, transactionTimestamp
-- delete
-- from serverFileActionQueue
-- where transactionTimestamp like '2008%'

select sourceServerID, destServerID, file1, file2, transactionTimestamp
from serverFileActionQueue
-- where transactionTimestamp like '2008%'