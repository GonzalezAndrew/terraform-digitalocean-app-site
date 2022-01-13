variable "spec" {
  description = "(Required) A DigitalOcean App spec describing the app."
  type        = any
  default = [{
    name   = "test"
    region = "nyc1"

    domain = {
      name = "test.gonzalezandrew.com"
      type = "PRIMARY"
      zone = "gonzalezandrew.com"
    }

    static_site = {
      name             = "blog"
      build_command    = "hugo -d public"
      environment_slug = "hugo"
      source_dir       = "/"

      github = {
        repo           = "GonzalezAndrew/blog"
        branch         = "master"
        deploy_on_push = true
      }

      routes = {
        path = "/"
      }
    }
  }]
}
