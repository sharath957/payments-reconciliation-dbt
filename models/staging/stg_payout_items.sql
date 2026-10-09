WITH raw_payout_items as (
    SELECT
        *
    FROM {{ source('payments_recon', 'payout_items') }} 
)

    SELECT
        rpi.payout_item_id,
        rpi.payout_id,
        rpi.source_id,
        rpi.source_type,
        rpi.amount_cad as amount
    FROM
        raw_payout_items rpi