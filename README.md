# Welcome

This codebase is a sample solution from the book [Mastering Terraform](https://amzn.to/3XNjHhx). This codebase is the solution from Chapter 15 where Soze Enterprises is deploying their solution with Serverless using Google Cloud Functions. It includes infrastructure as code (IaC) using Terraform.

## Terraform Code

The Terraform code is stored in `src\terraform`. There is only one root module and it resides within this directory. There is only the default input variables value file `terraform.tfvars` that is loaded by default.

You may need to change the `primary_region` input variable value if you wish to deploy to a different region. The default is `us-central1`.

If you want to provision more than one environment you may need to remove the `environment_name` input variable value and specify an additional environment `tfvar` file.

## GitHub Actions Workflows

### Terraform Workflows
The directory `.github/workflows/` contains GitHub Actions workflows that implement a CI/CD solution using Packer and Terraform. There are individual workflows for the three Terraform core workflow operations `plan`, `apply`, and `destroy`.