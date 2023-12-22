# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
module "non-prod-1" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "atharvaaws69+nonprod1@gmail.com"
    AccountName               = "NonProd-1"
    # Syntax for top-level OU
    #ManagedOrganizationalUnit = "CT Sandbox (ou-zocf-rol4w54d)"
    # Syntax for nested OU
    ManagedOrganizationalUnit = "NonProd"
    SSOUserEmail              = "atharvaaws69+nonprod1@gmail.com"
    SSOUserFirstName          = "NonProd"
    SSOUserLastName           = "1"
  }

  account_tags = {
    "CT:Owner"       = "atharvaaws69+nonprod1@gmail.com"
    "CT:Environment" = "NonProd"
    "CT:CostCenter"  = "123456" #TODO
  }

  change_management_parameters = {
    change_requested_by = "Blazeclan"
    change_reason       = "22-12-2023"
  }

  custom_fields = {
    ##### VPC IP CIDR #####
    # A valid IPv4 CIDR range for creating VPC in the new AWS account using AFT Customisation
    # example: 10.10.1.0/24
    # Set the value to "NA" if you dont want AFT Customisation to create a VPC in the new AWS account
    vpc_cidr = "10.127.4.0/24"

    ##### Environment Code #####
    # The environment of the AWS Account - Accepatable values are PROD, NONPROD, SANDBOX
    # This value will be used to attach the VPC to the right TGW Route Table
    account_env = "NONPROD"

    ##### Public Subnet #####
    # A flag to indicate if you want AFT Customisation to create public subnet and IGW in the new AWS account
    # Accepted Values: true / false
    create_public_subnet = true

    ##### Gateway VPC Endpoint - S3 #####
    # A flag to indicate if you want AFT Customisation to create Gateway VPC Endpoint for S3
    # Accepted Values: true / false
    create_gw_vpce_s3 = true

    ##### Gateway VPC Endpoint - DynamoDB #####
    # A flag to indicate if you want AFT Customisation to create Gateway VPC Endpoint for DynamoDB
    # Accepted Values: true / false
    create_gw_vpce_dd = true

    ##### Budget amount #####
    # Will define the monthly recurring Budget threshold for the account (US$). Notifications will be sent when the pre-defined thresholds are breached
    # Predefined thresholds 50, 80 and 100%
    # Type: Integer
    budget_amount = 100

    ##### Application support email address #####
    # 1. Will be subscribed to SNS topic in account for notifications such as AWS Budgets, etc.
    # 2. Useful for IT Operations Cloud team to reach out to in case of any follow ups, clarifications
    app_support_email_address = "atharvaaws+nonprod1@gmail.com"

    ##### Budget Notification Thresholds #####
    # Comma-seperated list of thresholds for budget notification
    budget_notification_thresholds = "70,90,100"

    ##### De-Centralized Egress  #####
    # A flag to indicate if internet-egress traffic will use locally created NAT Gateway instead of centralised egress via Network Firewall in the Central Inspection account
    # Accepted Values: true / false
    # if set to "TRUE" - Public subnet and a NAT gateway will be created in the new account and Internet-Egress will be routed through it
    # if set to "FALSE" - Internet-Egress traffic will be routed via central inspection VPC
    # Default for standard-vpc is 'false'
    decentralized_egress = false

    ##### NAT Gateway #####
    # This parameter will be used only for the following AFT Customisation Template, this value will be omited for other AFT templates
    #   1. Sandbox
    #   2. Generic
    # A flag to indicate if you want AFT Customisation to create NAT Gateway
    # "create_public_subnet" parameter should be set to "TRUE" as NAT Gateway requires public subnet
    # Accepted Values: true / false
    # Default for standard-vpc is 'true'
    create_nat_gateway = true
  }

  account_customizations_name = "non-prod-accounts"
}