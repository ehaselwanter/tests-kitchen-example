require 'rake'
require 'rspec/core/rake_task'

suites = Dir.glob('*').select{|entry| File.directory?(entry) }

class ServerspecTask < RSpec::Core::RakeTask

  attr_accessor :target

  def spec_command

    if target.nil? 
      puts "specify either env TARGET_HOST or target_host="
      exit 1
    end

    cmd = super
    "env TARGET_HOST=#{target} STANDALONE_SPEC=true #{cmd}  --format documentation --no-profile"
  end

end

namespace :serverspec do
  suites.each do |suite|
    desc "Run serverspec suite #{suite}"
    ServerspecTask.new(suite.to_sym) do |t|
      t.target = ENV['TARGET_HOST'] || ENV['target_host']
      t.ruby_opts = "-I #{suite}/serverspec"
      t.pattern = "#{suite}/serverspec/*_spec.rb"
    end
  end
end

