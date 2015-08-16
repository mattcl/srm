require 'thor'
require 'yaml'

module SRM
  class CLI < Thor
    include Thor::Actions
    include Logging

    def self.source_root
      File.dirname(__FILE__)
    end

    desc 'start', 'start the notifier'
    option :config,
           aliases: '-c',
           type: :string,
           default: File.join(ENV['HOME'], '.weechat_notifier.yml'),
           desc: 'path to the config file'
    option :log_level,
           aliases: '-l',
           type: :string,
           defaut: 'info',
           desc: 'the log level'
    option :xmobar,
           aliases: '-x',
           type: :boolean,
           desc: 'output to an xmobar-readable file'

    def start
      set_log_level(options[:log_level])

      unless File.exist?(options[:config])
        logger.error 'config file does not exist'
        exit 1
      end

      Config.set(YAML.load_file(options[:config]))
      Config.data['xmobar']['enabled'] = options[:xmobar]

      client = Client.new

      logger.info 'connection established'
      if Config.data['xmobar']['enabled']
        logger.info 'will write to xmobar tmp file'
      end
      Notifier.show(body: 'setup complete')
      client.start
    end

    desc 'init', 'generate a config file'
    def init
      template('templates/weechat_notifier.yml.erb',
               File.join(ENV['HOME'], '.weechat_notifier.yml'))
    end
  end
end
