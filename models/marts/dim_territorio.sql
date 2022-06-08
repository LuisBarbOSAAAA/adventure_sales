with
    dados_cidade as (
        select
         city
        , stateprovinceid
        ,addressid
        from {{ref('stg_endereco_cidade')}}
 )
 ,   dados_estado as (
        select
        stateprovinceid
        , stateprovincecode
        , countryregioncode
        , name as nome_estado
        from {{ref('stg_endereco_estado')}}
    )
    , dados_pais as(
        select
        countryregioncode
        , name as nome_pais
        from {{ref('stg_endereco_pais')}}
)
    select
      addressid
    ,dados_cidade.city
    , dados_estado.nome_estado
    , dados_estado.stateprovincecode
    , dados_pais.nome_pais
    from
        dados_cidade
        left join dados_estado on dados_estado.stateprovinceid = dados_cidade.stateprovinceid
        left join dados_pais on dados_pais.countryregioncode = dados_estado.countryregioncode