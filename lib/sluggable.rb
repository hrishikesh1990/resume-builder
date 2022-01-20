module Sluggable
    extend ActiveSupport::Concern
  
    included do
      before_save :generate_slug!
      class_attribute :slug_column, :slug_class, :col_name, :self_class
    end
  
    def generate_slug!
      if self_class == 'self'
        the_slug = to_slug(self.send(self.class.slug_column.to_sym))
      elsif self_class == 'user'
        user = User.find(self.user_id)
        the_slug = to_slug(user.send(user.slug_column.to_sym))
      elsif self_class == 'objective'
        the_slug = "objective"
      end
      obj = self.class.find_by(slug: the_slug)
      count = 2
      while obj && obj != self
        the_slug = append_suffix(the_slug, count)
        obj = self.class.find_by(slug: the_slug)
        count += 1
      end
      
      self.slug = the_slug
    end
  
    def append_suffix(str, int)
      if str.split('-').last.to_i != 0
        return str.split('-').slice(0...-1).join('-') + "-" + int.to_s
      else
        return str + "-2"
      end
    end
  
    def to_slug(name)
      str = name.strip
      str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
      str.gsub! /-+/, '-'
      str.downcase
    end
  
    def to_param
      self.slug
    end
  
    module ClassMethods
      def sluggable_column(col_name)  
        self.self_class = 'self'  
        self.slug_column = col_name
      end
  
      def user_column(col_name)
        self.self_class = 'user'
        self.slug_column = col_name
      end
  
      def objective_column
        self.self_class = 'objective'
      end
    end