# Mankey — AI-Augmented Knowledge Management System

**Role:** Product Designer & Fullstack Developer
**Date:** Feb 2025
**Stack:** React, Next.js, PostgreSQL, Claude API, pgvector

---

## Project Overview

Designed a knowledge management system that solves the fundamental tension in AI-assisted note-taking: **how to leverage AI for efficiency without bypassing the cognitive work that makes learning stick**. While tools like Notion AI and Readwise write notes for you, research shows that synthesis is what creates retention. This system uses AI to reduce friction while preserving — and amplifying — the cognitive effort required for deep learning.

---

## The Problem

Current PKM (Personal Knowledge Management) tools fall into two camps:

**Manual systems** (Obsidian, Roam) require significant effort to maintain:
- Capture friction → people stop taking notes
- Synthesis burden → unprocessed notes pile up
- Navigation complexity → information gets lost

**AI-assisted systems** (Notion AI, Reflect) automate too much:
- AI writes summaries → the user never processes the information
- Auto-generated notes → no personal synthesis
- Wikipedia-style outputs → alien to the user's own thinking

The result: **tools optimize for quantity of notes over quality of learning**.

---

## Design Principles

1. **AI reduces activation energy, not cognitive load**  
   AI handles logistics (clustering notes, suggesting connections) but humans do synthesis (writing in own words, labeling relationships)

2. **Desirable difficulty by design**  
   Intentional friction gates (originality checking, connection requirements, claim articulation) force deeper processing

3. **Learning science informs every interaction**  
   Features map to proven techniques: elaborative interrogation, generation effect, spaced repetition, relational processing

4. **Progressive disclosure of structure**  
   System starts simple (capture quotes) and scaffolds complexity as vault grows (synthesis → hubs → publishing)

---

## Core Workflow

### 1. **Capture** (Chrome Extension)
- One-click article saving with Readability parsing
- Highlight text → creates "external note" (quote + source context)
- Floating button for "fleeting notes" (spontaneous thoughts)

![Internals](assets/images/Mankey/quote_collection.png)

### 2. **Synthesis** (Canvas Workspace)
- **Sidebar:** AI groups unprocessed notes by theme/source
- **Canvas:** Drag notes onto workspace, draw typed relationship edges (supports/contradicts/extends/questions/is_example_of)
- **Writing panel:** Compose permanent note with real-time originality checking

**Critical gates before saving:**
- Must rewrite in own words (similarity score vs. source <65%)
- Must connect to ≥1 existing note (no orphans)

**AI role:** Surfaces tensions ("Two highlights disagree—your note might address this"), suggests connections, checks originality. Never writes the note.
![Internals](assets/images/Mankey/synthesis.png)


### 3. **Hub Creation** (Meta-Synthesis)
When vault reaches critical mass, AI detects topic clusters and proposes hub notes—synthesis of syntheses that provide:

- High-level overview of 6-12 related permanent notes
- Visual topic map showing sub-themes and relationships
- Commentary explaining how ideas connect
- Navigation entry point for exploration

**Trigger conditions:**
- 6+ permanent notes with semantic similarity >0.7
- 40%+ interconnection density
- 3+ notes added to cluster recently

**AI role:** Detects clusters, groups into sub-themes, generates starter outline. User writes all synthesis text.

**Example workflow:**
User creates 9 permanent notes about attention, flow, and distraction over 3 weeks → AI suggests "The Architecture of Deep Work" hub → User writes a synthesis explaining how these form a coherent theory → Hub becomes a navigable entry point and pre-structured outline for publishing.

### 4. **Publishing** (Document Editor)
Editorial interface (cream paper, Playfair Display typography) for turning notes into public-facing work:

**Three interaction modes:**
- **Drop as paragraph:** Drag permanent note → becomes cited block with source attribution
- **Inline citation:** Select text + cite mode → link word/phrase to backing note → superscript [1] marker
- **Auto bibliography:** Every dropped note + citation automatically generates formatted reference list

**AI role:** All synthesis is user-driven. AI structures retrieval (sidebar grouping), user can use AI to assist writing based on their notes
![Internals](assets/images/Mankey/publishing.png)

---

## Knowledge Graph

Purpose-driven visualization solving Obsidian's "hairball problem":

**Three view modes:**
- **Neighborhood:** Selected note + immediate connections (radial layout)
- **Full graph:** All notes with force-directed layout + mini-map
- **Topic clusters:** AI-grouped semantic communities

**Visual hierarchy:**
- Node size = connection count (hubs actually larger)
- Node color = type (hub/permanent/quote/fleeting)
- Glow = created <7 days (recent thinking)
- Edge color = relationship type
- Dashed edges = "questions" relationship

**Actionable insights panel:**
Instead of passive visualization, actively guides:
- "3 orphaned permanent notes—consider linking"
- "Hub growing large (15+ connections)—split into 2?"
- "Disconnected clusters detected—bridge opportunity between 'attention' and 'environment'"

Each insight includes action button triggering relevant workflow (open synthesis workspace with orphan pre-loaded, show cluster gap notes, etc.).

---

## Technical Architecture

### Stack
- **Frontend:** Next.js + React (synthesis canvas, graph vis)
- **Backend:** Supabase (PostgreSQL + Auth + Storage)
- **AI:** GPT (clustering, originality checking)
- **Vector DB:** pgvector for semantic similarity (note embeddings)
- **Graph:** D3.js force simulation + SVG rendering


## Key Innovations

### 1. **Typed Relationship Edges**
Unlike folder hierarchies or simple "links," every connection has semantic meaning:
- **Supports:** reinforces the idea
- **Contradicts:** challenges or complicates
- **Extends:** takes idea further
- **Questions:** raises unsolved problem
- **Is example of:** concrete instance of abstract idea

Forces user to think about *how* ideas relate, not just *that* they relate. Powers graph queries: "Show me notes that contradict my hub thesis."

### 2. **No Orphan Policy**
Permanent notes cannot be saved without ≥1 connection. This single constraint:
- Prevents vault from becoming a graveyard of isolated thoughts
- Forces relational processing (stronger memory encoding)
- Builds naturally interconnected knowledge graph
- Makes every note part of a web of meaning

### 3. **Originality Meter**
Real-time visual feedback (green/yellow/red bar) showing string similarity to source material. Not a blocker—a mirror. Creates awareness without punishment. Users self-correct when they see "too close to source" because the goal (original synthesis) is explicit.

### 4. **Hub Notes as Emergent Structure**
Rather than forcing users to maintain index pages or MOCs that go stale, structure emerges from behavior:
- Write notes naturally
- AI detects when cluster is mature enough
- User accepts suggestion → creates hub
- Hub updates when new notes join cluster

Structure without premature organization. Folders by evolutionary design, not top-down taxonomy.

### 5. **Publishing Integration**
Most PKM systems are dead-ends—notes never become outputs. This system treats publishing as first-class:
- Drag notes directly into document
- Visual distinction between your writing vs. note-sourced paragraphs
- One-click conversion (detach from note source when ready to own it)
- Auto bibliography from citations
- Hub notes become pre-structured outlines

The vault isn't just a graveyard—it's a workshop for public-facing work.

---

## Impact Potential

**For learners:**
- Retain more from reading (generation effect)
- Build interconnected knowledge (not isolated facts)
- Produce public-facing work faster (vault → draft)

**For researchers:**
- Manage literature review systematically
- Synthesize across papers without losing thread
- Generate novel connections between fields

**For writers:**
- Evergreen note system feeds long-form output
- Sources and citations managed automatically
- Ideas compound rather than evaporate

---