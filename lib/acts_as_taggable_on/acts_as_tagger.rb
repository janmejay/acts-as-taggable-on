module ActiveRecord
  module Acts
    module Tagger
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def acts_as_tagger(opts={})
          has_many :owned_taggings, opts.merge(:as => :tagger, :dependent => :destroy, 
                                               :include => :tag, :class_name => "Tagging")
          has_many :owned_tags, :through => :owned_taggings, :source => :tag
          include ActiveRecord::Acts::Tagger::InstanceMethods
          extend ActiveRecord::Acts::Tagger::SingletonMethods       
        end
        
        def is_tagger?
          false
        end
      end
      
      module InstanceMethods
        def self.included(base)
        end
        
        def tag_without_save(taggable, opts={})
          opts.reverse_merge!(:force => true)

          return false unless taggable.respond_to?(:is_taggable?) && taggable.is_taggable?
          raise "You need to specify a tag context using :on" unless opts.has_key?(:on)
          raise "You need to specify some tags using :with" unless opts.has_key?(:with)
          raise "No context :#{opts[:on]} defined in #{taggable.class.to_s}" unless 
              ( opts[:force] || taggable.tag_types.include?(opts[:on]) )

          taggable.set_tag_list_on(opts[:on].to_s, opts[:with], self)
        end
        
        def tag taggable, opts
          tag_without_save taggable, opts
          taggable.save!
        end
        
        def is_tagger?
          self.class.is_tagger?
        end
        
        # Return all tags tagged by tagger with count
        def tag_counts(options={})
          joins       = ["LEFT OUTER JOIN #{Tagging.table_name} ON #{Tag.table_name}.id = #{Tagging.table_name}.tag_id"]
          conditions  = "#{Tagging.table_name}.tagger_type = '#{self.class}' AND #{Tagging.table_name}.tagger_id = #{self.id}"
          group_by    = "#{Tag.table_name}.id, #{Tag.table_name}.name HAVING COUNT(*) > 0"
          
          Tag.find(:all, {
            :select     => "tags.id, tags.name, COUNT(*) AS count",
            :conditions => conditions,
            :joins      => joins.join(" "),
            :group      => group_by
          }.merge(options))
        end
      end
      
      module SingletonMethods
        def is_tagger?
          true
        end
      end
      
    end
  end
end