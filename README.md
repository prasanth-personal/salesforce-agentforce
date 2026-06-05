# Salesforce Agentforce Project: Lead Agent

This project contains a Salesforce DX application that implements a custom AI agent using Salesforce Agentforce. The project includes custom data models, permission sets, and an AI-driven bot designed to manage and qualify leads.

## Project Overview

Here is a summary of what has been built in this repository:

### 1. Agentforce Bot (`Lead_Agent`)
An AI-powered Copilot bot (`Lead_Agent`) configured to assist with lead management and qualification. It uses generative AI to search trusted sources, interact with users, and handle complex workflows.
- The bot includes configurations for system dialogs, intent disambiguation, and error handling.
- Integrated with custom GenAI Planners (`Lead_Agent_v2`) to guide conversations.

### 2. Custom Data Model
The project extends the Salesforce data model to support lead generation, sessions, and guest feedback:
- **Lead (Standard Object Customized):** Added custom fields like `Lead_Score__c`, `Lead_Tier__c`, `Is_Enriched__c`, `Company_Size_Bucket__c`, and `ProductInterest__c` to capture advanced lead data.
- **Session__c (Custom Object):** Tracks experience sessions, including fields for `Capacity__c`, `Available_Slots__c`, `Start_Time__c`, `End_Time__c`, and `Status__c`.
- **Guest_Review__c (Custom Object):** Captures guest feedback and ratings (`Rating__c`, `Rating_Value__c`).
- **Experience__c (Custom Object):** Manages experiences that guests can book or attend.
- **Booking__c (Custom Object):** Tracks bookings for sessions.

### 3. Permission Sets
Specific permission sets have been created to grant necessary access to users and the AI agents:
- `Agentforce_Lead_Access`
- `Lead_Qualification_Agent_Permissions`
- `Coral_Cloud_Agent_Permissions`
- `Experience_Profile_Manager`

### 4. User Interface
- Custom tabs for `Session__c`, `Guest_Review__c`, `Experience__c`, and `Booking__c` to allow easy navigation and management within the Salesforce UI.
- Custom List Views for Leads (e.g., `AllOpenLeads`, `TodaysLeads`).

## How to Deploy

To deploy this project to your Salesforce organization:

1. Authenticate with your org:
   ```bash
   sf org login web -a my-org
   ```
2. Deploy the source code:
   ```bash
   sf project deploy start -o my-org
   ```
3. Assign the necessary Permission Sets to your user and to the integration users running the Agentforce bot.

## Further Reading
- [Salesforce Agentforce Documentation](https://developer.salesforce.com/docs/atlas.en-us.agentforce.meta/agentforce/agentforce_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
