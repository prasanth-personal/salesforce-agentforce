# Lead Agent Project

This repository contains the metadata for a custom Salesforce Agentforce AI bot designed to assist with lead management.

## Components Included

1. **Agentforce Bot**: The `Lead_Agent` Copilot bot (v2) and its associated GenAI planner.
2. **Email Content**: Outreach email templates used by the bot.
3. **Flows**: The core flows triggered by the lead agent:
   - Get Lead Details
   - Draft and Send Outreach Email
   - Enrich Lead Record
   - Notify Rep Chatter
4. **Lead Data Model**: Custom fields added to the standard Lead object.
5. **Permissions**: The `Agentforce_Lead_Access` permission set required to run the agent.

## Deployment Steps

1. Authenticate to your Salesforce org:
   ```bash
   sf org login web
   ```
2. Deploy the source code:
   ```bash
   sf project deploy start
   ```
3. Assign the `Agentforce_Lead_Access` permission set to the necessary users.
