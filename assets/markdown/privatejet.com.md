
# PrivateJet.com — AI Pricing & Sales Automation
Link: [https://privatejet.com/](https://privatejet.com/)

## Overview
PrivateJet.com is a charter flight brokerage platform connecting clients with private jet operators.
The traditional sales process required a client to call the sales team just to get a rough price —
creating friction and slowing down the funnel. This project replaced that with an AI-driven pricing
layer that gives users instant estimates upfront, so they can self-qualify before ever speaking to a human.

## How It Works

### Instant Price Estimation
An XGBoost model trained on 100,000+ historical charter flight records predicts pricing for any
given route, aircraft type, and date. When a user queries a flight, they receive an estimated price
range immediately — no sales call required. If the estimate fits their budget, they can request a
formal quote, at which point the sales team takes over. This filters out unqualified leads and lets
sales focus on warm, interested prospects.

**Key inputs to the model:**
- Route (origin / destination)
- Aircraft category
- Aircraft model
- Date and seasonality
- Historical demand signals

**Result:** ~20% improvement in quote accuracy, faster sales turnaround.

![Internals](assets/images/Jet/estimate.png)


### Wilbur — LLM Sales Agent
Wilbur is an LLM-powered agent that acts as a conversational interface for
the pricing model. Rather than requiring users or sales staff to interact with a dashboard directly,
Wilbur handles natural language requests and calls the prediction model as a tool.

**Example flow:**
1. User asks Wilbur: *"How much would a flight from London to Dubai next Friday cost?"*
2. Wilbur extracts intent and parameters, calls the pricing model
3. Model returns a price estimate
4. Wilbur formats and delivers the response conversationally

This allows the pricing intelligence to be embedded naturally into sales workflows and
customer-facing chat interfaces without requiring technical knowledge to operate.

![Internals](assets/images/Jet/wilbur.png)

## Tech Stack
- **ML Model:** XGBoost (trained on structured historical flight data)
- **LLM Agent:** Locally hosted LLM with tool-calling capability (Wilbur)
- **Backend:** Python, FastAPI
- **Deployment:** On-premise (locally hosted for data privacy)

