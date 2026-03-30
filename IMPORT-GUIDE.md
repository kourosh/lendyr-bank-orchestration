# Import Guide for watsonx Orchestrate

This guide provides step-by-step instructions for importing the Lendyr Bank multi-agent orchestration system into your watsonx Orchestrate environment.

## Prerequisites

- Access to IBM watsonx Orchestrate environment
- Appropriate permissions to create and manage agents
- The agent YAML files from this repository

## Import Order

Import the agents in this specific order to ensure proper dependencies:

1. **Specialist Agents** (can be imported in any order):
   - Account Balance Checker
   - Debit Card Activator
   - Money Transfer Agent

2. **Orchestrator Agent** (import last):
   - Lendyr Bank Orchestrator

3. **Flow** (optional, if supported):
   - Bank Service Flow

## Step-by-Step Import Instructions

### Method 1: Using the watsonx Orchestrate UI

#### Step 1: Access Your Orchestrate Environment

1. Log in to your IBM watsonx Orchestrate instance
2. Navigate to the **Agents** or **AI Assistants** section

#### Step 2: Import Specialist Agents

**Import Account Balance Checker:**

1. Click **Create Agent** or **Import Agent**
2. Select **Import from YAML** or **Upload File**
3. Upload or paste the contents of: `agents/account-balance-checker.yaml`
4. Review the agent configuration
5. Click **Save** or **Create**

**Import Debit Card Activator:**

1. Click **Create Agent** or **Import Agent**
2. Select **Import from YAML** or **Upload File**
3. Upload or paste the contents of: `agents/debit-card-activator.yaml`
4. Review the agent configuration
5. Click **Save** or **Create**

**Import Money Transfer Agent:**

1. Click **Create Agent** or **Import Agent**
2. Select **Import from YAML** or **Upload File**
3. Upload or paste the contents of: `agents/money-transfer-agent.yaml`
4. Review the agent configuration
5. Click **Save** or **Create**

#### Step 3: Import Orchestrator Agent

1. Click **Create Agent** or **Import Agent**
2. Select **Import from YAML** or **Upload File**
3. Upload or paste the contents of: `agents/orchestrator-agent.yaml`
4. Review the agent configuration
5. Verify that the collaborator references are correctly linked to the specialist agents
6. Click **Save** or **Create**

#### Step 4: Import Flow (Optional)

If your Orchestrate environment supports flow definitions:

1. Navigate to **Flows** or **Orchestration** section
2. Click **Create Flow** or **Import Flow**
3. Upload or paste the contents of: `flows/bank-service-flow.yaml`
4. Review the flow configuration
5. Click **Save** or **Create**

### Method 2: Using Documentation Import (if available)

According to the watsonx Orchestrate documentation, you may be able to import agents using the documentation feature:

1. Navigate to **Settings** > **Documentation Sources**
2. Add this GitHub repository as a documentation source
3. Configure the import settings
4. Select the agent files to import
5. Follow the prompts to complete the import

Reference: https://www.ibm.com/docs/en/watsonx/watson-orchestrate/base?topic=sources-using-documentation

## Verification Steps

After importing all agents:

1. **Check Agent List**: Verify all 4 agents appear in your agents list:
   - lendyr-bank-orchestrator
   - account-balance-checker
   - debit-card-activator
   - money-transfer-agent

2. **Test Orchestrator**: 
   - Open the orchestrator agent
   - Start a test conversation
   - Verify the greeting message appears correctly
   - Verify the three options are presented

3. **Test Handoffs**:
   - Select option 1 (Check account status)
   - Verify handoff to account-balance-checker
   - Verify the specialist agent responds appropriately
   
   - Repeat for option 2 (Activate debit card)
   - Repeat for option 3 (Transfer money)

## Troubleshooting

### Issue: Agent Import Fails

**Solution**: 
- Check that the YAML syntax is valid
- Ensure you have the necessary permissions
- Verify that agent names don't conflict with existing agents

### Issue: Collaborator References Not Working

**Solution**:
- Ensure specialist agents are imported before the orchestrator
- Verify agent names match exactly (case-sensitive)
- Check that collaborator configuration is supported in your Orchestrate version

### Issue: Handoff Not Working

**Solution**:
- Verify the orchestrator's collaborator configuration
- Check that handoff conditions are properly defined
- Test with explicit phrases that match the handoff conditions

## Testing the Multi-Agent System

### Test Scenario 1: Account Balance Check

1. Start conversation with orchestrator
2. Say: "I'd like to check my account balance" or select option 1
3. Expected: Handoff to account-balance-checker
4. Expected: Receive mock account balance information

### Test Scenario 2: Card Activation

1. Start conversation with orchestrator
2. Say: "I need to activate my debit card" or select option 2
3. Expected: Handoff to debit-card-activator
4. Expected: Receive mock card activation confirmation

### Test Scenario 3: Money Transfer

1. Start conversation with orchestrator
2. Say: "I want to transfer money" or select option 3
3. Expected: Handoff to money-transfer-agent
4. Expected: Receive mock transfer confirmation

## Configuration Notes

### Agent Names
- All agent names use lowercase with hyphens
- Names must match exactly in collaborator references

### Handoff Conditions
- The orchestrator uses natural language conditions
- Conditions are evaluated by the LLM
- You may need to adjust conditions based on your Orchestrate version

### Demo Mode
- All agents provide simulated responses
- No actual banking operations are performed
- Responses are hardcoded in the agent instructions

## Next Steps

After successful import:

1. **Customize Greetings**: Adjust the orchestrator's greeting message
2. **Refine Handoff Logic**: Fine-tune the handoff conditions
3. **Add Error Handling**: Implement fallback scenarios
4. **Integrate Real Systems**: Replace mock responses with actual API calls
5. **Add Authentication**: Implement customer verification
6. **Enhance Logging**: Add conversation tracking and analytics

## Support

For issues specific to watsonx Orchestrate:
- Consult the official documentation: https://www.ibm.com/docs/en/watsonx/watson-orchestrate
- Contact IBM Support
- Check the watsonx community forums

For issues with this demo project:
- Review the README.md
- Check the GitHub repository: https://github.com/kourosh/lendyr-bank-orchestration
- Examine the agent YAML files for configuration details

## Additional Resources

- [watsonx Orchestrate Documentation](https://www.ibm.com/docs/en/watsonx/watson-orchestrate)
- [Using Documentation Sources](https://www.ibm.com/docs/en/watsonx/watson-orchestrate/base?topic=sources-using-documentation)
- [Agent Configuration Guide](https://www.ibm.com/docs/en/watsonx/watson-orchestrate/base?topic=agents-creating)
- [Multi-Agent Orchestration](https://www.ibm.com/docs/en/watsonx/watson-orchestrate/base?topic=agents-orchestration)