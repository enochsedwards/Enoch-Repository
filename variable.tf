
#provider variable
variable "region" {
  default     = "eu-west-2"
  description = "AWS Region"
}

#VPC naming convention
variable "chosen_name" {
  default     = "Tenacity"
  description = "name for VPC RouteTable resources"
}

#VPC naming convention
variable "chosen_name_2" {
  default     = "Prod"
  description = "name for main resources"
}

#VPC CIDR
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}

#Variable for public subnet 1
variable "pub-sub-1" {
  default     = "10.0.1.0/24"
  description = "This is the Public Subnet 1 CIDR Block"
}

#Variable for public subnet 1 AZ
variable "az_1_name" {
  default     = "eu-west-2a"
  description = "This is the AZ 1 FOR Public Subnet 1 "
}

#Variable for public subnet 2
variable "pub-sub-2" {
  default     = "10.0.2.0/24"
  description = "This is the Public Subnet 2 CIDR Block"
}

#Variable for public subnet 2 AZ
variable "az_2_name" {
  default     = "eu-west-2b"
  description = "This is the AZ 2 FOR Public Subnet 1 "
}

#Variable for private subnet 1
variable "priv-sub-1" {
  default     = "10.0.3.0/24"
  description = "This is the private Subnet 1 CIDR Block"
}

#Variable for private subnet 1 AZ
variable "az_3_name" {
  default     = "eu-west-2c"
  description = "This is the AZ 1 FOR private Subnet 1 "
}

#Variable for private subnet 2
variable "priv-sub-2" {
  default     = "10.0.4.0/24"
  description = "This is the private Subnet 2 CIDR Block"
}

#Variable for private subnet 2 AZ
variable "az_4_name" {
  default     = "eu-west-2b"
  description = "This is the AZ 2 FOR private Subnet 1 "
}

