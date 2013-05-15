# Load the rails application
require File.expand_path('../application', __FILE__)

# Make sure there's no plugin in vendor/plugin before starting
vendor_plugins_dir = File.join(Rails.root, "vendor", "plugins")
if Dir.glob(File.join(vendor_plugins_dir, "*")).any?
  $stderr.puts "Plugins in vendor/plugins (#{vendor_plugins_dir}) are no longer allowed. " +
    "Please, put your Redmine plugins in the `plugins` directory at the root of your " +
    "Redmine directory (#{File.join(Rails.root, "plugins")})"
  exit 1
end

# http://www.redmine.org/issues/11058
# http://www.redmine.org/issues/11881#note-14
RedmineApp::Application.routes.default_scope = { :path => '/redmine', :shallow_path => '/redmine' }

# Initialize the rails application
RedmineApp::Application.initialize!

# http://www.redmine.org/projects/redmine/wiki/HowTo_Install_Redmine_in_a_sub-URI
Redmine::Utils::relative_url_root = "/redmine"
