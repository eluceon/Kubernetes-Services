# Kubernetes-Based Microservices Infrastructure

## Table of Contents
1. [Overview](#overview)
2. [Project Description](#project-description)
3. [Key Features](#key-features)
4. [Getting Started](#getting-started)
5. [Building Custom Docker Images](#building-custom-docker-images)
6. [Deployment with Kubernetes](#deployment-with-kubernetes)
7. [Accessing Services](#accessing-services)
8. [Monitoring and Data Persistence](#monitoring-and-data-persistence)
9. [Troubleshooting](#troubleshooting)
10. [Maintenance and Cleanup](#maintenance-and-cleanup)
11. [Author](#author)
12. [License](#license)

## Overview
Welcome to a commercial-grade Kubernetes-based microservices infrastructure. This project serves as a robust foundation for hosting and managing various services in a production environment. Leveraging Kubernetes, Docker, and best practices in cloud-native application development, a scalable and reliable infrastructure has been created.

## Project Description
The infrastructure includes the following key services:

### Load Balancer
- The Load Balancer is the entry point to the entire cluster, efficiently managing external access to services.
- Ports for each service (e.g., IP:3000 for Grafana) are intelligently redirected.

### WordPress and MySQL
- WordPress and MySQL are isolated in dedicated containers.
- WordPress leverages its own nginx server for optimal performance.
- The Load Balancer routes traffic seamlessly to the WordPress service.

### phpMyAdmin
- phpMyAdmin is securely hosted in its container and utilizes a dedicated nginx server.
- The Load Balancer ensures correct redirection to the phpMyAdmin interface.

### nginx Server
- The nginx server efficiently handles HTTP (port 80) and HTTPS (port 443) traffic.
- Port 80 performs automatic redirection to HTTPS.
- The nginx server provides access to `/wordpress` and `/phpmyadmin`.

### FTPS Server
- A robust FTPS server is operational, listening on port 21, ensuring secure file transfers.

### Grafana and InfluxDB
- Grafana provides comprehensive monitoring for all containers within the cluster.
- Custom dashboards are created for each service.
- InfluxDB and Grafana run in separate containers, guaranteeing data persistence.

### Data Persistence
- In the event of container or pod failures, data is safeguarded and persists.
- All containers restart automatically to maintain service availability.

### Kubernetes Configurations
- LoadBalancer is deployed for FTPS, Grafana, WordPress, phpMyAdmin, and nginx services.
- InfluxDB and MySQL services utilize ClusterIP.
- No "NodePort" services are employed to enhance security.

## Key Features
- Scalable and resilient microservices architecture.
- Robust load balancing for high availability.
- Isolation of services in containers for resource efficiency.
- Automated monitoring and dashboards with Grafana.
- Data persistence guarantees data integrity.
- Kubernetes-native configurations for service management.
- Enhanced security practices, avoiding NodePort services.

## Getting Started
To deploy this infrastructure in your environment, follow these steps:

1. Clone this repository.
2. Organize your configuration files in the `srcs` folder.
3. Execute the `setup.sh` script at the root of the repository to automate application setup.

## Building Custom Docker Images
1. Craft Dockerfiles for each service, following industry best practices.
2. Build custom Docker images using the provided Dockerfiles.
3. Host your custom images in a container registry.

## Deployment with Kubernetes
1. Deploy services to your Kubernetes cluster by applying the provided Kubernetes YAML files.
2. Ensure correct ordering to handle service dependencies.

## Accessing Services
1. Access the Kubernetes dashboard for comprehensive cluster management.
2. Utilize the Load Balancer as the secure entry point to your services.
3. Access individual services using their assigned ports and URLs.

## Monitoring and Data Persistence
1. Access Grafana dashboards for real-time monitoring of service health.
2. InfluxDB and Grafana are designed to ensure data availability even during service disruptions.

## Troubleshooting
Refer to the troubleshooting section in this README for assistance with common issues.

## Maintenance and Cleanup
Properly manage resources and maintain a clean environment:
- Use cleanup scripts or provided instructions to gracefully remove resources.
- Prevent unexpected charges by ensuring all resources are deleted.
