# Lendyr Bank Multi-Agent Orchestration

A demonstration of multi-agent orchestration using IBM watsonx Orchestrate for a fictional bank's customer service system.

## Overview

This project showcases a basic multi-agent system where:
- An **orchestrator agent** handles initial customer interactions
- Three **specialist agents** handle specific banking tasks:
  - Account Balance Checker
  - Debit Card Activator
  - Money Transfer Agent

## Architecture

```
Customer
    ↓
Orchestrator Agent (Main Entry Point)
    ├─→ Account Balance Checker
    ├─→ Debit Card Activator
    └─→ Money Transfer Agent
```

## Project Structure

```
lendyr-bank-orchestration/
├── agents/
│   ├── lendyr_bank_orchestrator.py      # Main orchestrator (Python)
│   ├── account_balance_checker.py       # Balance inquiry agent (Python)
│   ├── debit_card_activator.py          # Card activation agent (Python)
│   ├── money_transfer_agent.py          # Money transfer agent (Python)
│   ├── orchestrator-agent.yaml          # Orchestrator (YAML - legacy)
│   ├── account-balance-checker.yaml     # Balance checker (YAML - legacy)
│   ├── debit-card-activator.yaml        # Card activator (YAML - legacy)
│   └── money-transfer-agent.yaml        # Money transfer (YAML - legacy)
├── flows/
│   └── bank-service-flow.yaml           # Orchestration flow definition
├── requirements.txt                      # Python dependencies
├── import-commands.sh                    # Automated import script
├── CLI-COMMANDS.md                       # CLI reference
├── IMPORT-GUIDE.md                       # Detailed import guide
└── README.md
```

## Sample Conversation Flow

1. **Customer**: Contacts Lendyr Bank
2. **Orchestrator**: "Thank you for contacting Lendyr Bank. How can I help you today?"
   - Option 1: Check account status
   - Option 2: Activate a debit card
   - Option 3: Transfer money
3. **Customer**: Selects an option
4. **Orchestrator**: Routes to appropriate specialist agent
5. **Specialist Agent**: Handles the request and provides simulated response
6. **Specialist Agent**: Offers to help with anything else

## Features

- **Multi-agent orchestration**: Demonstrates agent handoff and routing
- **Conversational AI**: Natural language interaction
- **Modular design**: Each agent has a specific responsibility
- **Demo-ready**: Agents provide simulated responses (no actual banking operations)
- **Python-based**: Uses watsonx Orchestrate ADK for agent definitions

## Prerequisites

- Python 3.8 or higher
- watsonx Orchestrate CLI installed
- watsonx Orchestrate ADK Python package

## Installation

1. Clone the repository:
```bash
git clone https://github.com/kourosh/lendyr-bank-orchestration.git
cd lendyr-bank-orchestration
```

2. Install Python dependencies:
```bash
pip install -r requirements.txt
```

## Deployment

### Import Agents Using Python Files

#### Option 1: Automated Script
```bash
./import-commands.sh
```

#### Option 2: Manual Import
```bash
# Import specialist agents first
orchestrate agents import -f agents/account_balance_checker.py
orchestrate agents import -f agents/debit_card_activator.py
orchestrate agents import -f agents/money_transfer_agent.py

# Import orchestrator last
orchestrate agents import -f agents/lendyr_bank_orchestrator.py

# Verify
orchestrate agents list
```

### Legacy YAML Import (Alternative)

If you prefer YAML format, you can use the legacy YAML files:
```bash
orchestrate agents import -f agents/account-balance-checker.yaml
orchestrate agents import -f agents/debit-card-activator.yaml
orchestrate agents import -f agents/money-transfer-agent.yaml
orchestrate agents import -f agents/orchestrator-agent.yaml
```

## Agent Details

### Orchestrator Agent (`lendyr_bank_orchestrator`)
- **Purpose**: Main entry point for customer interactions
- **Capabilities**: Greeting, option presentation, routing to specialists
- **Collaborators**: account_balance_checker, debit_card_activator, money_transfer_agent

### Account Balance Checker (`account_balance_checker`)
- **Purpose**: Handle account balance and status inquiries
- **Response**: Provides simulated account information
- **Demo Output**: Mock balance, transaction history, account status

### Debit Card Activator (`debit_card_activator`)
- **Purpose**: Handle debit card activation requests
- **Response**: Simulates card activation process
- **Demo Output**: Mock activation confirmation with card details

### Money Transfer Agent (`money_transfer_agent`)
- **Purpose**: Handle money transfer requests
- **Response**: Simulates money transfer process
- **Demo Output**: Mock transaction confirmation with transfer details

## Testing

Once imported, you can test the orchestration by:

1. Starting a conversation with the orchestrator agent
2. Selecting one of the three service options
3. Observing the handoff to the specialist agent
4. Reviewing the simulated response

## Agent Naming Rules

- Must start with a letter
- Can only contain: letters, numbers, and underscores
- No hyphens or special characters allowed

## Notes

- This is a **demonstration project** - agents provide simulated responses only
- No actual banking operations are performed
- In production, specialist agents would integrate with real banking systems
- Security, authentication, and compliance features are not included in this demo

## Documentation

- **CLI-COMMANDS.md**: Complete CLI command reference
- **IMPORT-GUIDE.md**: Step-by-step import instructions
- [watsonx Orchestrate ADK Documentation](https://developer.watson-orchestrate.ibm.com/agents/build_agent)
- [watsonx Orchestrate Documentation](https://www.ibm.com/docs/en/watsonx/watson-orchestrate)

## Future Enhancements

Potential additions for a production system:
- Customer authentication and verification
- Integration with actual banking APIs
- Transaction logging and audit trails
- Error handling and fallback scenarios
- Multi-language support
- Compliance and regulatory checks

## License

This is a demonstration project for educational purposes.

## Repository

- **GitHub**: https://github.com/kourosh/lendyr-bank-orchestration
- **Local**: `/Users/kk76/Public/lendyr-bank-orchestration`

## Author

Created as a demo for IBM watsonx Orchestrate multi-agent capabilities using the ADK.