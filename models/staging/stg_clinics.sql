WITH raw_clinics as (
    SELECT
        *
    FROM {{ source('payments_recon', 'clinics') }} 
)
SELECT
    rc.clinic_id,
    rc.clinic_name,
    rc.province,
    rc.city,
    rc.timezone,
    rc.plan_tier,
    rc.joined_at
FROM
    raw_clinics rc