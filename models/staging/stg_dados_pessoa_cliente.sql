with
    source_nome_cliente as (
        select
        businessentityid
        , persontype
        --, namestyle
        --, title
        , firstname
        , middlename
        , lastname
        --, suffix
        --, emailpromotion
        --,additionalcontactinfo
        --, demographics
        --, rowguid
        from {{source('adventure_dash_vendas','dados_pessoa_cliente')}}
)
select *
from source_nome_cliente