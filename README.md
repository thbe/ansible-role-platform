# Ansible Role thbe-platform

[![Ansible Lint](https://github.com/thbe/ansible-role-platform/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/thbe/ansible-role-platform/actions/workflows/ansible-lint.yml)[![Molecule](https://github.com/thbe/ansible-role-platform/actions/workflows/molecule.yml/badge.svg)](https://github.com/thbe/ansible-role-platform/actions/workflows/molecule.yml)

This role configures and deploys hardware/ platform settings on an RHEL instance or RHEL clone.

## Requirements

To unlock the full potential of this role it might be necessary to be subscribed to your hardware/ platform vendor support.

## Role Variables

* **role_directory** - This variable contains the root path of the directories used by thbe roles (**do not change!**)
* **anf_storage** - Prepare node to interact with Azure NetApp (default: false)

## Dependencies

This role depends on:

* thbe.common

## Example Playbook

This role can be included in the site.yml like this:

```yaml
# Site playbook
- name: Ansible playbooks for all nodes
  hosts: all
  collections:
    - ansible.posix
    - community.general
  gather_facts: true
  tasks:
    - name: "Include thbe.common"
      ansible.builtin.include_role:
        name: "thbe.common"
    - name: "Include thbe.platform"
      ansible.builtin.include_role:
        name: "thbe.platform"
```

## License

GPL-3.0-only

## Author Information

Thomas Bendler - [https://www.thbe.org/](https://www.thbe.org/)
