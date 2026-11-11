---
tags: [skill-creator]
max_turns: 30
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

毎月初にやってる注文データのアーカイブ作業を手順書にしたい。今は担当者が1人で覚えてやってるだけなので、他の人もできるようにしたい。中身は scripts/ にあるやつを使ってて、本番のPostgreSQL（orders-db-prod）に踏み台から psql でつないで実行してる。13ヶ月より前のordersをorders_archiveに移してから消してる感じ。

Input files: scripts/archive_orders.sql, scripts/run_archive.sh, README.md
