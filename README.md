# Knife Sous

A Chef Knife plugin which uses a Rake-esq DSL to configure and manager
[knife-solo](http://matschaffer.github.com/knife-solo/) nodes.

## Usage

Simply ensure the gem is installed using:

    gem install knife_sous

Or add this to your Gemfile if you use bundler:

    gem 'knife_sous'

Run `knife sous init` to place a sample `nodes.rb` under `nodes/nodes.rb`

Run `knife sous list` to display nodes defined in `nodes/nodes.rb`

## Configure

Node configuration is done in `nodes/nodes.rb`. It uses a DSL similar to Rake.
You can namespace your nodes however you want. Example `nodes.rb`:

```rb
namespace :production do
  namespace :web do
    node :nodetastic do
      node_config 'nodes/some_node.json'
      ssh_config <<-TEXT
      HostName: 12.34.56.789
      TEXT
    end
  end
end

namespace :vagrant do
  node_config 'nodes/some_node.json'
  ssh_config `vagrant ssh-config`
end

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
