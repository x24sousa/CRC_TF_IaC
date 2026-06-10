# Cloud Resume Challenge (AWS)

This is my Terraform repo for my Cloud Resume Challenge.

## Live Site
Website: https://www.x24sousa.com

## Technologies Used
- Amazon S3
- Amazon CloudFront
- Amazon Route 53
- AWS Certificate Manager (ACM)
- AWS Lambda
- Amazon API Gateway
- Amazon DynamoDB
- AWS CodeBuild
- GitHub
- HTML
- CSS
- JavaScript

## Features
- Static resume website hosted in Amazon S3
- HTTPS enabled through CloudFront and ACM
- Custom domain managed through Route 53
- Visitor counter powered by Lambda, API Gateway, and DynamoDB
- Automated deployments using GitHub and AWS CodeBuild
- Automatic CloudFront cache invalidation during deployments

## Architecture

### Website Hosting

- GitHub → CodeBuild → S3 → CloudFront → Route53

### Visitor Counter:

- Browser → API Gateway → Lambda → DynamoDB

## Lessons Learned
- DNS propagation and Route 53 record management
- CloudFront caching and invalidation behavior
- IAM permissions and service roles
- API Gateway and Lambda integration
- CI/CD automation using AWS services

## In Progress
- Infrastructure as Code (Terraform)
- Automated testing
- Additional monitoring and logging
- Backend infrastructure managed entirely through code