with
    source_cartao as (
        select
        creditcardid
        , cardtype
        --, cardnumber
        --, expmonth
        --, expyear
        --, modifieddate  
        from {{source('adventure_dash_vendas','tipo_cartao')}}
)
select *
from source_cartao