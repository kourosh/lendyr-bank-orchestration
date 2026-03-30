# watsonx Orchestrate CLI Import Commands

This document provides the command-line instructions for importing the Lendyr Bank agents into watsonx Orchestrate.

## Prerequisites

1. Install the watsonx Orchestrate CLI (the exact command name may vary)
2. Authenticate with your Orchestrate environment
3. Navigate to the project directory

## Authentication (if required)

```bash
# Example authentication commands (adjust based on your CLI)
wx-orchestrate login --url https://your-orchestrate-instance.ibm.com
# or
wx-orchestrate auth --api-key YOUR_API_KEY
```

## Import Commands

### Option 1: Run the Automated Script

```bash
cd /Users/kk76/Public/lendyr-bank-orchestration
./import-commands.sh
```

### Option 2: Manual Import (Individual Commands)

Navigate to the project directory:
```bash
cd /Users/kk76/Public/lendyr-bank-orchestration
```

#### Step 1: Import Specialist Agents First

Import the account balance checker:
```bash
wx-orchestrate agent import agents/account-balance-checker.yaml
```

Import the debit card activator:
```bash
wx-orchestrate agent import agents/debit-card-activator.yaml
```

Import the money transfer agent:
```bash
wx-orchestrate agent import agents/money-transfer-agent.yaml
```

#### Step 2: Import Orchestrator Agent

Import the orchestrator (must be last):
```bash
wx-orchestrate agent import agents/orchestrator-agent.yaml
```

#### Step 3: Import Flow (Optional)

Import the orchestration flow:
```bash
wx-orchestrate flow import flows/bank-service-flow.yaml
```

## Alternative CLI Command Names

The CLI command name may vary depending on your installation. Try these alternatives if `wx-orchestrate` doesn't work:

```bash
# Alternative 1
orchestrate agent import agents/account-balance-checker.yaml

# Alternative 2
ibm-orchestrate agent import agents/account-balance-checker.yaml

# Alternative 3
watsonx-orchestrate agent import agents/account-balance-checker.yaml

# Alternative 4 (using IBM Cloud CLI plugin)
ibmcloud orchestrate agent import agents/account-balance-checker.yaml
```

## Verification Commands

List all agents:
```bash
wx-orchestrate agent list
```

Get details of a specific agent:
```bash
wx-orchestrate agent get lendyr-bank-orchestrator
wx-orchestrate agent get account-balance-checker
wx-orchestrate agent get debit-card-activator
wx-orchestrate agent get money-transfer-agent
```

List all flows:
```bash
wx-orchestrate flow list
```

## Troubleshooting

### Command Not Found

If you get "command not found", you may need to:

1. Install the watsonx Orchestrate CLI
2. Check the correct command name in your environment
3. Ensure the CLI is in your PATH

### Authentication Errors

If you get authentication errors:

```bash
# Re-authenticate
wx-orchestrate login

# Or set environment variables
export ORCHESTRATE_URL="https://your-instance.ibm.com"
export ORCHESTRATE_API_KEY="your-api-key"
```

### Import Errors

If imports fail:

1. Verify YAML syntax is valid
2. Check that you have proper permissions
3. Ensure agent names don't conflict with existing agents
4. Import specialist agents before the orchestrator

### Checking CLI Version

```bash
wx-orchestrate version
# or
wx-orchestrate --version
```

## Using IBM Cloud CLI (Alternative Method)

If using IBM Cloud CLI with Orchestrate plugin:

```bash
# Login to IBM Cloud
ibmcloud login --sso

# Target your Orchestrate instance
ibmcloud target -r us-south -g your-resource-group

# Import agents
ibmcloud orchestrate agent import agents/account-balance-checker.yaml
ibmcloud orchestrate agent import agents/debit-card-activator.yaml
ibmcloud orchestrate agent import agents/money-transfer-agent.yaml
ibmcloud orchestrate agent import agents/orchestrator-agent.yaml
```

## API-Based Import (If CLI Not Available)

If CLI is not available, you can use the REST API:

```bash
# Set variables
ORCHESTRATE_URL="https://your-instance.ibm.com"
API_KEY="your-api-key"

# Import agent using curl
curl -X POST "${ORCHESTRATE_URL}/api/v1/agents" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/yaml" \
  --data-binary @agents/account-balance-checker.yaml
```

## Quick Reference

```bash
# Navigate to project
cd /Users/kk76/Public/lendyr-bank-orchestration

# Run automated import
./import-commands.sh

# Or import manually in order:
wx-orchestrate agent import agents/account-balance-checker.yaml
wx-orchestrate agent import agents/debit-card-activator.yaml
wx-orchestrate agent import agents/money-transfer-agent.yaml
wx-orchestrate agent import agents/orchestrator-agent.yaml
wx-orchestrate flow import flows/bank-service-flow.yaml

# Verify
wx-orchestrate agent list
```

## Additional Resources

- [watsonx Orchestrate CLI Documentation](https://www.ibm.com/docs/en/watsonx/watson-orchestrate)
- [IBM Cloud CLI Documentation](https://cloud.ibm.com/docs/cli)
- Project README: `README.md`
- Import Guide: `IMPORT-GUIDE.md`