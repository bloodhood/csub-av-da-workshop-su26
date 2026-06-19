# Day 5 — Capstone Project and Report

Your capstone. Bring the week together — most directly **Day 3** (build a schedule database from real data and query it) and **Day 4** (drive the whole pipeline with Claude Code workflows). One project, from a real-world data source all the way to a working app, with a written report.

## This repo
Empty on purpose — **this is where you build and submit your capstone.** Day 5 is online (no lecture): a follow-up / Q&A while you finish. **Final project due Day 5.**

---

## Section 1 — What You Build
1. **Real-world data** — a live college schedule (your school's, or CSUB CS). Scope: Fall 2026.
2. **DB construction** — design a normalized schema (course / instructor / section) and create it.
3. **Input / load** — crawl or import the data; insert the tuples (dedup courses and instructors).
4. **Embedded app** — a Python program that connects to the database and runs your queries.
5. **Query & cook** — retrieve and process (totals, filters, an answer, or a formatted schedule).
6. **Display** — print a clean result: the schedule screen, or an analysis.

## Section 2 — What to Submit
1. **Data file** — raw CSV, with its source URL.
2. **Schema** — your CREATE TABLE statements (the three tables).
3. **Build / load program** — how the data got into the DB.
4. **The database** — the `.db` file, or a script that rebuilds it.
5. **Embedded app** — the Python program (queries + processing + display).
6. **Sample output** — the printed result / screen.
7. **Workflows** (if you used Claude Code) — your `.claude/commands/` files.
8. **Report** — see Section 3.

## Section 3 — The Report (format)
1. **Project overview** — what data, what the app does (2–3 sentences).
2. **Data source** — where, how collected (crawl / import), scope (FA26), record count.
3. **Design** — your schema, the functional dependencies you noticed, why you split it this way (normalization).
4. **SQL** — your key queries, each labelled with the question it answers.
5. **The app** — how it connects, queries, and processes the results.
6. **Result** — a sample of the printed output.
7. **Reflection** — one thing that worked, one thing you'd improve.
