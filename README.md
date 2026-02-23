# Copilot-ZoomIt-Demos

Collection of ZoomIt Demo Files I use with Copilot

## Overview

This repository contains demo script files for use with Microsoft Copilot demonstrations. The `Set-DemoScript.ps1` PowerShell script helps manage and prepare these demo files for presentation.

## How It Works

### Set-DemoScript.ps1

The PowerShell script provides an interactive menu to select and prepare demo scripts:

1. **Lists all demo files** - Displays all `.txt` files in the current directory (excluding the output file)
2. **Copies selected content** - Copies the chosen demo file content to your output file (`CurrentDemo.txt` by default, or custom file from `.env`)
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

### Custom Output File

You can define a custom output file name using the `.env` file instead of the default `CurrentDemo.txt`:

1. Add `OUTPUT_FILE=YourCustomFileName.txt` to your `.env` file
2. The script will use your custom file name for the processed output
3. Configure ZoomIt to read from your custom file path

**Example:**

- `.env` file: `OUTPUT_FILE=MyDemo.txt`
- The script will create and update `MyDemo.txt` instead of `CurrentDemo.txt`

## ZoomIt Configuration

**Important:** Configure ZoomIt to read from the `CurrentDemo.txt` file (or your custom output file defined in `.env`) in this folder path. This ensures that ZoomIt always displays the current demo script you've selected and processed with the script.

## Usage

1. Run `.\Set-DemoScript.ps1` in PowerShell
2. Select the demo script you want to use
3. The script will copy it to your output file (`CurrentDemo.txt` by default, or custom file from `.env`) and replace any variable placeholders
4. ZoomIt will display the processed content during your demo


## Available Demo Scripts

| Category | Demo File | Description |
|----------|-----------|-------------|
| **Agent Builder** | Agent Builder - IT Help Buddy.txt | IT support agent that answers questions using ServiceNow knowledge base articles |
| **Agent Builder** | Agent Builder - My Sales Assistant.txt | Sales helper agent that queries Salesforce for opportunities, accounts, and contacts |
| **Agent Builder** | Agent Builder - My Writing Assistant.txt | Content drafting agent that creates emails, speeches, and memos in user's personal style |
| **Analyst** | Analyst - Generic.txt | Iterative data analysis workflow - analyzes uploaded dataset, provides insights, and helps craft detailed CFO-ready prompts |
| **Analyst** | Analyst - Oil and Gas Sales.txt | CFO-ready energy sales analysis covering segment performance, product profitability, trends, and risk detection |
| **Analyst** | Analyst - Plant Performance.txt | Manufacturing plant analysis covering energy intensity, flared gas, unit performance, and actionable recommendations with visualizations |
| **Analyst** | Analyst - Prep for Deeper Analysis - Sales Metrics.txt | Advanced data analysis workflow exploring trends, correlations, and visualizations, then generating optimized prompts for impactful CFO reports |
| **Analyst** | Analyst - Refinery Production.txt | ULSD production analysis with daily trends, rolling averages, alerts, forecasting, and capacity planning |
| **Analyst** | Analyst - Sales Data.txt | Executive sales performance summary with trends, top products, customer segments, and anomaly detection |
| **Chat** | Chat - Agent Builder Writing Sample.txt | Demo preparation tool that curates writing style samples from emails to train a Copilot Agent with personalized communication patterns |
| **Chat** | Chat - Copilot Personalization.txt | Automatically generates personalized Custom instructions for Microsoft 365 Copilot Chat by analyzing user's recent work context and patterns |
| **Chat** | Chat - Generate Analyst Demo Prompt and Content.txt | Demo preparation tool that generates industry-specific Analyst scenarios, prompts, and synthetic datasets for customer presentations |
| **Chat** | Chat - Generate Researcher Demo Prompt.txt | Demo preparation tool that creates industry-relevant Researcher scenarios and prompts for customer presentations |
| **Chat** | Chat - Prep for Researcher Cracking Tech.txt | Research prompt generator for petrochemical catalytic cracking technologies focused on emissions and yield improvements |
| **Chat** | Chat - Priorities.txt | Simple personal productivity prompt for identifying daily priorities with thoughtful analysis |
| **Chat** | Chat - Researcher Prep Prompt.txt | Research planning workflow that outlines information needs and sources for executive earnings call preparation |
| **Create** | Create - Oil Rig.txt | Image generation demo - creates custom oil rig scene at dusk with logo incorporation |
| **Excel** | Excel - Twitter Sentiment Analysis.txt | Sentiment analysis workflow with Python-based analysis, row-by-row scoring, and time-based visualization |
| **Finance Agent** | Finance Agent - Variance Contoso.txt | Financial data transformation for variance analysis - fills customer names, removes invalid rows, formats amounts, and converts CAD to USD |
| **Notebook** | Notebook.txt | Meeting briefing preparation workflow with stakeholder analysis, situation summary, and executive-friendly talking points |
| **Power Platform** | Power Platform Plan Designer - Safety.txt | Safety management system design with mobile reporting, trend tracking, and AI assistant |
| **Researcher** | Researcher - Financial Earnings Call.txt | Prepares executives for earnings calls with top analyst questions based on trends and competitor data |
| **Researcher** | Researcher - Gen AI Application.txt | Comprehensive briefing on generative AI and autonomous agent opportunities across business units with industry trends and use cases |
| **Researcher** | Researcher - Gulf Coast Fuel Supply Demand Snapshot.txt | Gulf Coast fuel market analysis with supply-demand trends, constraints, and trading recommendations |
| **Researcher** | Researcher - Investor Relations Call Prep.txt | Prepares leadership for investor calls by analyzing competitor data and macro-economic conditions |
| **Researcher** | Researcher - Legal - Contract Review Playbook.txt | Comprehensive MSA/SOW contract review playbook for oilfield services with clause-by-clause guidance and triage checklist |
| **Researcher** | Researcher - Legal - Gen AI Readiness Brief.txt | AI governance readiness brief covering 2025-2026 regulatory changes, internal policy outline, and vendor contract requirements |
| **Teams** | Teams - Meeting Recap.txt | Post-meeting analysis extracting attendee roles, key points, decisions, and contentious topics |
