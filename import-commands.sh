#!/bin/bash

# Lendyr Bank Multi-Agent Orchestration - Import Script
# This script imports all agents into watsonx Orchestrate using the CLI

# Note: Replace 'wx-orchestrate' with the actual CLI command name for your environment
# Common alternatives: 'orchestrate', 'ibm-orchestrate', 'watsonx-orchestrate'

# Set your Orchestrate environment details
# ORCHESTRATE_URL="https://your-orchestrate-instance.ibm.com"
# ORCHESTRATE_API_KEY="your-api-key"

echo "=========================================="
echo "Lendyr Bank Agent Import Script"
echo "=========================================="
echo ""

# Change to the project directory
cd "$(dirname "$0")"

echo "Step 1: Importing Specialist Agents..."
echo "----------------------------------------"

# Import Account Balance Checker
echo "Importing Account Balance Checker..."
wx-orchestrate agent import agents/account-balance-checker.yaml
if [ $? -eq 0 ]; then
    echo "✓ Account Balance Checker imported successfully"
else
    echo "✗ Failed to import Account Balance Checker"
fi
echo ""

# Import Debit Card Activator
echo "Importing Debit Card Activator..."
wx-orchestrate agent import agents/debit-card-activator.yaml
if [ $? -eq 0 ]; then
    echo "✓ Debit Card Activator imported successfully"
else
    echo "✗ Failed to import Debit Card Activator"
fi
echo ""

# Import Money Transfer Agent
echo "Importing Money Transfer Agent..."
wx-orchestrate agent import agents/money-transfer-agent.yaml
if [ $? -eq 0 ]; then
    echo "✓ Money Transfer Agent imported successfully"
else
    echo "✗ Failed to import Money Transfer Agent"
fi
echo ""

echo "Step 2: Importing Orchestrator Agent..."
echo "----------------------------------------"

# Import Orchestrator (must be last to ensure collaborators exist)
echo "Importing Lendyr Bank Orchestrator..."
wx-orchestrate agent import agents/orchestrator-agent.yaml
if [ $? -eq 0 ]; then
    echo "✓ Orchestrator imported successfully"
else
    echo "✗ Failed to import Orchestrator"
fi
echo ""

echo "Step 3: Importing Flow (Optional)..."
echo "----------------------------------------"

# Import Flow
echo "Importing Bank Service Flow..."
wx-orchestrate flow import flows/bank-service-flow.yaml
if [ $? -eq 0 ]; then
    echo "✓ Flow imported successfully"
else
    echo "✗ Failed to import Flow (may not be supported)"
fi
echo ""

echo "=========================================="
echo "Import Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Verify all agents in your Orchestrate UI"
echo "2. Test the orchestrator agent"
echo "3. Test handoffs to specialist agents"
echo ""

# Made with Bob
