# 🚀 Terraform AWS Production-Ready Architecture

A fully modular, production-grade infrastructure built on **AWS** using **Terraform**.  
This project follows **AWS Best Practices**, **High Availability**, **Scalability**, and **Security-first** design.

---

## 📌 **Architecture Overview**
This infrastructure simulates a real production environment and includes:

### **🔹 Networking (VPC)**
- Custom VPC (10.0.0.0/16)
- 2× Public Subnets (AZ A & B)
- 2× Private Subnets (AZ A & B)
- Internet Gateway
- NAT Gateway (Highly Available)
- Route Tables (Public & Private)

### **🔹 Public Tier**
- Bastion Host (SSH entry point)
- Nginx Reverse Proxy

### **🔹 Application Tier**
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Launch Template (User-data for Node.js app)

### **🔹 Data Tier**
- MongoDB Cluster (Primary + Secondary nodes)
- Secure private networking

### **🔹 Integrations**
- AWS Lambda function (Node.js)
- Vendor S3 Bucket
- IAM Roles & Policies (least privilege)

### **🔹 Terraform Features**
- Full **modular structure**
- **Variables**, **Outputs**, **locals**, **data sources**
- **Remote backend** (S3 + DynamoDB)
- CI/CD (GitHub Actions) for `terraform fmt -> validate -> plan -> apply`

---

## 📂 **Project Structure**
```
project/
 ├── provider.tf
 ├── variables.tf
 ├── outputs.tf
 ├── backend.tf
 ├── main.tf
 ├── modules/
 │    ├── vpc/
 │    │    ├── main.tf
 │    │    ├── outputs.tf
 │    │    └── variables.tf
 │    ├── public/
 │    │    ├── bastion.tf
 │    │    ├── nginx.tf
 │    │    ├── outputs.tf
 │    │    └── variables.tf
 │    ├── app/
 │    │    ├── alb.tf
 │    │    ├── autoscaling.tf
 │    │    ├── outputs.tf
 │    │    └── variables.tf
 │    ├── database/
 │    │    ├── mongo.tf
 │    │    └── outputs.tf
 │    ├── lambda/
 │    │    ├── function.tf
 │    │    └── outputs.tf
 │    └── s3/
 │         ├── bucket.tf
 │         └── outputs.tf
 └── .github/workflows/
      └── terraform-ci.yml
```

---

## 🔧 **خطوات النشر (How to Deploy)**

### **1️⃣ تهيئة Terraform (Initialize Terraform)**

```bash
terraform init
### **2️⃣ Validate**
```bash\ nterraform validate
```

### **3️⃣ Preview Changes**
```bash\ nterraform plan
```

### **4️⃣ Apply Infrastructure**
```bash\ nterraform apply -auto-approve
```

---

## 🔐 **Remote Backend (S3 + DynamoDB)**
```hcl
backend "s3" {
  bucket         = "terraform-state-prod"
  key            = "prod/terraform.tfstate"
  region         = "eu-west-1"
  dynamodb_table = "terraform-locks"
  encrypt        = true
}
```

---

## 📤 **GitHub Actions CI/CD**
```yaml
name: Terraform CI

on:
  push:
    branches: [ "main" ]

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v2

    - name: Terraform Format
      run: terraform fmt -check

    - name: Terraform Init
      run: terraform init

    - name: Terraform Validate
      run: terraform validate

    - name: Terraform Plan
      run: terraform plan
```

---

## 🧠 **Key Highlights / What You Learn**
- Full production VPC design
- Infrastructure as Code at scale
- Modular Terraform architectures
- AWS High Availability principles
- Real DevOps CI/CD workflow
- Secure IAM & Networking
- Multi-AZ deployments
- Auto Scaling & dynamic load balancing

---

## 📎 **Diagram**
*Insert your architecture diagram here.*

---

## 🏁 **Conclusion**
This project represents a **real production-grade system** and is perfect for:
- CV / Resume
- DevOps interviews
- Portfolio showcase
- Learning AWS & IaC deeply
- Demonstrating real deployment experience


