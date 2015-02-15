lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'flexible_datatables/version'

Gem::Specification.new do |s|
  s.name        = 'flexible_datatables'
  s.version     = FlexibleDatatables::VERSION
  s.licenses    = ['GPL-3.0+']
  s.summary     = 'Easily integrate JQuery Datatables (with Ajax) into your Ruby / Rails web applications.'
  s.description = 'Flexible Datatables wraps array-like objects (ActiveRecord::Relation collections, etc) that JQuery Datatables can read (via ajax) from your Ruby / Rails web application.'
  s.authors     = ["Dave Corning"]
  s.email       = 'dave@davecorning.com'
  s.files       = Dir['lib/**/*.rb'] + ['CHANGELOG', 'CHANGELOG.md', 'README.rdoc']
  s.homepage    = 'https://github.com/davecorning/flexible_datatables'
end
