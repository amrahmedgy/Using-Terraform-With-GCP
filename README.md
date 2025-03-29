# **Using Terraform with GCP: Deploying a Compute Instance**

## 📌 **Introduction**  

This project demonstrates how to use **Terraform** to provision and manage infrastructure on **Google Cloud Platform (GCP)**. Specifically, we will create a **Compute Engine (Virtual Machine) instance** using Terraform.

---

## **🌍 What is Terraform?**  

Terraform is an **Infrastructure as Code (IaC)** tool that allows users to define and manage infrastructure using a declarative configuration language. It enables automation and reproducibility, making it easier to deploy cloud resources.  

### **🔥 Key Features of Terraform:**  
✅ Infrastructure as Code (IaC)  
✅ Supports multiple cloud providers  
✅ Version control for infrastructure  
✅ Automates provisioning and scaling  

---

## **☁️ What is GCP (Google Cloud Platform)?**  

**Google Cloud Platform (GCP)** is a cloud computing service that provides infrastructure, platform, and software services. It allows users to build, deploy, and scale applications on Google’s infrastructure.  

### **🌟 Services Used in This Project:**  
✅ **Compute Engine** – To create virtual machines (VMs).  
✅ **IAM & Authentication** – To securely authenticate Terraform with GCP.  

---

## **🚀 Prerequisites**  

Before starting, ensure you have the following:  

✅ **GCP Account** with a project set up  
✅ **Google Cloud SDK** installed (`gcloud version`)  
✅ **Terraform** installed (`terraform -version`)  

---

## **🔧 Step-by-Step Guide to Deploying a VM using Terraform on GCP**  

### **Step 1: Authenticate & Set Up GCP**  
1️⃣ Enable the **Compute Engine API**:  
   ```bash
   gcloud services enable compute.googleapis.com
   ```  
2️⃣ Authenticate Terraform with GCP:  
   ```bash
   gcloud auth application-default login
   ```

---

### **Step 2: Write the Terraform Configuration**  

Create a file named `main.tf` and add the following Terraform code:

```hcl
provider "google" {
  project     = "your-gcp-project-id"
  region      = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
```

Replace `"your-gcp-project-id"` with your actual **GCP project ID**.

---

### **Step 3: Initialize Terraform**  
Run this command to download required providers:  
```bash
terraform init
```

---

### **Step 4: Plan the Deployment**  
Generate an execution plan:  
```bash
terraform plan
```

---

### **Step 5: Apply the Configuration**  
Create the Compute Instance:  
```bash
terraform apply -auto-approve
```

---

### **Step 6: Verify the VM is Running**  
1️⃣ List instances in your GCP project:  
   ```bash
   gcloud compute instances list
   ```  
2️⃣ Connect to the VM using SSH:  
   ```bash
   gcloud compute ssh terraform-instance --zone=us-central1-a
   ```

---

### **Step 7: Destroy the Resources (Optional)**  
To delete the VM and clean up resources, run:  
```bash
terraform destroy -auto-approve
```

---

## **📂 Project Structure**
```
Using-Terraform-With-GCP/
│— main.tf              # Terraform configuration file
│— variables.tf         # Variables for Terraform (optional)
│— outputs.tf           # Outputs for Terraform (optional)
│— README.md            # Project documentation
│— .gitignore           # Ignore unnecessary files
└— terraform.tfvars     # Store sensitive values (ignored)
```

---

## **📝 Best Practices**  
✅ Use **terraform.tfvars** for storing sensitive variables  
✅ Implement **remote state** storage using Google Cloud Storage (GCS)  
✅ Follow the **principle of least privilege** for IAM permissions  

---

## **🛠️ Troubleshooting & FAQs**  

### ❓ *1. Terraform apply fails with authentication error*  
🔹 Ensure you're authenticated with `gcloud auth application-default login`.  

### ❓ *2. "Quota Exceeded" error on GCP*  
🔹 Check your GCP **billing and quota limits**.  

### ❓ *3. Changes are not reflecting after modifying `main.tf`*  
🔹 Run `terraform apply` again to apply new changes.  

---

## **📢 Contributing**  
Feel free to **fork** this repository and submit **pull requests**! 🎉  

---

## **📝 License**  
This project is licensed under the **MIT License**.  

