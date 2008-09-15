# This file is generated! Don't modify it by hand!
# Instead, edit the .gemspec.source file, and run:
#   rake gemspec
# Or just run
#   rake gem
# to build the gemspec and the gem together.


RUBY_FILES = ["generators/acts_as_taggable_on_migration/acts_as_taggable_on_migration_generator.rb", "generators/acts_as_taggable_on_migration/templates/migration.rb", "init.rb", "lib/acts-as-taggable-on.rb", "lib/acts_as_taggable_on/acts_as_taggable_on.rb", "lib/acts_as_taggable_on/acts_as_tagger.rb", "lib/acts_as_taggable_on/tag.rb", "lib/acts_as_taggable_on/tag_list.rb", "lib/acts_as_taggable_on/tagging.rb", "lib/acts_as_taggable_on/tags_helper.rb", "lib/autotest/discover.rb", "rails/init.rb", "spec/acts_as_taggable_on/acts_as_taggable_on_spec.rb", "spec/acts_as_taggable_on/acts_as_tagger_spec.rb", "spec/acts_as_taggable_on/tag_list_spec.rb", "spec/acts_as_taggable_on/tag_spec.rb", "spec/acts_as_taggable_on/taggable_spec.rb", "spec/acts_as_taggable_on/tagger_spec.rb", "spec/acts_as_taggable_on/tagging_spec.rb", "spec/schema.rb", "spec/spec_helper.rb", "uninstall.rb"]
Gem::Specification.new do |s|
  s.name = "acts-as-taggable-on"
  s.version = "1.0.2"
  s.date = "2008-06-10"
  s.summary = "Tagging for ActiveRecord with custom contexts and advanced features."
  s.email = "michael@intridea.com"
  s.homepage = "http://www.actsascommunity.com/projects/acts-as-taggable-on"
  s.description = "Acts As Taggable On provides the ability to have multiple tag contexts on a single model in ActiveRecord. It also has support for tag clouds, related items, taggers, and more."
  s.has_rdoc = false
  s.authors = ["Michael Bleigh", 'Mathieu Fosse', 'David Masover']
  s.files = [ "CHANGELOG",
              "MIT-LICENSE",
              "README" ] + RUBY_FILES
  #s.rdoc_options = ["--main", "README.txt"]
  #s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  #s.add_dependency("mbleigh-mash", [">= 0.0.5"])
end
