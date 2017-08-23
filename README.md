# rex

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with rex](#setup)
    * [What rex affects](#what-rex-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rex](#beginning-with-rex)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The purpose of this module is to configure existing Satellite/Foreman systems for remote execution (REX).

## Setup

Import module and publish/promote to appropriate CV/LCE.  Configure overrides overrides for the rex::params class.  The following two are required, any additional can be tweeked to the desired value.

```
rex_user = <%= @host.params['remote_execution_ssh_user'] %>
rex_keys = 
---
ssh_authorized_key:
  <% for _key in @host.params['remote_execution_ssh_keys'] do -%>
  <% key = _key.split(' ') -%>
  <%= key[2] %>:
    user: <%= @host.params['remote_execution_ssh_user'] %>
    type: <%= key[0] %>
    key: <%= key[1] %>
  <% end -%>
```

Following this, simply enable the rex and rex::params classes on the host[s] or host group[s] of your choosing.

**Note:** If you plan to use a user other than root, you must configure the `remote_execution_ssh_user` found in the Remote Execution portion of the Settings menu.

### What rex affects

This module will creat the REX user, if it is not already present and will manage this users password.  It will deploy sudo rules to /etc/sudoers.d/rex.  Finally, it will deploy the required ssh keys.

**Files affected:**
* user's home dir
* /etc/passwd
* /etc/shadow
* /etc/sudoers.d/rex
* $home_dir/.ssh/authorized_keys

**Warnings:**
* this module will not work correctly if using ldap (or other external) user
* this module will house the users encrypted password in the UI
* this module could cause unexpected security risks, if not properly configured

### Setup Requirements

The `hash_resources` module must be installed for this module to function correctly.  Additionally, if the desired ssh user for REX is not root, this must be configured prior to enableing this module.

### Beginning with rex

* import the module
* configure override for rex_keys
* enable module

## Usage

Additional user configurable parameters are available via the params class.  These paramaters can be used to manage the REX user's password, set password policies, and the user comments field.

## Reference


## Limitations

This module will not work with external users for REX ssh user.

## Development

Contributions welcome!

## Release Notes/Contributors/Etc.

**Author:** Roy Williams (chopskxw)

**Releases:**
0.1.0 - initial dev release
0.1.1 - syntax fixes, etc.
0.1.2 - syntax fixes
0.2.0 - Removed !requiretty from sudo rule, created manifest to check working dir mount options, and change resources parameter to rex_keys
