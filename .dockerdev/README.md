## Setup

1. Install docker + docker-compose (https://docs.docker.com/compose/gettingstarted/).
   - Note: Make sure docker is install in rootless mode. This should be the default for most OSes except linux. If that isn't an option due to limitations, follow this guide to run docker commands as a non-root user https://docs.docker.com/engine/install/linux-postinstall/.
2. Install ASDF (https://asdf-vm.com/guide/getting-started.html)
3. Run `asdf install` which will install ruby
4. `gem install dip`
5. `dip provision` (note: this will also clear out the database)
6. `dip server`
