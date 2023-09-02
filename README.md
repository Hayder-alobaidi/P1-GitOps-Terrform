![project diagram](https://github.com/Hayder-alobaidi/P1-kubernetes_manifest/assets/93683931/06bb8d4c-1a19-45d1-882d-3ae6434aa81d)





## 🗒️ Summary:

This project is all about applying GitOps principles in a cloud-native setting. We've built our AWS environment using Terraform for a solid infrastructure foundation. AWS EKS is the engine powering our Kubernetes services, designed for high availability and fault tolerance.

ArgoCD takes charge of keeping our deployments up-to-date by automatically syncing our deployment plans with an existing manifest file in our GitHub repository.

Additionally, Jenkins pipelines play a pivotal role in this project. They handle two crucial tasks: running tests and building and deploying new software images to Dockerhub whenever developers update our GitHub repository. Jenkins also ensures our Kubernetes manifest files are updated with the latest image tags.

In essence, this project automates the deployment of new applications, making our cloud-native environment efficient and reliable."


## 🚀 This project is composed of three separate phases:

**📚 [Creating AWS EKS Cluster using Terraform](https://www.showwcase.com/show/36426/creating-aws-eks-cluster-using-terraform):** I've documented this stage in detail in my blog post, offering a step-by-step guide on how to create an AWS EKS cluster using Terraform.

**📚 [Setting Up ArgoCD with AWS EKS for GitOps Implementation](https://www.showwcase.com/show/36436/setting-up-argocd-with-aws-eks-for-gitops-implementation):** The next step involves configuring ArgoCD within AWS EKS for GitOps. I've provided an in-depth blog post that explains this process in a step-by-step manner.

**📚 [Setting Up Jenkins CI/CD As Part of GitOps Implementation](https://www.showwcase.com/show/36460/setting-up-jenkins-cicd-as-part-of-gitops-implementation):** Finally, I've created a blog post that covers the implementation of Jenkins CI/CD as an integral part of the GitOps framework. This blog post provides a clear, step-by-step guide for setting up Jenkins.

## Technologies and Tools Used in This Project:

    AWS EKS
    Terraform
    Kubernetes
    ArgoCD
    Dockerhub
    Python
    Jenkins
    GitHub
    Linux

Thank you for checking out this project. Please take a look at my other repositories to see more projects I have worked on.
