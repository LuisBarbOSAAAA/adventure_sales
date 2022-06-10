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
    dados_cliente.personid as id_cliente
    , dados_cliente.customerid as id_loja
    ,concat(
        dados_comprador.firstname
        , " "
        , dados_comprador.lastname
    ) as nome_comprador
    , estabelecimento.name as loja
    , case
        when name is null then 'B2C'
        ELSE 'B2B'
      end tipo_negocio
    , case
        when name is null then concat(
        dados_comprador.firstname
        , dados_comprador.lastname)
        else name
      end comprador
    from
        dados_cliente
        left join dados_comprador on dados_comprador.businessentityid = dados_cliente.personid
        left join estabelecimento on estabelecimento.businessentityid = dados_cliente.storeid