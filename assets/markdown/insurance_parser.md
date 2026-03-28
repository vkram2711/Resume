# AI Insurance Claim Parser

**Role:** Fullstack Developer
**Date:** 2024
**Stack:** Next.js 14, TypeScript, OpenAI API, Server-Sent Events, Levenshtein fuzzy matching

---

## Overview

A web tool that accepts uploaded insurance claim documents (PDF/image) and extracts structured field data using an LLM. Results stream to the browser in real time via Server-Sent Events, giving users immediate feedback as each field is parsed.

---

## The Problem

Insurance claim forms vary widely across providers — field names differ, OCR introduces typos, and required fields change between form versions. Manual review is slow and error-prone. The goal was to automate extraction while tolerating real-world document imperfections.

---

## Solution

### Document Parsing & LLM Extraction
- Uploaded files are converted to text (PDF parsing or OCR)
- A structured prompt sends the extracted text to the LLM, requesting key fields (claimant name, policy number, date of loss, claim amount, etc.) in JSON format
- The LLM response is validated against an expected schema

### Fuzzy Field Matching (Levenshtein)
- Field names from the LLM often don't exactly match the target schema (e.g., "Date of Incident" vs "date_of_loss")
- A Levenshtein-distance matcher maps extracted field names to the closest canonical field, tolerating OCR errors and naming variations
- Match confidence scores are shown in the UI so reviewers can spot uncertain mappings

### Real-Time Streaming (SSE)
- The Next.js API route uses Server-Sent Events to stream each field result as it's parsed
- The frontend renders a live-updating table: fields appear one by one as the LLM extracts them, rather than waiting for the full response
- Progress indicators show which fields are pending, confirmed, or flagged for review

### Frontend (Next.js 14 App Router)
- Drag-and-drop file upload with preview
- Side-by-side view: original document on the left, extracted fields on the right
- Color-coded confidence indicators (green / yellow / red) based on fuzzy match scores
- Export to CSV or structured JSON

---

## Key Technical Highlights

- **App Router + streaming:** Uses Next.js 14's native streaming support with `ReadableStream` for SSE — no third-party streaming library needed
- **Levenshtein normalization:** Normalized edit distance (distance / max length) provides a consistent 0–1 confidence score across field names of different lengths
- **Prompt engineering:** Structured output prompting with explicit JSON schema instructions significantly reduced hallucinations and improved field coverage vs. free-form extraction

---

## Results

- Reduced average claim review time by eliminating manual copy-paste from PDFs
- Fuzzy matching handled ~85% of field-name variations without manual configuration
- SSE streaming kept perceived latency low even for multi-page documents
