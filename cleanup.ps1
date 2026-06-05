$targetDir = "c:\Users\prasa\OneDrive\Desktop\salesforce-agentforce\force-app\main\default"

# Remove unwanted root folders
Remove-Item -Recurse -Force "$targetDir\applications" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$targetDir\aura" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$targetDir\classes" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$targetDir\layouts" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$targetDir\lwc" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$targetDir\tabs" -ErrorAction SilentlyContinue

# Clean bots
Remove-Item -Force "$targetDir\bots\Lead_Agent\v1.botVersion-meta.xml" -ErrorAction SilentlyContinue

# Clean genAiPlannerBundles
Get-ChildItem -Path "$targetDir\genAiPlannerBundles" -Directory | Where-Object { $_.Name -ne "Lead_Agent_v2" } | Remove-Item -Recurse -Force

# Clean flows
$keepFlows = @("Get_Lead_Details.flow-meta.xml", "Draft_and_Send_Outreach_Email.flow-meta.xml", "Enrich_Lead_Record.flow-meta.xml", "Notify_Rep_Chatter.flow-meta.xml")
Get-ChildItem -Path "$targetDir\flows" -File | Where-Object { $keepFlows -notcontains $_.Name } | Remove-Item -Force

# Clean objects
Get-ChildItem -Path "$targetDir\objects" -Directory | Where-Object { $_.Name -ne "Lead" } | Remove-Item -Recurse -Force
# Inside Lead, remove listViews or others if they exist, but keeping fields
Get-ChildItem -Path "$targetDir\objects\Lead" -Directory | Where-Object { $_.Name -ne "fields" } | Remove-Item -Recurse -Force

# Clean permissionsets
Get-ChildItem -Path "$targetDir\permissionsets" -File | Where-Object { $_.Name -ne "Agentforce_Lead_Access.permissionset-meta.xml" } | Remove-Item -Force
