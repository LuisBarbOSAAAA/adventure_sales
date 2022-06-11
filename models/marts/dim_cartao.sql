with
    staging as (
        select *
        from {{ref('stg_tipo_cartao')}}
)

    , transformed as (
        select row_number() over (order by creditcardid) as id_cartao
        , cardtype as tipo_cartao
        from staging
    )

    select * from transformed