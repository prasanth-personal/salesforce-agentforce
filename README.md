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

## Agent Business Workflow

The Lead Agent acts as an automated assistant for Sales teams. Here is the step-by-step business flow it is capable of executing:

1. **Retrieve Lead Information (`Get_Lead_Details`):** The agent looks up a specific Lead in Salesforce and pulls in all their current data.
2. **Enrich the Lead (`Enrich_Lead_Record`):** It fetches additional data to fill in missing gaps and updates custom fields such as `Lead_Score__c`, `Lead_Tier__c`, and `Is_Enriched__c`.
3. **Automate Outreach (`Draft_and_Send_Outreach_Email`):** Using generative AI and templates, the agent drafts a personalized email based on the enriched data and sends it directly to the prospect.
4. **Alert the Sales Rep (`Notify_Rep_Chatter`):** Finally, it posts an update to Salesforce Chatter to notify the assigned Sales Rep that the lead has been qualified and contacted.

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
