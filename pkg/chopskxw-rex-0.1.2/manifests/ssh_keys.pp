#This  assumes that the satellite/foreman settings are configured for the correct
#remote execution user.
#
# The following must be configured as an override for the resources parameter
#---
#  ssh_authorized_key:
#    <% for _key in @host.params['remote_execution_ssh_keys'] do -%>
#    <% key = _key.split(' ') -%>
#    <%= key[2] %>:
#    user: <%= @host.params['remote_execution_ssh_user'] %>
#    type: <%= key[0] %>
#    key: <%= key[1] %>
#    <% end -%>

class rex::ssh_keys(
  $resources = $rex::params::resources,
) {

  hash_resources($resources)

}
