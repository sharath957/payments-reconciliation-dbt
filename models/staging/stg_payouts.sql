WITH raw_payouts as (
    SELECT
        *
    FROM {{ source('payments_recon', 'payouts') }}
)
    
    SELECT
        rp.payout_id,
        rp.clinic_id,
        rp.paid_at,
        rp.net_amount_cad as net_amount,
        rp.currency,
        rp.status
    FROM    
        raw_payouts rp