require 'pathname'
dir = Pathname(__FILE__).dirname
require dir.join('rails_skeleton','spec','spec_helper')
root = dir.join '..'
$:.unshift root.join('lib')
require root.join('init')

module Spec::Example::ExampleGroupMethods
  alias :context :describe
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

load(File.dirname(__FILE__) + '/schema.rb')

class TaggableModel < ActiveRecord::Base
  acts_as_taggable_on :tags, :languages
  acts_as_taggable_on :skills
end

class OtherTaggableModel < ActiveRecord::Base
  acts_as_taggable_on :tags, :languages
end

class InheritingTaggableModel < TaggableModel
end

class AlteredInheritingTaggableModel < TaggableModel
  acts_as_taggable_on :parts
end

class TaggableUser < ActiveRecord::Base
  acts_as_tagger
end

class UntaggableModel < ActiveRecord::Base
end