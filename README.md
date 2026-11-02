# OpenNebula Private Cloud with Terraform

A hands-on private cloud project built using OpenNebula 7.2, KVM, OneFlow, OneGate and Terraform.

## Architecture

- Ubuntu Server 24.04 running OpenNebula 7.2
- KVM hypervisor
- FireEdge / Sunstone web interface
- OneFlow application orchestration
- OneGate VM-to-OpenNebula communication
- Terraform infrastructure management

## Infrastructure

| Component | Configuration |
|-----------|---------------|
| Cluster | default (ID 0) |
| KVM Host | ubuntu (ID 0) |
| System Datastore | ID 0 |
| Image Datastore | ID 1 |
| Files Datastore | ID 2 |
| Virtual Network | ExamPrivateNet |
| Private Subnet | 10.10.10.0/24 |
| AppDevs Group | ID 100 |
| AppDevs VDC | ID 100 |
| Ubuntu Image | Ubuntu Minimal 24.04 |

## Resource Quotas

AppDevs is restricted to:

- Maximum 4 VMs
- Maximum 4 allocated CPUs
- Maximum 8192 MB allocated RAM
- Maximum 30720 MB VM system disk storage
- Maximum 30720 MB image storage on datastore ID 1

VM and datastore quotas are managed through separate Terraform resources.

## OneFlow Application

Service template: Web-DB-Stack

### Load Balancer

- HAProxy
- 1 VM
- Dynamically discovers Web backends using OneGate

### Web Servers

- Nginx
- Minimum 1 VM
- Maximum 2 VMs
- Automatic scale-out when CPU > 50% for 2 consecutive 10-second periods

OneFlow uses straight deployment with a readiness gate.

## Terraform

Provider: OpenNebula/opennebula v1.5.0

Managed resources include:

- Cluster and KVM host
- Three datastores
- Ubuntu image
- Virtual network
- VM templates
- AppDevs group and quotas
- Virtual Data Center
- OneFlow service template

### Authentication

Terraform uses environment variables for OpenNebula API authentication.

Never commit API passwords, credentials or Terraform state files.

### Validation

Run:

    terraform init
    terraform fmt -check
    terraform validate
    terraform plan

### Important Limitations

- Existing OpenNebula resources were imported into Terraform state.
- Some imported resource attributes use lifecycle ignore_changes to avoid unsafe replacement.
- A clean plan does not validate ignored attributes.
- Host CPU/RAM reservations are configured directly in OpenNebula.
- Ubuntu networking, NAT, KVM installation and system services require separate configuration.
- Existing VM contextualization and startup scripts are not completely modeled in Terraform.
- This repository is not yet a fully automated fresh-environment deployment.
- Review every Terraform plan before applying changes.

## Security

- Terraform state is excluded from Git.
- Sensitive credentials are supplied through environment variables.
- Critical imported resources use prevent_destroy.
- Existing running VMs are not managed or recreated by this Terraform project.

## Project Status

- OpenNebula infrastructure operational
- OneFlow deployment tested
- HAProxy backend discovery tested
- CPU-triggered scaling tested
- Group quota enforcement tested
- Existing infrastructure imported into Terraform
- Terraform plan reports no changes
