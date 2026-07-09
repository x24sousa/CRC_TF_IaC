### Default AWS provider ###
provider "aws" {
  region = var.region_west
}

### Aliased AWS provider ###
provider "aws" {
  region = var.region_east
  alias  = "aws_east"

}



#test comment #5