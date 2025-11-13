# Copilot-ZoomIt-Demos

Collection of ZoomIt Demo Files I use with Copilot

## Overview

This repository contains demo script files for use with Microsoft Copilot demonstrations. The `Set-DemoScript.ps1` PowerShell script helps manage and prepare these demo files for presentation.

## How It Works

### Set-DemoScript.ps1

The PowerShell script provides an interactive menu to select and prepare demo scripts:

1. **Lists all demo files** - Displays all `.txt` files in the current directory (excluding `CurrentDemo.txt`)
2. **Copies selected content** - Copies the chosen demo file content to `CurrentDemo.txt`
3. **Replaces variable placeholders** - Reads variables from a `.env` file and replaces all `<VARIABLE_NAME>` placeholders in the copied content with actual values
4. **Displays final content** - Shows the processed content ready for use

### Variable Replacement

To use customer-specific or sensitive information without committing it to the repository:

1. Create a `.env` file in the repository root (use `.env.example` as a template)
2. Define variables in the format: `VARIABLE_NAME=value`
3. In your demo `.txt` files, use placeholders like `<CUSTOMER_NAME>`, `<SHAREPOINT_URL>`, etc.
4. When you run `Set-DemoScript.ps1`, all placeholders will be automatically replaced with the actual values from your `.env` file

**Example:**

- `.env` file: `CUSTOMER_NAME=Contoso Ltd`
- Demo file: `What opportunities are there for <CUSTOMER_NAME>?`
- Result in `CurrentDemo.txt`: `What opportunities are there for Contoso Ltd?`

## ZoomIt Configuration

**Important:** Configure ZoomIt to read from the `CurrentDemo.txt` file in this folder path. This ensures that ZoomIt always displays the current demo script you've selected and processed with the script.

## Usage

1. Run `.\Set-DemoScript.ps1` in PowerShell
2. Select the demo script you want to use
3. The script will copy it to `CurrentDemo.txt` and replace any variable placeholders
4. ZoomIt will display the processed content during your demo


## Available Demo Scripts

| Category | Demo File | Description |
|----------|-----------|-------------|
| **Analyst** | Analyst - Generic.txt | Iterative data analysis workflow - analyzes uploaded dataset, provides insights, and helps craft detailed CFO-ready prompts |
| **Analyst** | Analyst - Oil and Gas Sales.txt | CFO-ready energy sales analysis covering segment performance, product profitability, trends, and risk detection |
| **Analyst** | Analyst - Refinery Production.txt | ULSD production analysis with daily trends, rolling averages, alerts, forecasting, and capacity planning |
| **Analyst** | Analyst - Sales Data.txt | Executive sales performance summary with trends, top products, customer segments, and anomaly detection |
| **CPS Lite** | CPS Lite - IT Help Buddy.txt | IT support agent that answers questions using ServiceNow knowledge base articles |
| **CPS Lite** | CPS Lite - My Sales Assistant.txt | Sales helper agent that queries Salesforce for opportunities, accounts, and contacts |
| **CPS Lite** | CPS Lite - My Writing Assistant.txt | Content drafting agent that creates emails, speeches, and memos in user's personal style |
| **Create** | Create - Oil Rig.txt | Image generation demo - creates custom oil rig scene at dusk with logo incorporation |
| **Excel** | Excel - Twitter Sentiment Analysis.txt | Sentiment analysis workflow with Python-based analysis, row-by-row scoring, and time-based visualization |
| **Power Platform** | Power Platform Plan Designer - Safety.txt | Safety management system design with mobile reporting, trend tracking, and AI assistant |
| **Researcher** | Researcher - Financial Earnings Call.txt | Prepares executives for earnings calls with top analyst questions based on trends and competitor data |
| **Researcher** | Researcher - Gulf Coast Fuel Supply Demand Snapshot.txt | Gulf Coast fuel market analysis with supply-demand trends, constraints, and trading recommendations |
| **Researcher** | Researcher - Investor Relations Call Prep.txt | Prepares leadership for investor calls by analyzing competitor data and macro-economic conditions |
| **Teams** | Teams - Meeting Recap.txt | Post-meeting analysis extracting attendee roles, key points, decisions, and contentious topics |