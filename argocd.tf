resource "helm_release" "argocd" {
  name = "argocd"

  depends_on = [ module.eks ]

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"
  

  values = [file("${path.module}/values/argocd.yaml")]
}