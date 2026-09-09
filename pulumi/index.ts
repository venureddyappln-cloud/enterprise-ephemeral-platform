import * as pulumi from "@pulumi/pulumi";
import * as azure_native from "@pulumi/azure-native";

// 1. Create a dynamic service plan (The computing engine context for developer sandboxes)
const appServicePlan = new azure_native.web.AppServicePlan("dev-sandbox-plan", {
    resourceGroupName: "enterprise-platform-rg",
    location: "EastUS",
    sku: {
        name: "B1", // Direct cost-saving Tier for ephemeral developers
        tier: "Basic",
    },
});

// 2. Automate an on-demand Developer App Sandbox instance
const developerSandboxApp = new azure_native.web.WebApp("dev-ephemeral-app", {
    resourceGroupName: "enterprise-platform-rg",
    location: "EastUS",
    serverFarmId: appServicePlan.id,
    siteConfig: {
        appSettings: [
            // Injecting live infrastructure variables safely directly into application memory spaces
            { name: "ENVIRONMENT", value: "dev-sandbox" },
            { name: "DATABASE_AUTO_PROVISION", value: "true" },
        ],
    },
});

// 3. Export the live URL endpoint passcard so developers can access their newly minted context instantly
export const liveSandboxEndpointUrl = developerSandboxApp.defaultHostName;
