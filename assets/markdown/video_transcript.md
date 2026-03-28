# Video Transcript — Local Whisper Transcription Tool

**Role:** Fullstack Developer
**Date:** 2023
**Stack:** Python, Flask, WebSockets, OpenAI Whisper, React
**GitHub (transcription):** [vkram2711/video-transcript](https://github.com/vkram2711/video-transcript)
**GitHub (Q&A):** [vkram2711/QA-over-video](https://github.com/vkram2711/QA-over-video)

---

## Overview

Two companion tools built around the same idea: make video content queryable.

1. **Video Transcript** — a full-stack web app that transcribes video files using OpenAI's Whisper model running **entirely locally**. Upload a video, watch the transcript appear word-by-word in the browser as the model processes each chunk.
2. **QA-over-video** — a local CLI script that indexes the generated transcript with LangChain + FAISS + OpenAI embeddings and lets you ask natural-language questions about the video content.

---

## How It Works

1. **Upload** — The user selects a video file via the React frontend
2. **Process** — The Flask backend receives the file and feeds it to the local Whisper model chunk-by-chunk
3. **Stream** — As each chunk is transcribed, the backend emits a WebSocket event with the partial result
4. **Display** — The frontend receives updates in real time and appends them to a live transcript view

---

## Tech Stack

### Backend
- **Python + Flask** — handles file upload, processing pipeline, and WebSocket server
- **OpenAI Whisper (local)** — speech-to-text model running on-device via `whisper` Python package
- **ffmpeg** — video demuxing and audio extraction before feeding to Whisper

### Frontend
- **React** — file upload UI and live transcript display
- **WebSocket client** — connects to the backend stream and renders partial transcription results as they arrive

---

## QA-over-video

A local Python script that takes the transcript produced by the transcription tool and makes it queryable:

1. **Embed** — the transcript is split into chunks and embedded using OpenAI's embeddings model
2. **Index** — embeddings are stored in a local FAISS vector index (no external database needed)
3. **Query** — the user types a natural-language question; the script retrieves the most relevant chunks via similarity search and passes them to an LLM (via LangChain) to generate an answer

This turns a passive video transcript into an interactive knowledge source — useful for long lectures, interviews, or meeting recordings where you want to find specific information without rewatching.

---

## Key Design Decisions

**Local model over API** — Running Whisper locally means no latency from network round-trips and no cost per minute of audio. For longer videos this is a significant advantage over the hosted API.

**WebSocket streaming** — Rather than waiting for the full transcription to finish (which can take minutes for long videos), the backend emits partial results chunk-by-chunk. The user sees progress immediately and can start reading/editing before the job completes.

---

## Setup

```bash
# Backend
cd videoTranscribeServer
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
python main.py

# Frontend
cd video-transcript-front
npm install && npm start
```

Requires `ffmpeg` installed and available on the system path.
