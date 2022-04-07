resource "kubernetes_deployment" "bollywood_deployment" {
  metadata {
    name = "bollywood"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "bollywood"
      }
    }
    template {
      metadata {
        labels = {
          app = "bollywood"
        }
      }
      spec {
        container {
            image = "harshal1098/ingressimages:bollywood"
            name = "bollywood"
          }
      }
    }
  }
}

resource "kubernetes_service" "bollywood_service" {
  depends_on = [kubernetes_deployment.bollywood_deployment]

  metadata {
    name = "bollywood-svc"
  }
  spec {
    port {
        port = 80
        protocol = "TCP"
        target_port = 10010
      }
    selector ={
      app = "bollywood"
    }
  }
}


resource "kubernetes_deployment" "hollywood_deployment" {
  metadata {
    name = "hollywood"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "hollywood"
      }
    }
    template {
      metadata {
        labels = {
          app = "hollywood"
        }
      }
      spec {
        container {
            image = "harshal1098/ingressimages:hollywood"
            name = "hollywood"
          }
      }
    }
  }
}

resource "kubernetes_service" "hollywood_service" {
  depends_on = [kubernetes_deployment.hollywood_deployment]
  metadata {
    name = "hollywood-svc"
  }
  spec {
    port {
        port = 80
        protocol = "TCP"
        target_port = 10011
      }
    selector ={
      app = "hollywood"
    }
  }
}  


resource "kubernetes_deployment" "tollywood_deployment" {
  metadata {
    name = "tollywood"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "tollywood"
      }
    }
    template {
      metadata {
        labels = {
          app = "tollywood"
        }
      }
      spec {
        container {
            image = "harshal1098/ingressimages:tollywood"
            name = "tollywood"
          }
      }
    }
  }
}

resource "kubernetes_service" "tollywood_service" {
  depends_on = [kubernetes_deployment.tollywood_deployment]
  metadata {
    name = "tollywood-svc"
  }
  spec {
    port {
        port = 80
        protocol = "TCP"
        target_port = 10012
      }
    selector ={
      app = "tollywood"
    }
  }
}
