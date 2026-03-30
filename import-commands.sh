#!/bin/bash

# Lendyr Bank Multi-Agent Orchestration - Import Script
# This script imports all agents into watsonx Orchestrate using the CLI

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
orchestrate agents import -f agents/account-balance-checker.yaml
if [ $? -eq 0 ]; then
    echo "✓ Account Balance Checker imported successfully"
else
    echo "✗ Failed to import Account Balance Checker"
fi
echo ""

# Import Debit Card Activator
echo "Importing Debit Card Activator..."
orchestrate agents import -f agents/debit-card-activator.yaml
if [ $? -eq 0 ]; then
    echo "✓ Debit Card Activator imported successfully"
else
    echo "✗ Failed to import Debit Card Activator"
fi
echo ""

# Import Money Transfer Agent
echo "Importing Money Transfer Agent..."
orchestrate agents import -f agents/money-transfer-agent.yaml
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
orchestrate agents import -f agents/orchestrator-agent.yaml
if [ $? -eq 0 ]; then
    echo "✓ Orchestrator imported successfully"
else
    echo "✗ Failed to import Orchestrator"
fi
echo ""

echo "=========================================="
echo "Import Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Verify all agents: orchestrate agents list"
echo "2. Test the orchestrator agent"
echo "3. Test handoffs to specialist agents"
echo ""

# Made with Bob
