class Resume < ActiveRecord::Base
    include Sluggable
    user_column :last_name
  
    has_many :schools
    has_many :hobbies
    has_many :experiences
    has_many :skills
    has_many :references
    has_many :customs
    has_many :snippets
    has_one :objective
    belongs_to :user
end