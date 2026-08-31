{{ config(
    materialized='view'
) }}

SELECT
    *
FROM {{ ref('fact_game_sessions') }}