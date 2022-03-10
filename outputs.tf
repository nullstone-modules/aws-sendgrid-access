output "env" {
  value = [
    {
      name  = "SENDGRID_DOMAIN"
      value = local.domain
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "SENDGRID_API_KEY"
      value = data.aws_secretsmanager_secret_version.api_key.secret_string
    }
  ]
}

data "aws_secretsmanager_secret_version" "api_key" {
  secret_id = local.api_key_secret_name
}
