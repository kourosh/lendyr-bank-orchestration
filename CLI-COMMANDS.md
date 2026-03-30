# watsonx Orchestrate CLI Import Commands

This document provides the command-line instructions for importing the Lendyr Bank agents into watsonx Orchestrate.

## Prerequisites

1. Install the watsonx Orchestrate CLI
2. Authenticate with your Orchestrate environment
3. Navigate to the project directory

## Correct CLI Syntax

The watsonx Orchestrate CLI uses this syntax:
```bash
orchestrate agents import -f <path-to-file>
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
orchestrate agents import -f agents/account-balance-checker.yaml
```

Import the debit card activator:
```bash
orchestrate agents import -f agents/debit-card-activator.yaml
```

Import the money transfer agent:
```bash
orchestrate agents import -f agents/money-transfer-agent.yaml
```

#### Step 2: Import Orchestrator Agent

Import the orchestrator (must be last):
```bash
orchestrate agents import -f agents/orchestrator-agent.yaml
```

## Verification Commands

## Verification Commands

List all agents:
```bash
orchestrate agents list
```

Get details of a specific agent:
```bash
orchestrate agents get lendyr-bank-orchestrator
orchestrate agents get account-balance-checker
orchestrate agents get debit-card-activator
orchestrate agents get money-transfer-agent
```

## Troubleshooting

### Import Errors

If imports fail:

1. Verify YAML syntax is valid
2. Check that you have proper permissions
3. Ensure agent names don't conflict with existing agents
4. Import specialist agents before the orchestrator
5. Make sure you're using the correct syntax: `orchestrate agents import -f <file>`

### Checking CLI Version

```bash
orchestrate --version
```

## Quick Reference

```bash
# Navigate to project
cd /Users/kk76/Public/lendyr-bank-orchestration

# Run automated import script
./import-commands.sh

# Or import manually in order:
orchestrate agents import -f agents/account-balance-checker.yaml
orchestrate agents import -f agents/debit-card-activator.yaml
orchestrate agents import -f agents/money-transfer-agent.yaml
orchestrate agents import -f agents/orchestrator-agent.yaml

# Verify
orchestrate agents list
```

## Additional Resources

- [watsonx Orchestrate CLI Documentation](https://www.ibm.com/docs/en/watsonx/watson-orchestrate)
- [IBM Cloud CLI Documentation](https://cloud.ibm.com/docs/cli)
- Project README: `README.md`
- Import Guide: `IMPORT-GUIDE.md`