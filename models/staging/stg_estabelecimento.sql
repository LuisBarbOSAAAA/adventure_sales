with
    source_estabelecimento as (
        select
        businessentityid
        , name
        --, salespersonid
        --, demographics
        --, rowguid
        --, modifieddate
        from {{source('adventure_dash_vendas','estabelecimento')}}
)
select *
from source_estabelecimento