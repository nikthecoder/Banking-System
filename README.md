# Bank System

## Overview

This database project involves the creation and management of a banking system. It includes tables, procedures, triggers, and functions designed to handle various banking operations such as account creation, deposits, withdrawals, transfers, and user authentication.

## Table Structure

- **bankkund**: Stores customer information including personal details and passwords.
- **kontotyp**: Contains different account types with their respective interest rates.
- **ränteändring**: Tracks changes in interest rates for specific account types.
- **konto**: Stores account details including account number, account type, registration date, and balance.
- **kontoägare**: Maps account owners to their respective accounts.
- **uttag**: Records withdrawal transactions.
- **insättning**: Stores deposit transactions.
- **överföring**: Keeps track of transfer transactions between accounts.

## Procedures

- **do_insättning**: Handles deposit operations by updating account balances after inserting a deposit record.
- **do_bankkund**: Manages customer creation by inserting customer details into the bankkund table.
- **do_överföring**: Controls transfer operations between accounts, checking authorization and updating balances.
- **do_uttag**: Handles withdrawal transactions by verifying authorization and updating account balances.

## Triggers

- **aifer_överföring**: Updates account balances after a successful transfer.
- **bifer_uttag**: Validates withdrawal amount against available balance before the withdrawal transaction.
- **aifer_insättning**: Updates account balances after a successful deposit.
- **biufer_bankkund**: Ensures password length validation for bankkund table's password column.
- **aifer_uttag**: Updates account balances after successful withdrawal.

## Functions

- **get_behörighet**: Determines account ownership based on provided account number and personal identification.
- **get_saldo**: Retrieves the account balance for a given account number.
- **logga_in**: Validates user login by checking credentials against bankkund records.

## Sequence

- **radnr_seq**: Generates unique sequence numbers for various table primary keys.
