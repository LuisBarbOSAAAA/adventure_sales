with
    source_pais as (
        select
        countryregioncode
        , name
        --, modifieddate
        from {{source('adventure_dash_vendas','endereco_pais')}}
)
select *
from source_pais