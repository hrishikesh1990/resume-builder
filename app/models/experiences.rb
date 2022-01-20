class Experience < ActiveRecord::Base
    include Sluggable
    sluggable_column :job_title
  
    belongs_to :resume
    has_many :projects
    validates :job_title, presence: true
  end