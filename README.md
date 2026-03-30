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
│   ├── orchestrator-agent.yaml          # Main orchestrator
│   ├── account-balance-checker.yaml     # Balance inquiry agent
│   ├── debit-card-activator.yaml        # Card activation agent
│   └── money-transfer-agent.yaml        # Money transfer agent
├── flows/
│   └── bank-service-flow.yaml           # Orchestration flow definition
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

## Agents

### Orchestrator Agent
- **Purpose**: Main entry point for customer interactions
- **Capabilities**: Greeting, option presentation, routing to specialists
- **Handoff Logic**: Routes based on customer selection

### Account Balance Checker
- **Purpose**: Handle account balance and status inquiries
- **Response**: Provides simulated account information
- **Demo Output**: Mock balance, transaction history, account status

### Debit Card Activator
- **Purpose**: Handle debit card activation requests
- **Response**: Simulates card activation process
- **Demo Output**: Mock activation confirmation with card details

### Money Transfer Agent
- **Purpose**: Handle money transfer requests
- **Response**: Simulates money transfer process
- **Demo Output**: Mock transaction confirmation with transfer details

## Deployment

### Prerequisites
- IBM watsonx Orchestrate environment
- Access to watsonx Orchestrate CLI or UI

### Import Agents

To import these agents into your watsonx Orchestrate environment:

1. **Using the UI**:
   - Navigate to your watsonx Orchestrate workspace
   - Go to Agents section
   - Import each YAML file from the `agents/` directory
   - Import the flow from `flows/bank-service-flow.yaml`

2. **Using the CLI** (if available):
   ```bash
   # Import orchestrator
   wx-orchestrate agent import agents/orchestrator-agent.yaml
   
   # Import specialist agents
   wx-orchestrate agent import agents/account-balance-checker.yaml
   wx-orchestrate agent import agents/debit-card-activator.yaml
   wx-orchestrate agent import agents/money-transfer-agent.yaml
   
   # Import flow
   wx-orchestrate flow import flows/bank-service-flow.yaml
   ```

## Testing

Once imported, you can test the orchestration by:

1. Starting a conversation with the orchestrator agent
2. Selecting one of the three service options
3. Observing the handoff to the specialist agent
4. Reviewing the simulated response

## Notes

- This is a **demonstration project** - agents provide simulated responses only
- No actual banking operations are performed
- In production, specialist agents would integrate with real banking systems
- Security, authentication, and compliance features are not included in this demo

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

## Author

Created as a demo for IBM watsonx Orchestrate multi-agent capabilities.