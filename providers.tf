terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "1.1.1"
    }
  }
}

provider "env0" {
  alias = "env0"
}
