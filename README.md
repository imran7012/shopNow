
 ShopNow – MERN Application Deployment using Kubernetes, Helm & Jenkins

## 📌 Overview

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

```text
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


