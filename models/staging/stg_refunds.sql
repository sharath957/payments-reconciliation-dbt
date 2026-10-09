WITH refunds AS (
    SELECT
        *
    FROM {{ source('payments_recon', 'refunds') }} 
)
    SELECT
        r.refund_id,
        r.charge_id,
        r.refunded_at,
        r.amount_cad as amount,
        r.reason
    FROM
        refunds r