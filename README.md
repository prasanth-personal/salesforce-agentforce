# Salesforce Agentforce: Lead + SAP Integration

Production-ready Salesforce Agentforce implementation with AI-powered lead management and real-time SAP inventory integration.

**Status:** Phase 2 Complete — MCP Server + Apex Backend Integration Live

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

## SAP Inventory Agent (Phase 2)

Real-time SAP integration via custom MCP Server and Apex backend — no middleware, no manual API calls.

**Architecture:**
- **Claude MCP Server** (`SalesforceSAPMCP`) — Org-specific platform endpoint
- **Apex Service** (`SAPInventoryService`) — Typed invocable methods for SAP queries
- **External Credentials** — OAuth 2.0 with JWT tokens + MCP scope
- **SAP Backend** — REST API via Named Credential

**What it does:**
Sales rep asks: *"Can we ship 500 units of IPX-200 by Friday?"*

Agent responds with live inventory, warehouse location, and lead time — from SAP, inside Salesforce, in seconds.

**Data Model:**
- `SAP_Product__c` — Product catalog mirror
- `SAP_Inventory__c` — Stock levels & warehouse locations  
- `SAP_Order__c` — Order tracking & fulfillment

**Key Implementation Details:**
- No hardcoded endpoints (Named Credentials)
- Type-safe Apex wrappers for API responses
- Zero Flow middleware (direct Apex → SAP)
- OAuth PKCE + JWT-based access tokens
- Production-ready for real S/4HANA endpoints

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
3. Assign permission sets:
   - `Agentforce_Lead_Access` — Lead Agent access
   - `SAP_Agent_Access` — SAP Agent access  
   - `MCP_Access` — MCP Server integration
   - `SAP_Mock_API_Access` — Mock API for testing

4. For SAP integration (Phase 2):
   - Configure MCP Server credentials in Setup → External Clients Apps
   - Update SAP endpoint in Named Credential (`SAP_Mock_API` → your S/4HANA instance)
   - Test flow: *"Check inventory for [product name]"*

## What We Built

| Phase | Architecture | Outcome |
|-------|--------------|---------|
| Phase 1 | Agentforce → Flow → External Services → SAP | Proof of concept: agents can call APIs |
| Phase 2 | Agentforce → MCP Server → Apex → Named Credential → SAP | Production: LLM + type-safe Apex + zero middleware |

## Key Insights

- **Agent = Trigger, Not Executor** — Claude extracts parameters from natural language and routes to your code. Your Apex, validation rules, and database logic all still apply.
- **MCP is the Missing Link** — Direct agent-to-backend connection without Flow overhead. Type safety + security at the contract layer.
- **One Checkbox Cost 40 Minutes** — "Issue JWT-based access tokens" in Connected App. OAuth setup is 90% credential config, 10% actual coding.
- **Real API Beats Trailhead** — Build something that calls a real endpoint. You'll understand Agentforce faster than any tutorial.

## Repository Structure

- `force-app/main/default/` — All metadata (agents, flows, Apex, custom objects)
- `SAPInventoryService.cls` — Apex backend for SAP queries
- `Lead_Agent_v2/` — Agentforce agent definition + action schemas
- `SAP_Check_Inventory_Flow_MCP.flow-meta.xml` — MCP-integrated inventory flow
- Custom objects: `SAP_Product__c`, `SAP_Inventory__c`, `SAP_Order__c`

See `METADATA_INVENTORY.md` for complete component list (38 production components).
