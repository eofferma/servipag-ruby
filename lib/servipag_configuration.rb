require 'yaml'
module ServipagConfiguration
  class Configuration

    def initialize(attrs = {env: nil, filepath: nil, settings: nil})
      @@env         ||= attrs[:env]      || Rails.env
      @@filepath    ||= attrs[:filepath] || Rails.root
      @@settings    ||= attrs[:settings] || self.load(File.join(@@filepath, 'config', 'servipag.yml'))[@@env]
    end

    def load(file)
      YAML.load_file file
    end

    def settings
      @@settings
    end
  end
end