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
        from {{ref('stg_detalhes_pedido2')}}
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
    , (unitprice*orderqty)*(1-unitpricediscount) as total_pedido
    , case 
        when status = 5 then 'enviado'
        when status = 4 then 'rejeitado'
        when status = 3 then 'em espera'
        when status = 2 then 'aprovado'
        when status = 1 then 'em processo'
       end satus_pedido 
    from
        pedido
        left join detalhes on detalhes.salesorderid = pedido.salesorderid