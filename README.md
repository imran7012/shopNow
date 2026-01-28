
 ShopNow – MERN Application Deployment using Kubernetes, Helm & Jenkins

## Overview

This project demonstrates the end-to-end deployment of a **MERN stack application (MongoDB, Express.js, React.js, Node.js)** using modern DevOps practices.  
The application is deployed on **Kubernetes (AWS EKS)**, packaged using **Helm**, and automated via a **Jenkins CI/CD pipeline**.

The goal of this assignment is to showcase:
- Kubernetes deployment knowledge
- Helm chart design and templating
- CI/CD automation using Jenkins
- Real-world troubleshooting and problem-solving skills


---

## Application Architecture

The ShopNow application is composed of the following components:

- **Frontend (FE)** – React application served via Nginx  
- **Admin UI** – React-based admin dashboard  
- **Backend (BE)** – Node.js + Express REST API  
- **Database** – MongoDB (external MongoDB Atlas)  

All components are containerized using Docker and deployed into Kubernetes.

---


## 📁 Repository Structure

      shopNow/
      ├── frontend/                 # React frontend application
      │   └── Dockerfile
      │
      ├── admin/                    # React admin panel
      │   └── Dockerfile
      │
      ├── backend/                  # Node.js / Express backend
      │   └── Dockerfile
      │
      ├── shopnow/                  # Helm chart
      │   ├── Chart.yaml
      │   ├── values.yaml
      │   └── templates/
      │       ├── namespace.yaml
      │       ├── secret.yaml
      │       ├── backend-deployment.yaml
      │       ├── backend-service.yaml
      │       ├── frontend-deployment.yaml
      │       ├── frontend-service.yaml
      │       ├── admin-deployment.yaml
      │       ├── admin-service.yaml
      │       └── ingress.yaml
      │
      ├── Jenkinsfile               # Jenkins CI/CD pipeline
      └── README.md

---

## Kubernetes Deployment:
  
  ## Kubernetes Manifests

     For each component, the following Kubernetes resources were created:
     
   ## Deployment
     
     1.Defines replicas for scalability
     
     2.Uses rolling update strategy
     
   ## Service
     
     1.ClusterIP services for internal communication
     
   ## Ingress
     
     1.AWS ALB Ingress Controller
     
   ## Path-based routing:
     
     / → frontend
     
     /admin → admin UI
     
     /api → backend

 ## Secrets Management

 Sensitive data such as:
  
  1.MongoDB connection string
  
  2.JWT secret
  
  are stored using Kubernetes Secrets, not hardcoded into images or manifests

## Helm Chart Design:

   To simplify and standardize deployments, all Kubernetes manifests were converted into a Helm chart.
  
  ## Key Features of the Helm Chart:
  
  1.Centralized configuration using values.yaml
  
  2.Parameterized:
  
    1.Docker image names
    
    2.Image tags
    
    3.Replica counts
    
    4.Ingress configuration
  
  Environment-agnostic deployment (dev / test / prod ready)
  
  ## Example Helm Deployment
  
  helm upgrade --install shopnow ./shopnow -n shopnow

  ## installation of aws loadbalancer for ingress service:
     
     helm repo add eks https://aws.github.io/eks-charts
     helm repo update

     helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
     -n kube-system \
     --set clusterName=e-commerce \
     --set serviceAccount.create=false \
     --set serviceAccount.name=aws-load-balancer-controller \
     --set region=ap-south-1 \
     --set v=2

     kubectl get pods -n kube-system | grep load-balancer
  
 <img width="940" height="286" alt="image" src="https://github.com/user-attachments/assets/f462c96d-12ab-4f7e-a5a3-58c02f065248" />

---
## Jenkins Server Setup

   The Jenkins server was configured with the following tools:
   
   Git
   
   Docker
   
   AWS CLI
   
   kubectl
   
   Helm

## Authentication to AWS EKS is handled using:

  IAM Role attached to Jenkins EC2
  
  Role mapped to Kubernetes via aws-auth ConfigMap




---

## Jenkins CI/CD Pipeline

   A declarative Jenkins pipeline was implemented to automate the entire build and deployment workflow.

## Pipeline Stages

   ## Checkout
   
     Pulls code from GitHub (test branch)
   
   ## Build Docker Images
   
     Builds frontend, backend, and admin images
   
   ## Push to DockerHub
   
     Versioned images pushed using Jenkins credentials
   
   ## Deploy to Kubernetes
   
      Uses Helm to upgrade or install the application on EKS
   
   ## Jenkinsfile Highlights
   
      1.Uses DockerHub credentials securely
      
      2.Uses IAM Role-based authentication for AWS (no hardcoded AWS keys)
      
      3.Automatically updates image tags during deployment

<img width="1896" height="955" alt="image" src="https://github.com/user-attachments/assets/486e904b-d9d6-45cf-9861-e884bbaeafc1" />






