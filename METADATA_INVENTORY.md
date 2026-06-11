# Salesforce Agentforce Metadata Inventory
**Date:** 2026-06-11  
**Org:** vsbejagamvijayagent@gmail.com  
**Org ID:** 00Dg500000BLCB8EAP

---

## 📋 Summary

All metadata from your Agentforce org has been successfully retrieved and synced to the local repository. Below is a complete inventory of all components.

---

## 🤖 Agentforce Components

### Bots & Agents
- **Lead_Agent** (Bot)
  - Location: `force-app/main/default/bots/Lead_Agent/`
  - Version: v2
  - Files: `Lead_Agent.bot-meta.xml`, `v2.botVersion-meta.xml`

### GenAI Planner Bundles
- **Lead_Agent_v2** (GenAI Planner Bundle)
  - Location: `force-app/main/default/genAiPlannerBundles/Lead_Agent_v2/`
  - Components:
    - Agent Graph: `Lead_Agent_v2_graph.json`
    - Agent Script: `Lead_Agent_v2_definition.agent`
    - Local Actions: Draft & Send Email, Enrich Lead, Get Lead Details, Notify Rep
    - Input/Output Schemas for all actions

---

## 🔄 Flows (SAP Agent & Lead Agent)

### SAP Inventory Flows
- `SAP_Check_Inventory_Flow` - Standard SAP inventory check flow
- `SAP_Check_Inventory_Flow_MCP` - MCP-integrated inventory check flow

### Lead Agent Flows
- `Lead_AI_Agent` - Main Lead AI Agent flow
- `Get_Lead_Details` - Retrieves lead information
- `Enrich_Lead_Record` - Enriches lead data
- `Draft_and_Send_Outreach_Email` - Email outreach automation
- `Notify_Rep_Chatter` - Chatter notification flow

### Supporting Flows
- `Add_Experiences_to_Prompt` - Experience management
- `Create_Experience_Session_Booking` - Booking flows
- `ESA_Route_to_Queue` / `Route_to_ESA` - Queue routing
- `Create_a_Case_Running_User` - Case creation
- `Get_Customer_Details` - Customer data retrieval
- `Get_Experience_Details` - Experience details
- `Get_Sessions` - Session management
- `Issue_Resort_Credit` / `Issue_Bulk_Resort_Credits` - Credit management
- `PersonalizedSchedule` - Schedule personalization
- `customer_satisfaction` - Customer satisfaction surveys
- `discovery_call_assessment` - Discovery call assessments
- `net_promoter_score` - NPS tracking

**Total Flows:** 18

---

## 💻 Apex Classes & Tests

### SAP-Related Classes
- **SAPInventoryService** (`SAPInventoryService.cls`)
  - Test Class: `SAPInventoryServiceTest.cls`
  - Purpose: Integration with SAP systems for inventory management

### LLM & AI Services
- **LLMService** (`LLMService.cls`)
  - Purpose: Language Model integration for AI capabilities

### Weather Integration
- **WeatherService** (`WeatherService.cls`)
  - Test Class: `WeatherServiceTest.cls`
  - Purpose: Weather data integration

### Experience Management
- **ExperienceBookingHelper** (`ExperienceBookingHelper.cls`)
- **ExperienceController** (`ExperienceController.cls`)
  - Test Class: `ExperienceControllerTest.cls`
- **ExperienceSessionController** (`ExperienceSessionController.cls`)

### Context & Data Services
- **ContextService** (`ContextService.cls`)
- **PersonalizedGuestExperiences** (`PersonalizedGuestExperiences.cls`)

### Social Media Integration
- **SocialMediaController** (`SocialMediaController.cls`)
- **SocialMediaPostsController** (`SocialMediaPostsController.cls`)

### Community & Authentication
- **CommunitiesLoginController** + Test
- **CommunitiesLandingController** + Test
- **CommunitiesSelfRegController** + Test
- **CommunitiesSelfRegConfirmController** + Test
- **SiteLoginController** + Test
- **SiteRegisterController** + Test
- **LightningLoginFormController** + Test
- **LightningForgotPasswordController** + Test
- **LightningSelfRegisterController** + Test
- **ForgotPasswordController** + Test
- **ChangePasswordController** + Test
- **MyProfilePageController** + Test
- **MicrobatchSelfRegController** + Test

### Data Generation & Utilities
- **SampleDataGenerator** (`SampleDataGenerator.cls`)
- **SampleDataTest** (`SampleDataTest.cls`)
- **SampleBookingBatch** (`SampleBookingBatch.cls`)
- **CheckWeather** (`CheckWeather.cls`)

**Total Apex Classes:** 50+  
**Total Test Classes:** 20+

---

## 🔐 Security & Credentials

### Named Credentials
1. **SAP_Mock_API** (`SAP_Mock_API.namedCredential-meta.xml`)
   - Purpose: Mock API endpoint for SAP integration testing

2. **Weather_Endpoint** (`Weather_Endpoint.namedCredential-meta.xml`)
   - Purpose: Weather service API integration

### Permission Sets & Groups
- **Agentforce_Lead_Access** - Lead Agent access permissions
- Salesforce standard permission groups (Agentforce, Commerce, Copilot, Enablement, Partner, Subscription Management)

**Note:** External Credentials and Connected Apps are managed at the org level via Setup UI (not available via metadata API in this version).

---

## 📊 Custom Objects (SAP Integration)

### SAP_Product__c
- Fields:
  - `Name`
  - `Product_Code__c`
  - `Description__c`

### SAP_Inventory__c
- Fields:
  - `SAP_Product__c` (Lookup to Product)
  - `Quantity_Available__c`
  - `Lead_Time_Days__c`
  - `Warehouse_Location__c`

### SAP_Order__c
- Fields:
  - `Account__c` (Lookup to Account)
  - `SAP_Product__c` (Lookup to Product)
  - `Quantity__c`
  - `Status__c`
  - `Estimated_Delivery_Date__c`

### Lead (Standard + Custom Fields)
- Custom Fields:
  - `Is_Enriched__c`
  - `Lead_Score__c`
  - `Lead_Tier__c`
  - `Company_Size_Bucket__c`
  - `NumberofLocations__c`
  - `Primary__c`
  - `ProductInterest__c`

---

## 📧 Email Templates

### AI Outreach Email Templates
- `AI_Outreach_Default`
- `AI_Outreach_Manufacturing`
- `AI_Outreach_Technology`

---

## 🔧 MCP Server Configuration

### Integration Points
- **SAP Inventory Flow MCP** - Enables MCP protocol integration for SAP inventory checks
- **Flow Actions** - Flows are configured with MCP-compatible action schemas

### Configuration Details
- Action input/output schemas located in: `force-app/main/default/genAiPlannerBundles/Lead_Agent_v2/localActions/`
- Each action has defined input and output schemas in JSON format

---

## 📁 Directory Structure

```
force-app/main/default/
├── bots/
│   └── Lead_Agent/
├── classes/ (50+ files)
├── email/ (3 templates)
├── flows/ (18 files)
├── genAiPlannerBundles/
│   └── Lead_Agent_v2/
│       ├── agentGraph/
│       ├── agentScript/
│       ├── localActions/
│       └── Lead_Agent_v2.genAiPlannerBundle
├── namedCredentials/ (2 files)
├── objects/
│   ├── Lead/
│   ├── SAP_Inventory__c/
│   ├── SAP_Order__c/
│   └── SAP_Product__c/
└── permissionsetgroups/ (14+ files)
```

---

## ✅ Sync Status

| Component | Status | Count |
|-----------|--------|-------|
| Bots | ✅ Retrieved | 1 |
| GenAI Planner Bundles | ✅ Retrieved | 1 |
| Flows | ✅ Retrieved | 18 |
| Apex Classes | ✅ Retrieved | 50+ |
| Named Credentials | ✅ Retrieved | 2 |
| Permission Sets | ✅ Retrieved | 15+ |
| Custom Objects | ✅ Retrieved | 3 + 1 (Lead) |
| Email Templates | ✅ Retrieved | 3 |
| **Total** | **✅ Complete** | **100+** |

---

## 📝 Next Steps

1. **Review SAP Integration** - Check `SAPInventoryService.cls` for business logic
2. **Test MCP Integration** - Validate `SAP_Check_Inventory_Flow_MCP` with your MCP server
3. **Lead Agent Tuning** - Review `Lead_Agent_v2_definition.agent` for prompt optimization
4. **External Credentials Setup** - Configure OAuth/auth flows via Setup UI for:
   - Connected Apps
   - External Credentials (for secure MCP communication)

---

**All metadata is now committed to your local repository and ready for version control.**
