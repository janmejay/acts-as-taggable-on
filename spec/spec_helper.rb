# To run these specs on a live Rails App, you'll have to change
# the following requirements. Chances are, you want to replace
# ALL of the following code with "require /my/rails/app/spec/spec_helper"

require 'rubygems'
require 'activerecord'
puts <<-NOTE
  FOO
NOTE

$sqlite_conf = {
  :adapter => 'sqlite3',
  :database => File.join(File.dirname(__FILE__), 'db.sqlite3'),
  :encoding => 'utf8'
}

ActiveRecord::Base.establish_connection($sqlite_conf)

$mysql_conf = {
  :adapter => 'mysql',
  :database => 'acts_as_taggable_on',
  :username => 'acts_taggable',
  :password => 'acts_as_taggable_on',
  :encoding => 'utf8'
}

def with_mysql
  ActiveRecord::Base.establish_connection($mysql_conf)
  yield
ensure
  ActiveRecord::Base.establish_connection($sqlite_conf)
end

plugin_spec_dir = File.dirname(__FILE__)
Object::RAILS_DEFAULT_LOGGER = ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require File.join(File.dirname(__FILE__), '..', 'init')

module Spec::Example::ExampleGroupMethods
  alias :context :describe
end

with_mysql do
  load(File.dirname(__FILE__) + '/schema.rb')
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
