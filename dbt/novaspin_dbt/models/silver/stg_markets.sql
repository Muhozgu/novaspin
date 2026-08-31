version: 2

models:
  - name: stg_markets
    description: "One row per country, typed and cleaned from Bronze."
    columns:
      - name: market_id
        tests:
          - unique
          - not_null
      - name: country_code
        tests:
          - unique
          - not_null

  - name: stg_players
    description: "One row per player, typed and cleaned from Bronze."
    columns:
      - name: player_id
        tests:
          - unique
          - not_null
      - name: country_code
        tests:
          - not_null
          - relationships:
              arguments:
                to: ref('stg_markets')
                field: country_code

  - name: stg_sessions
    description: "One row per game session, typed and cleaned from Bronze."
    columns:
      - name: session_id
        tests:
          - unique
          - not_null
      - name: player_id
        tests:
          - not_null
          - relationships:
              arguments:
                to: ref('stg_players')
                field: player_id
