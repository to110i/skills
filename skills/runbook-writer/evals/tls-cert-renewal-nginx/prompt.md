---
tags: [skill-creator]
max_turns: 30
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

来月うちのWebサーバー2台（web01.example.internal, web02.example.internal、どっちもUbuntu 22.04 + nginx）のTLS証明書が期限切れになるので、更新作業の手順書を作ってほしい。証明書は社内で購入してるやつで、新しい証明書と中間証明書のファイルはもう手元にある（server.crt, intermediate.crt, server.key）。LBの裏にいるので1台ずつやればサービス停止はしない想定。
