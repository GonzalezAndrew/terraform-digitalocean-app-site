# Terraform DigitalOcean Hugo App Platform Module

A Terraform module for deploying a Hugo static website to DigitalOcean App Platform.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.1, < 1.1.4 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_app.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_spec"></a> [spec](#input\_spec) | (Required) A DigitalOcean App spec describing the app. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_deployment_id"></a> [active\_deployment\_id](#output\_active\_deployment\_id) | The ID the app's currently active deployment. |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time of when the app was created. |
| <a name="output_default_ingress"></a> [default\_ingress](#output\_default\_ingress) | The default URL to access the app. |
| <a name="output_id"></a> [id](#output\_id) | ID of the app. |
| <a name="output_live_url"></a> [live\_url](#output\_live\_url) | The live URL of the app. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The date and time of when the app was last updated. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
