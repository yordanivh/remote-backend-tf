 terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Yordanh_free"

    workspaces {
      name = "workspace-atlas-remote-backend"
    }
  }
} 
resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
