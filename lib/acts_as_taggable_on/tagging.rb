class Tagging < ActiveRecord::Base #:nodoc:
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  belongs_to :tagger, :polymorphic => true
  validates_presence_of :context
  
  # Be careful with these -- they sanitize nothing.
  # Pass them actual tags or tag ids.
  named_scope :only_tags, lambda {|tags|
    {:conditions => ['taggings.tag_id IN (?)', tags]}
  }
  named_scope :except_tags, lambda {|tags|
    {:conditions => ['taggings.tag_id NOT IN (?)', tags]}
  }
end