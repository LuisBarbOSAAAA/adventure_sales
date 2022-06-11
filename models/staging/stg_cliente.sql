with
    source_cliente as (
        select
    customerid
    , personid
    , storeid
    , territoryid
    --, rowguid
    --, modifieddate
        from {{source('adventure_dash_vendas','cliente')}}
)
select *
from source_cliente