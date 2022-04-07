resource "kubernetes_ingress_v1" "jenkins-ingress" {
   metadata {
      name        = "movie-ingress"
      annotations = {
        "kubernetes.io/ingress.class": "nginx-default"
      }
   }
   spec {
      rule {
        http {
         path {
           path = "/bollywood"
           backend {
             service {
               name = "bollywood-svc"
               port {
                 number = 80
               }
             }
           }
        }
         path {
           path = "/hollywood"
           backend {
             service {
               name = "hollywood-svc"
               port {
                 number = 80
               }
             }
           }
        }
         path {
           path = "/tollywood"
           backend {
             service {
               name = "tollywood-svc"
               port {
                 number = 80
               }
             }
           }
        }                                
      }
    }
  }
}