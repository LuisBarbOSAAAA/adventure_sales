with
    source_detalhes_pedido as (
        select
        salesorderid
        --, salesorderdetailid
        , orderqty
        , productid
        , unitprice
        , unitpricediscount
        , linetotal
        --, rowguid
        --, modifieddate
        from {{source('adventure_dash_vendas','detalhes_pedidos')}}
)
select *
from source_detalhes_pedido