with
    source_estado as (
        select
        stateprovinceid
        , stateprovincecode
        , countryregioncode
        --, isonlystateprovinceflag
        , name
        , territoryid
        --, rowguid
        --, modifieddate
        from {{source('adventure_dash_vendas','endereco_estado')}}
)
select *
from source_estado