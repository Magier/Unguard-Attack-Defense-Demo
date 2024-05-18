apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: unguard-mariadb
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
  annotations:
    argocd.argoproj.io/sync-wave: "1"
spec:
  project: default
  destination:
    server: https://kubernetes.default.svc
    namespace: unguard
  source:
    chart: mariadb
    repoURL: https://charts.bitnami.com/bitnami
    targetRevision: 18.0.6
    helm:
      releaseName: unguard-mariadb
      parameters:
        - name: "primary.persistence.enabled"
          value: "false"
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
    automated:
      selfHeal: true
      prune: true