#!/bin/bash

# Cleanup Script - Remove old YAML-based agents from watsonx Orchestrate
# Run this before importing the new Python agents

echo "=========================================="
echo "Lendyr Bank Agent Cleanup Script"
echo "=========================================="
echo ""
echo "This script will remove the old YAML-based agents"
echo "from your watsonx Orchestrate environment."
echo ""

# List of agents to remove (using the old names with hyphens)
AGENTS=(
    "lendyr-bank-orchestrator"
    "lendyr_bank_orchestrator"
    "account-balance-checker"
    "account_balance_checker"
    "debit-card-activator"
    "debit_card_activator"
    "money-transfer-agent"
    "money_transfer_agent"
)

echo "Attempting to remove agents..."
echo "----------------------------------------"

for agent in "${AGENTS[@]}"; do
    echo "Removing agent: $agent"
    orchestrate agents delete "$agent" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✓ Successfully removed $agent"
    else
        echo "  (Agent $agent not found or already removed)"
    fi
done

echo ""
echo "=========================================="
echo "Cleanup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Run ./import-commands.sh to import the new Python agents"
echo "2. Verify with: orchestrate agents list"
echo ""

# Made with Bob
