plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Disable specific rules
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_unused_declarations" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}
