with
    dados_cliente as (
        select
        customerid
        , personid
        , storeid
        from {{ref('stg_cliente')}}
 )
 ,   dados_comprador as (
        select
        businessentityid
        , firstname
        , lastname
        from {{ref('stg_dados_pessoa_cliente')}}
    )
    , estabelecimento as(
        select
        businessentityid
        , name
        from {{ref('stg_estabelecimento')}}
)
    select
    concat(
        dados_comprador.firstname
        , dados_comprador.lastname
    ) as nome_comprador
    , dados_cliente.personid
    , dados_cliente.customerid
    , estabelecimento.name
    from
        dados_cliente
        left join dados_comprador on dados_comprador.businessentityid = dados_cliente.personid
        left join estabelecimento on estabelecimento.businessentityid = dados_cliente.storeid
