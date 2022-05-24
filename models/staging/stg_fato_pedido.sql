with
    source_fato_pedido as (
        select
        salesorderid
        --, revisionnumber
        , orderdate
        --, duedate
        --, shipdate
        , status
        --, onlineorderflag
        --, purchaseordernumber
        , accountnumber
        , customerid
        , salespersonid
        , territoryid
        --, billtoaddressid
        , shiptoaddressid
        , shipmethodid
        , creditcardid
        --, creditcardapprovalcode
        --, currencyrateid
        , subtotal
        , taxamt
        , freight
        , totaldue
        --, comment
        --, rowguid
        --, modifieddate
        from {{source('adventure_dash_vendas','fato_pedido')}}
)
select *
from source_fato_pedido