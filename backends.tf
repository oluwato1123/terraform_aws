terraform {
  cloud {
    organization = "oluwato-terraform"

    workspaces {
      name = "fade_dev"
    }
  }
}
