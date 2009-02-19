# To run these specs on a live Rails App, you'll have to change
# the following requirements. Chances are, you want to replace
# ALL of the following code with "require /my/rails/app/spec/spec_helper"

require 'rubygems'
require 'activerecord'
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3',
                                        :database => ':memory:',
                                        :timeout => 5000,
                                        :encoding => 'utf8')

plugin_spec_dir = File.dirname(__FILE__)
Object::RAILS_DEFAULT_LOGGER = ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require File.join(File.dirname(__FILE__), '..', 'init')

module Spec::Example::ExampleGroupMethods
  alias :context :describe
end

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
