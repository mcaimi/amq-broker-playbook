# AMQ Deployment Playbook

This is a simple playbook I wrote to deploy an Artemis MQ cluster on RedHat Enterprise Linux virtual machines for development purposes.
Multiple environments can be deployed by using variable files.

Requirements:

* Valid RedHat subscription credentials for both
  * RedHat AMQ
  * RedHat Enterprise Linux
* VMWare or KVM-based virtualization environment

The playbook installs:

* An instance of AMQ Broker
* Creates AMQ Users
* Manages the creation of Queues and Topics
* Manages Queue ACLs

Clustered installations are still WIP and they need at least a shared filesystem setup, which the playbook does not cover.

**This playbook is intended to install and manage only RedHat supported software coming from RedHat repositories. It should be fairly trivial however to adapt the playbook to install the upstream Artemis MQ distribution on CentOS**

## AMQ Version and Download link

Tarball link and software versions can be changed/updated inside `vars/common`:

```yaml
common:
  amq_artifact_download_url: https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=103634
  remote_src: "yes"
  amq_version: "7.9.1"
```

## Setup Customer Portal Credentials

Username/password pairs used to access the Customer Portal can be set up inside the `vars/credentials/customerportal` file:

```yaml
customerportal:
  username: your_csp_username
  password: your_csp_password
```

## Create an installation Environment

An example environment is provided under `vars/environments/`. Either customize that or make a new one.

## Broker installation

Include the desired environment in the playbook (or create a dedicated playbook for the environment):

```yaml
  pre_tasks:
    - include_vars:
        file: "common"
    - include_vars:
        file: "environments/dev"
    - include_vars:
        file: "credentials/customerportal"
```

Run the playbook:

```bash
$ ansible-playbook -i hosts amq-dev.yaml
```

# TODO

- [ ] Better detail installation steps
- [ ] Document playbook switches
- [ ] Document queue block format
