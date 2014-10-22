require "github_revisions/engine"
require 'github_api'

module GithubRevisions
  mattr_accessor :repositories
  mattr_accessor :oauth


  class << self
    def github
      if @@oauth
        return Github.new(:oauth_token => @@oauth)
      else
        return Github.new
      end
    end
  end
end
