with
    source_cidade as (
        select
        addressid
        --, addressline1
        --, addressline2
        , city
        , stateprovinceid
        --, postalcode
        --, spatiallocation
        --, rowguid
        --, modifieddate
        from {{source('adventure_dash_vendas','endereco_cidade')}}
)
select *
from source_cidade