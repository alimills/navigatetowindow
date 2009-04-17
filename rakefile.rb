require 'sprout'
# Optionally load gems from a server other than rubyforge:
# set_sources 'http://gems.projectsprouts.org'
sprout 'as3'

############################################
# Configure your Project Model
project_model :model do |m|
  m.project_name            = 'NavigateToWindow'
  m.language                = 'as3'
  m.background_color        = '#FFFFFF'
  m.width                   = 970
  m.height                  = 550
  m.source_path            << "#{m.lib_dir}/asunit3"
end

task :html => 'bin/NavigateToWindowRunner.swf' do |t|
  exec 'open bin/index.html'
end

desc 'Compile run the test harness'
unit :test do |t|
  t.input  = "test/NavigateToWindowRunner.as"
end

# set up the default rake task
task :default => :test
