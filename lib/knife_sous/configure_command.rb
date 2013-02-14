module KnifeSous
  module ConfigureCommand

    def configure_command(command, node)
      node_config = {
        ssh_config: node.ssh_config,
        node_config: node.node_config,
        chef_node_name: node.name
      }
      command.config.merge!(node_config)
      command
    end
  end
end

