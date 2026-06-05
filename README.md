# Lead Agent Project

This repository contains the metadata for a custom Salesforce Agentforce AI bot designed to assist with lead management.

## Components Included

1. **Agentforce Bot (`Lead_Agent_v2`)**: The AI reasoning engine (Copilot) that interprets prompts and dynamically selects the right tools (Flows) to execute tasks.
2. **Email Content (`AI_Outreach_*`)**: Pre-configured email templates containing dynamic merge fields (e.g., Name, Company) and the Calendly booking link.
3. **Core Sub-Flows**: The individual "skills" the Agent uses to perform work:
   - `Get_Lead_Details`: Looks up a Lead in the database.
   - `Enrich_Lead_Record`: Updates the Lead with scoring data (`Lead_Score__c`, `Lead_Tier__c`).
   - `Draft_and_Send_Outreach_Email`: Uses Generative AI and templates to email the prospect.
   - `Notify_Rep_Chatter`: Posts an alert to the Sales Rep on Salesforce Chatter.
4. **Automation Trigger (`Lead_AI_Agent`)**: A Record-Triggered Flow that listens for new Leads and automatically dispatches the Agentforce Bot in the background (Autonomous mode) to run the business workflow.
5. **Lead Data Model**: Custom fields on the standard Lead object used to store enrichment data and Einstein Lead Scores.
6. **Permissions (`Agentforce_Lead_Access`)**: The specific Permission Set required to grant the Agent access to Leads, Chatter, and the required Flows.

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
