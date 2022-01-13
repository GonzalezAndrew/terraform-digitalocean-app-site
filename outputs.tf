output "id" {
  description = "ID of the app."
  value       = digitalocean_app.this.id
}

output "default_ingress" {
  description = "The default URL to access the app."
  value       = digitalocean_app.this.default_ingress
}

output "live_url" {
  description = "The live URL of the app."
  value       = digitalocean_app.this.live_url
}

output "active_deployment_id" {
  description = "The ID the app's currently active deployment."
  value       = digitalocean_app.this.active_deployment_id
}

output "updated_at" {
  description = "The date and time of when the app was last updated."
  value       = digitalocean_app.this.updated_at
}

output "created_at" {
  description = "The date and time of when the app was created."
  value       = digitalocean_app.this.created_at
}
