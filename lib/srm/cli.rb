require 'thor'
require 'yaml'

module SRM
  class CLI < Thor
    include Thor::Actions
    include Logging

    def self.source_root
      File.dirname(__FILE__)
    end

    desc 'update', 'pull all repos'
    def update
    end

    desc 'init', 'generate a config file'
    def init
      template('templates/srm.yml.erb',
               File.join(ENV['HOME'], '.srm.yml'))
    end
  end
end
