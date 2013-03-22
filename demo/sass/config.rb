# Get the directory that this configuration file exists in
dir = File.dirname(__FILE__)

# load File.join(dir, '..', 'themes')

# Compass configurations
sass_path    = dir
css_path     = File.join(dir, "..", "css")
environment  = :production
output_style = :expanded