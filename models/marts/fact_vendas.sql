with
    pedido as (
        select
        salesorderid
        , orderdate
        , status
        , customerid
        , territoryid
        , shiptoaddressid
        , creditcardid
        , subtotal
        , taxamt
        , freight
        , totaldue
        from {{ref('stg_fato_pedido')}}
 )
 ,   detalhes as (
        select
        salesorderid
        , orderqty
        , productid
        , unitprice
        , unitpricediscount
        , linetotal
        from {{ref('stg_detalhes_pedido')}}
    )
    select
    pedido.salesorderid
    , pedido.customerid
    , pedido.shiptoaddressid
    , pedido.creditcardid
    , detalhes.productid
    , pedido.status
    , detalhes.orderqty
    , detalhes.unitprice
    , detalhes.linetotal
    from
        pedido
        left join detalhes on detalhes.salesorderid = pedido.salesorderid
    where productid is not null