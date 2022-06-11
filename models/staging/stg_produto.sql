with
    source_produto as (
        select
            productid
            , name
            , productnumber
            --, makeflag
            --, finishedgoodsflag
            --, color
            --, safetystocklevel
            --, reorderpoint
            --, standardcost
            --, listprice
            --, size
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, weight
            --, daystomanufacture
            --, productline
            , class
            --, style
            --, productsubcategoryid
            --, productmodelid
            --, sellstartdate
            --, sellenddate
            --, discontinueddate
            --, rowguid
            --, modifieddate
        from {{source('adventure_dash_vendas','produto')}}
)
select *
from source_produto