# Battleships AI — Logic-Powered Game Opponent

**Role:** AI / Fullstack Developer
**Date:** 2023
**Stack:** Python, Prolog, Flask, React, Docker

---

## Overview

A classic Battleships game where the AI opponent doesn't just pick random squares — it *reasons* using Prolog logic programming. Given a history of hits and misses, the AI infers likely ship locations and targets them systematically.

---

## Architecture

### AI Engine (Python + Prolog)
- The AI's decision-making runs in **SWI-Prolog**, accessed from Python via a subprocess bridge
- Prolog rules encode ship constraints: if a cell is a hit, adjacent cells must also be evaluated; if a ship sinks, its perimeter is marked as empty
- The AI maintains a probability heatmap updated after each shot, using Prolog queries to eliminate impossible configurations

### Backend (Flask)
- REST API manages game state (board, shot history, ship placement)
- Each turn, the backend queries the Prolog AI engine for the next move
- Game sessions stored in-memory with a simple session ID scheme

### Frontend (React)
- Interactive board UI with click-to-shoot mechanics
- Real-time display of AI reasoning: highlighted "suspected" cells shown to the player
- Responsive grid that works on both desktop and mobile

### Deployment (Docker)
- Multi-container setup: React (nginx), Flask API, and SWI-Prolog runtime
- Single `docker-compose up` spins up the full stack

---

## Key Technical Highlights

- **Python–Prolog bridge:** Spawns a persistent Prolog process and communicates via stdin/stdout pipes, avoiding per-query startup overhead
- **Constraint propagation:** After each miss, Prolog eliminates all board configurations that would require a ship at that cell, pruning the search space
- **Hunt-then-target strategy:** AI starts in "hunt" mode (probabilistic targeting) and switches to "target" mode (systematic direction search) upon a hit

---

## What I Learned

Building this forced me to think declaratively — Prolog's logic rules are elegant for constraint-satisfaction problems like this. Bridging two very different paradigms (imperative Python ↔ declarative Prolog) required careful protocol design for the inter-process communication.
