provider "aws" {
  region = "eu-east-1"
}

module "dydb_module" {
  source                                    = ""
  create_dynamodb_table                     = "true"
  name                                      = "swarm-dev-dyndbtable"
  read_capacity                             = 1
  write_capacity                            = 1
  billing_mode                              = "PROVISIONED"
  hash_key                                  = "node_type"
  create_dynamodb_table_multiple_attributes = "true"

  attributes = [{
    name = "name"
    type = "S"
  },
    {
      name = "number"
      type = "N"
    },
  ]

  attribute_type                = "S"
  enable_server_side_encryption = "true"
}
