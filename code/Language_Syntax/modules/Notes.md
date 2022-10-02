## **Terraform Modules**
========================
- enables code reuse
- supports versioning to maintain compatibility
- stores code remotely
- enables easier testing.
- enables encapsulation with all the separate resources under one configuration block
- modules can be nested inside other modules, allowing you ti quickly spin up whole separate environments.


- supports local and remote modules
    - local modules are stored alongside the Terraform configuration (in a separate directory, outside of each environment but in the same repository) with source path ./ or ../
    - remote modules are stored externally in a separate repository, and supports versioning

**Supported backends**:
======================
  - local paths
  - terraform registry
  - github
  - gitbucket
  - generic git, mercurial repositories
  - http urls
  - s3 buckets
  - gcs buckets

**Module requirements**:
========================
 - must be on github and must be a public repo, if uding public registry.
 - must be named terraform-<PROVIDER>-<NAME>, <NAME> reflects the type of infrastructure the module manages and <PROVIDER> is the main provider where it creates that infrastructure. for example terraform-google-vault or terraform-aws-ec2-instance.
 - must maintain x.y.z tags for releases to identify module versions. Release tag names must be a semantic version, which can optionally be prefixed with a v for example, v1.0.4 and 0.9.2. Tags that don't look like version numbers are ignored.
 - must maintain a standard module structure, which allows the registry to inspect the moduke and generate documentation, track resource usage, parse submodules and examples, and more.