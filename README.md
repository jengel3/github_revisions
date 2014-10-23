# Github Revisions

Provides revision information for various projects from the Github API.

## Installation

* gem install 'github_revisions'
* rails generate github_revisions:install

## Usage

* Add your repositories to the repositories array in config/initializers/revisions_config.rb.
* Repositories should include the following information: Github User/Organization, Repository Name, and a friendly name that will be used to display the repository.


Example repository:

```
{:name => "github_revisions", :friendly => "Github Revisions", :user => "Jake0oo0"}
```


## Customization

Copy the views so that you can customize them to your liking.

* rails generate github_revisions:views


## Credits

Full credit to [Jake0oo0](https://github.com/Jake0oo0) for the creation of this gem.