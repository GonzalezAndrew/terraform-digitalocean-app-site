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
| <a name="input_spec"></a> [spec](#input\_spec) | (Required) A DigitalOcean App spec describing the app. | `any` | <pre>[<br>  {<br>    "domain": {<br>      "name": "test.gonzalezandrew.com",<br>      "type": "PRIMARY",<br>      "zone": "gonzalezandrew.com"<br>    },<br>    "name": "test",<br>    "region": "nyc1",<br>    "static_site": {<br>      "build_command": "hugo -d public",<br>      "environment_slug": "hugo",<br>      "github": {<br>        "branch": "master",<br>        "deploy_on_push": true,<br>        "repo": "GonzalezAndrew/blog"<br>      },<br>      "name": "blog",<br>      "routes": {<br>        "path": "/"<br>      },<br>      "source_dir": "/"<br>    }<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
