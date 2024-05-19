apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: falco
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
    # targetRevision: 12.2.4
  annotations:
    argocd.argoproj.io/sync-wave: "2"
spec:
  project: default
  destination:
    server: https://kubernetes.default.svc
    namespace: falco
  sources:
    - chart: falco
      repoURL: https://falcosecurity.github.io/charts
      targetRevision: 4.3.0
      helm:
        releaseName: falco
        # valueFiles:
        #   - $values/unguard/values.yaml
    - repoURL: https://github.com/Magier/Unguard-Attack-Defense-Demo.git
      targetRevision: HEAD
      ref: values
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
    automated:
      selfHeal: true
      prune: true