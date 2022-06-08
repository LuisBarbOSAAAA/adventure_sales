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
    pedido.salesorderid as id_pedido
    , pedido.customerid as id_cliente
    , pedido.shiptoaddressid as id_endereco
    , pedido.creditcardid as id_cartao
    , detalhes.productid as id_produto
    , pedido.status
    , detalhes.orderqty as qtde
    , detalhes.unitprice as preco_unidade
    , detalhes.linetotal as total_pedido
    from
        pedido
        left join detalhes on detalhes.salesorderid = pedido.salesorderid
    where productid is not null