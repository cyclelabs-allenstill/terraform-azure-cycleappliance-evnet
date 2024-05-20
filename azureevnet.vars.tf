# ---------------------------------------------------------------------------------------------------------------------
# DATA FETCHING VARIABLES
# Variables used for fetching data from Azure.
# ---------------------------------------------------------------------------------------------------------------------

variable "subscription_id" {
  description = "This is the subscription ID that Terraform will deploy the Cycle Appliance into. This subscription should be accessible by the user account that will be used during the az login."
  type        = string
}

# Fetching existing Development VNet to put this deployment onto, without creating a new VNet/public IP address.

variable "existing_subnet_name" {
  description = "Using a data block to fetch existing network resources; this is for the subnet."
  type        = string
}

variable "existing_vnet_name" {
  description = "Using a data block to fetch existing network resources; this is for the vnet."
  type        = string
}

variable "existing_vnet_rg_name" {
  description = "Using a data block to fetch existing network resources; this is for the resource group name that the vnet and subnet exist in."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# AZURE RESOURCE VARIABLES
# Variables used for generation of Azure resources.
# ---------------------------------------------------------------------------------------------------------------------

variable "resource_group_name_prefix" {
  description = "Prefix of the resource group name."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group. Some examples are: eastus, eastus2, westus, centralus"
  type        = string
}

variable "resource_name_prefix" {
  description = "Prefix of the resources that we create."
  type        = string
}

variable "env_tag" {
  description = "Environment tag for the terraform deployment."
  type        = string
}

variable "owner_tag" {
  description = "The person who created the resource."
  type        = string
}

variable "jenkins_mgr_sku" {
  default     = "Standard_D2_v4"
  description = "The VM SKU for the Jenkins Manager. We recommend a minimum instance SKU of Standard_DS1_v2, but if you want to increase the SKU you can do so. NOTE: We decided to use Azure VM SKU's without temporary disks attached, as we do not leverage these at all for the Jenkins Manager."
  type        = string
}

variable "ssh_key_name" {
  description = "Name of the SSH keypair file(s) within the /keys/ directory that you created using ssh-keygen. We will append the .pub and .pem."
  type        = string
}

#This locals block combines both the env_tag and owner_tag together. Feel free to add more variables for tags, add 
#those tags to the locals block (using owner and environment below as examples), and they'll be merged into all resources created with this code.
locals {
  std_tags = {
    owner       = var.owner_tag
    environment = var.env_tag
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CLOUD INIT VARIABLES
# Variables utilized in our cloud-init script that configures the Jenkins virtual machine post-deployment.
# ---------------------------------------------------------------------------------------------------------------------

variable "jenkinsadmin" {
  description = "Default Jenkins Admin user."
  type        = string
}

variable "jenkinspassword" {
  description = "Default Jenkins Admin password."
  type        = string
}

variable "jenkinsvmname" {
  description = "Name of the VM."
  type        = string
}

variable "agentvmregion" {
  description = "Agent Virtual Machine region for the Azure VM Agent plugin. These need to be in the format: East US, West US, East US 2, etc. The space is required."
  type        = string
}

variable "agentadminusername" {
  description = "Agent Admin username."
  type        = string
}

variable "agentadminpassword" {
  description = "Agent Admin password."
  type        = string
}
