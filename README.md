# bp-interview

## Setup

1. Ensure you have docker + docker-compose installed (https://docs.docker.com/compose/gettingstarted/).
   - Note: Make sure docker is install in rootless mode. This should be the default for most OSes except linux. If that isn't an option due to limitations, follow this guide to run docker commands as a non-root user https://docs.docker.com/engine/install/linux-postinstall/.
2. Ensure you have the correct ruby version installed, this project is set up with ASDF (https://asdf-vm.com/guide/getting-started.html) or use your preferred version manager.
   - Run `asdf install` to install the correct version of ruby.
4. `gem install dip`.
5. `dip provision` (note: this will also clear out the database).
6. `dip server` to run the application on http://localhost:3000/.

### Versions
- Ruby 3.4.2

### Tests
`dip rspec`

---
