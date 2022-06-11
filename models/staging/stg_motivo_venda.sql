with
    source_motivo as (
        select
        salesreasonid
        , name
        --, reasontype
        --, modifieddate
        from {{source('adventure_dash_vendas','motivo_venda')}}
)
select *
from source_motivo