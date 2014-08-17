# rbenv-passenger

Installs/Configures the passenger module for apache using rbenv gem.

## Assumptions

- You have the ruby build cookbook in the run list.
- You use the rbenv cookbook to install/configure ruby.
- You have a global ruby defined (each node runs a single ruby version).
- You use the apache2 cookbook in the run list to install/configure apache.

## Rationale

- There weren't any community cookbooks that just installed passenger for a configured rbenv environment.
- The community cookbooks do not have any tests.
- The tests should include support for a docker environment.

## Usage

- Ensure the ruby build, rbenv and apache2 cookbooks are in your run list.
- Ensure you have a global ruby defined.
- Include the default recipe in your wrapper/run list.

## Testing

- Clone from github.
- Run bundle install.
- Unit tests: `bundle exec rspec spec`.
- Integration tests: `kitchen test` (ensure you have the DOCKER_HOST variable set).
