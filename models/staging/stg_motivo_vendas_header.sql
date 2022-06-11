with
    source_header_motivo_venda as (
        select
        salesorderid
        , salesreasonid
        --, modifieddate
        from {{source('adventure_dash_vendas','header_motivo_venda')}}
)
select *
from source_header_motivo_venda