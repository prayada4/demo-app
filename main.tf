data "tfe_outputs" "vpc" {
  config = {
    organization = "demo-tfe"
    workspaces = {
      name = "Network-Team"
    }
  }
}

module "ec2-instance" {
  source  = "app.terraform.io/demo-tfe/ec2-instance/aws"
  version = "1.0.4"
  mysubnet = data.tfe_outputs.vpc.outputs.vpc_subnets
}
