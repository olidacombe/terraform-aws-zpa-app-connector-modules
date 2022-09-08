variable "name_prefix" {
  type        = string
  description = "A prefix to associate to all the App Connector IAM module resources"
  default     = null
}

variable "resource_tag" {
  type        = string
  description = "A tag to associate to all the App Connector IAM module resources"
  default     = null
}

variable "global_tags" {
  type        = map(string)
  description = "Populate any custom user defined tags from a map"
  default     = {}
}

variable "iam_role_policy_ssmcore" {
  type        = string
  description = "App Connector EC2 Instance predefined IAM Role to access AWS SSM"
  default     = "AmazonSSMManagedInstanceCore"
}

variable "iam_count" {
  type        = number
  description = "Default number IAM roles/policies/profiles to create"
  default     = 1
}

variable "byo_iam" {
  type        = bool
  description = "Bring your own IAM Instance Profile for App Connector. Setting this variable to true will effectively instruct this module to not create any resources and only reference data resources from values provided in byo_iam_instance_profile_id"
  default     = false
}

variable "byo_iam_instance_profile_id" {
  type        = list(string)
  description = "Existing IAM Instance Profile IDs for App Connector association"
  default     = null
}