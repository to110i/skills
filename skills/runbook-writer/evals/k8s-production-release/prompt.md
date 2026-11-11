---
tags: [skill-creator]
max_turns: 30
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

来週の火曜に本番の api を v2.4.0 にリリースするので、その作業手順書を docs/ に置いておいて。今回DBマイグレーション（ordersテーブルにカラム追加）も入ってる。デプロイはいつも Makefile 経由でやってる。

Input files: Makefile, k8s/deployment.yaml, k8s/migrate-job.yaml, docs/README.md
