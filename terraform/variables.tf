variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        terraform = "true"
    }  
}

variable "project_name" {
    default = "roboshop"  
}

variable "environment" {
    default = "dev"  
}

variable "zone_name" {
    default = "projoy.store"
}

variable "tags" {
    default = {
        Component = "catalogue"
    }  
}

variable "app_version" {    
  
}

variable "iam_instance_profile" {
  default = "EC2RoleLearning"
}