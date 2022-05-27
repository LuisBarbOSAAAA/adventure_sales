with 
    motivo_vendas_header as (
        select 
        salesorderid
        , salesreasonid
        from {{ref('stg_motivo_vendas_header')}}
 )
 ,  motivo_venda as (
        select
        salesreasonid
        , name
        from {{ref('stg_motivo_venda')}}
 )
        select
            motivo_vendas_header.salesorderid as id_pedido
            , motivo_venda.salesreasonid as id_motivo
            , motivo_venda.name as motivo
        from 
            motivo_vendas_header
                left join motivo_venda on motivo_vendas_header.salesreasonid = motivo_venda.salesreasonid
        