terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "google" {
  credentials = file("summer-presence-345605-5766a10b87e0.json")
  project     = "summer-presence-345605"
  region      = "us-central1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}