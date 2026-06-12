# Salesforce Agentforce - SAP & Lead Agent Repository
**Date:** 2026-06-12  
**Org:** vsbejagamvijayagent@gmail.com  
**Org ID:** 00Dg500000BLCB8EAP  
**Status:** Production-Ready (Agent Components Only)

---

## 📋 Overview

Cleaned and optimized repository containing only SAP Agent and Lead Agent components. All boilerplate, experience management, and portal components have been removed.

---

## 🤖 Agent Components

### Bots
- **Lead_Agent** (`Lead_Agent.bot`)
  - Orchestrates Lead enrichment and outreach workflows
  - Integrates with GenAI Planner for intelligent decision-making

### GenAI Planner Bundles  
- **Lead_Agent_v2** (Lead_Agent_v2.genAiPlannerBundle)
  - Agent Definition: `Lead_Agent_v2_definition.agent`
  - Agent Graph: `Lead_Agent_v2_graph.json`
  - Action Schemas: Input/output definitions for all agent actions

---

## 🔄 Flows (7 Total)

### Lead Agent Workflows
- **Lead_AI_Agent** - Main lead processing orchestration
- **Get_Lead_Details** - Fetch lead information
- **Enrich_Lead_Record** - AI-powered lead enrichment
- **Draft_and_Send_Outreach_Email** - Email generation and sending
- **Notify_Rep_Chatter** - Sales rep notifications

### SAP Integration Workflows  
- **SAP_Check_Inventory_Flow** - Standard SAP inventory queries
- **SAP_Check_Inventory_Flow_MCP** - MCP-integrated inventory checks

---

## 💻 Apex Classes (2 Total)

### SAP Integration Service
- **SAPInventoryService** (`SAPInventoryService.cls`)
  - Test: `SAPInventoryServiceTest.cls`
  - Handles SAP inventory lookups and data synchronization

---

## 🔐 Security & Credentials

### Permission Sets (6 Total)
- **Agentforce_Lead_Access** - Lead Agent system access
- **Lead_Agent_Access** - Lead agent user permissions
- **SAP_Agent_Access** - SAP agent system permissions
- **SAP_Mock_API_Access** - Mock API access for testing
- **SAP_Perm_Set** - Core SAP permissions
- **MCP_Access** - MCP (Model Context Protocol) access

### Named Credentials (2 Total)
- **SAP_Mock_API** - SAP endpoint: `https://sap-api-agent.free.beeceptor.com`
- **Weather_Endpoint** - Weather API: `https://api.brightsky.dev`

### External Credentials (1 Total)
- **SAP_Mock_External** - Authentication for SAP Mock API

### External Client Apps (1 Total)
- **Claude_Connect_Salesforce_MCP** - MCP server integration
  - OAuth Settings: `Claude_Connect_Salesforce_MCP_oauth.ecaOauth`
  - OAuth Policies: `Claude_Connect_Salesforce_MCP_oauthPlcy.ecaOauthPlcy`

### MCP Server Definition (1 Total)
- **SalesforceSAPMCP** - Salesforce MCP server definition for SAP integration

---

## 📊 Custom Objects (4 Total)

### SAP Objects
- **SAP_Product__c** - Product catalog
- **SAP_Inventory__c** - Inventory levels and warehouse locations
- **SAP_Order__c** - Sales orders and fulfillment

### Lead Object
- **Lead** (Custom fields only)
  - `Is_Enriched__c` - Enrichment status flag
  - `Lead_Score__c` - AI-calculated lead score
  - `Lead_Tier__c` - Lead classification tier
  - `Company_Size_Bucket__c` - Company size category
  - `NumberofLocations__c` - Organization locations
  - `Primary__c` - Primary contact indicator
  - `ProductInterest__c` - Product interest tracking
  - `CurrentGenerators__c` - Current business generators
  - `SICCode__c` - Industry classification

---

## 📧 Email Templates (3 Total)

- `AI_Outreach_Default` - Default outreach template
- `AI_Outreach_Manufacturing` - Manufacturing industry template
- `AI_Outreach_Technology` - Technology industry template

---

## 📁 Directory Structure

```
force-app/main/default/
├── bots/
│   └── Lead_Agent.bot
├── classes/
│   ├── SAPInventoryService.cls
│   ├── SAPInventoryService.cls-meta.xml
│   ├── SAPInventoryServiceTest.cls
│   └── SAPInventoryServiceTest.cls-meta.xml
├── email/
│   └── unfiled$public/
│       ├── AI_Outreach_*.email
│       └── AI_Outreach_*.email-meta.xml
├── externalClientApps/
│   └── Claude_Connect_Salesforce_MCP.eca-meta.xml
├── externalCredentials/
│   └── SAP_Mock_External.externalCredential-meta.xml
├── extlClntAppOauthSettings/
│   ├── Claude_Connect_Salesforce_MCP_oauth.ecaOauth
│   └── Claude_Connect_Salesforce_MCP_oauth.ecaOauth-meta.xml
├── extlClntAppOauthPolicies/
│   ├── Claude_Connect_Salesforce_MCP_oauthPlcy.ecaOauthPlcy
│   └── Claude_Connect_Salesforce_MCP_oauthPlcy.ecaOauthPlcy-meta.xml
├── flows/
│   ├── Lead_AI_Agent.flow-meta.xml
│   ├── Get_Lead_Details.flow-meta.xml
│   ├── Enrich_Lead_Record.flow-meta.xml
│   ├── Draft_and_Send_Outreach_Email.flow-meta.xml
│   ├── Notify_Rep_Chatter.flow-meta.xml
│   ├── SAP_Check_Inventory_Flow.flow-meta.xml
│   └── SAP_Check_Inventory_Flow_MCP.flow-meta.xml
├── genAiPlannerBundles/
│   └── Lead_Agent_v2/
│       ├── agentGraph/
│       ├── agentScript/
│       ├── localActions/
│       └── Lead_Agent_v2.genAiPlannerBundle
├── mcpServerDefinitions/
│   └── SalesforceSAPMCP.mcpServerDefinition-meta.xml
├── namedCredentials/
│   ├── SAP_Mock_API.namedCredential-meta.xml
│   └── Weather_Endpoint.namedCredential-meta.xml
├── objects/
│   ├── Lead/
│   ├── SAP_Inventory__c/
│   ├── SAP_Order__c/
│   └── SAP_Product__c/
└── permissionsets/
    ├── Agentforce_Lead_Access.permissionset-meta.xml
    ├── Lead_Agent_Access.permissionset-meta.xml
    ├── MCP_Access.permissionset-meta.xml
    ├── SAP_Agent_Access.permissionset-meta.xml
    ├── SAP_Mock_API_Access.permissionset-meta.xml
    └── SAP_Perm_Set.permissionset-meta.xml
```

---

## ✅ Component Summary

| Component | Count |
|-----------|-------|
| Bots | 1 |
| GenAI Planner Bundles | 1 |
| Flows | 7 |
| Apex Classes | 2 |
| Permission Sets | 6 |
| Named Credentials | 2 |
| External Credentials | 1 |
| External Client Apps | 1 |
| MCP Server Definitions | 1 |
| Email Templates | 3 |
| Custom Objects | 3 |
| Lead Custom Fields | 9 |
| **TOTAL** | **38** |

---

## 🧹 Removed Components

**Deleted:** 135 files including:
- Boilerplate portal & community controllers
- Experience management components
- Weather, LLM, and context services
- Sample data generators
- All permission set groups
- 30+ standard Lead object fields

**Remaining:** Production-ready agent components only

---

## 🚀 Quick Start

1. Deploy to Salesforce: `sf project deploy start -d force-app`
2. Configure MCP server credentials in Setup
3. Test Lead Agent via Flow UI
4. Verify SAP inventory flow execution

**Repository is clean, optimized, and ready for production.**
