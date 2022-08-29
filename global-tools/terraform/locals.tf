locals {
  aws_tags = {
    OperationsRepo = "angular-ngrx-chat-operations"
    OperationsRepoEnvironment = var.ops_repo_environment
    created_with = "terraform"
  }
}