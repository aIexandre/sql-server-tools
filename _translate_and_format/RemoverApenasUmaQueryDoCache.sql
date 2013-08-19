SELECT [text], cp.size_in_bytes, plan_handle
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_sql_text(plan_handle)
WHERE cp.cacheobjtype = N'Compiled Plan'
AND cp.objtype = N'Adhoc'
AND cp.usecounts = 1
AND [TEXT] LIKE '%VendasDoPeriodo%'
ORDER BY cp.size_in_bytes DESC;



DBCC FREEPROCCACHE(0x06001000B113BD0E4001A910010000000000000000000000)
DBCC FREEPROCCACHE(0x060010005D99430040E134A6010000000000000000000000)
DBCC FREEPROCCACHE(0x060010005B61821240E1A810010000000000000000000000)