class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :school
      t.text :description
      t.date :start
      t.date :end

      t.belongs_to :profile, index: true, foreign_key: true

      t.timestamps
    end
  end
end
