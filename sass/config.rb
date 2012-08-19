# Get the directory that this configuration file exists in
dir = File.dirname(__FILE__)

load File.join(dir, 'libs')

# Compass configurations
sass_path    = dir
css_path     = File.join(dir, "..", "stylesheets")
environment  = :production
output_style = :expanded
