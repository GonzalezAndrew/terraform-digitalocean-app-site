
# Deploy DigitalOcean App Platform resource.
# - docs: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/app
resource "digitalocean_app" "this" {
  dynamic "spec" {
    for_each = try(jsondecode(var.spec), var.spec)
    content {
      name   = spec.value.name
      region = spec.value.region

      dynamic "domain" {
        for_each = length(keys(lookup(spec.value, "domain", {}))) == 0 ? [] : [lookup(spec.value, "domain", {})]
        content {
          name     = domain.value.name
          type     = lookup(domain.value, "type", null)
          wildcard = lookup(domain.value, "wildcard", null)
          zone     = lookup(domain.value, "zone", null)
        }
      }

      dynamic "env" {
        for_each = lookup(spec.value, "env", [])

        content {
          key   = env.value.key
          value = env.value.value
          scope = lookup(env.value, "scope", "RUN_AND_BUILD_TIME")
          type  = env.value.type
        }
      }

      dynamic "static_site" {
        for_each = length(keys(lookup(spec.value, "static_site", {}))) == 0 ? [] : [lookup(spec.value, "static_site", {})]

        content {
          name              = static_site.value.name
          build_command     = lookup(static_site.value, "build_command", null)
          dockerfile_path   = lookup(static_site.value, "dockerfile_path", null)
          source_dir        = lookup(static_site.value, "source_dir", null)
          environment_slug  = static_site.value.environment_slug
          output_dir        = lookup(static_site.value, "output_dir", null)
          index_document    = lookup(static_site.value, "index_document", null)
          error_document    = lookup(static_site.value, "error_document", null)
          catchall_document = lookup(static_site.value, "catchall_document", null)

          dynamic "git" {
            for_each = length(keys(lookup(static_site.value, "git", {}))) == 0 ? [] : [lookup(static_site.value, "git", {})]

            content {
              repo_clone_url = git.value.repo_clone_url
              branch         = lookup(git.value, "branch", "master")
            }
          }

          dynamic "github" {
            for_each = length(keys(lookup(static_site.value, "github", {}))) == 0 ? [] : [lookup(static_site.value, "github", {})]

            content {
              repo           = github.value.repo
              branch         = lookup(github.value, "branch", "master")
              deploy_on_push = lookup(github.value, "deploy_on_push", true)
            }
          }

          dynamic "gitlab" {
            for_each = length(keys(lookup(static_site.value, "gitlab", {}))) == 0 ? [] : [lookup(static_site.value, "gitlab", {})]

            content {
              repo           = gitlab.value.repo
              branch         = lookup(gitlab.value, "branch", "master")
              deploy_on_push = lookup(gitlab.value, "deploy_on_push", true)
            }
          }

          dynamic "env" {
            for_each = lookup(static_site.value, "env", [])

            content {
              key   = env.value.key
              value = env.value.value
              scope = lookup(env.value, "scope", "RUN_AND_BUILD_TIME")
              type  = env.value.type
            }
          }

          //docs state 'route' but it should be 'routes'
          dynamic "routes" {
            for_each = length(keys(lookup(static_site.value, "routes", {}))) == 0 ? [] : [lookup(static_site.value, "routes", {})]

            content {
              path = lookup(routes.value, "path", "/")
            }
          }

          dynamic "cors" {
            for_each = lookup(static_site.value, "cors", [])
            content {
              // the following needs to be deleted from the docs https://github.com/digitalocean/terraform-provider-digitalocean/blob/f077a0792731b432d16b811cd17cdd6a5de4e115/vendor/github.com/digitalocean/godo/apps.gen.go#L430
              //allow_origins = lookup(cors.value, "allow_origins", null)
              //exact = lookup(cors.value, "exact", null)
              //prefix = lookup(cors.value, "prefix", null)
              //regex = lookup(cors.value, "regex", null)
              allow_headers     = lookup(cors.value, "allow_headers", null)
              max_age           = lookup(cors.value, "max_age", null)
              expose_headers    = lookup(cors.value, "expose_headers", null)
              allow_methods     = lookup(cors.value, "allow_methods", null)
              allow_credentials = lookup(cors.value, "allow_credentials", null)
            }
          }
        }
      }
    }
  }
}
