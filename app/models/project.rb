class Project < ActiveRecord::Base
    include Sluggable
    sluggable_column :name
  
    belongs_to :experiences
    validates :name, presence: true
    validates :description, presence: true
end