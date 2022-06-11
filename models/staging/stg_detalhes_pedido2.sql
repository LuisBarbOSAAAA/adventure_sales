with
    source_detalhes_pedido as (
        select
        orderqty
        , salesorderid
        , salesorderdetailid
        , unitprice
        , specialofferid
        --, modifieddate
        --, rowguid
        --, _sdc_table_version
        , productid
        --, _sdc_received_at
        --, _sdc_sequence
        --, _sdc_batched_at
        --, carriertrackingnumber
        , unitpricediscount
        from {{source('adventure_dash_vendas','detalhe_venda2')}}
)
select *
from source_detalhes_pedido