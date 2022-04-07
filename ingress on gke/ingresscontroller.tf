resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  timeout    = 300

  values = [<<EOF
controller:
  admissionWebhooks:
    enabled: false
  electionID: ingress-controller-leader-internal
  ingressClass: nginx-hello-world-namespace
  podLabels:
    app: ingress-nginx
  service:
    annotations:
      service.beta.kubernetes.io/gcp-load-balancer-type: nlb
  scope:
    enabled: true
rbac:
  scope: true
EOF
  ]
}