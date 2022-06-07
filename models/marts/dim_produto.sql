with 
    produto as (
        select
        productid
        , name
        from {{ref('stg_produto')}}
    )
select 
productid as id_produto
, name as nome_produto
from produto