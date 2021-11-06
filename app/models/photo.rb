# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer          not null
#
# Indexes
#
#  index_photos_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  todo_id  (todo_id => todos.id)
#
class Photo < ApplicationRecord
    validates :title, presence: true, uniqueness: { message: ->(object, data){ "%{value} ya fue usad para #{object.title}" } }
    # validates :title, presence: true, uniqueness: { message: "%{value} es un valor que ya fue ocupado para %{attribute}" }
    validates :image_url, presence: true, format: { with: /.\.(png|jpg|jpeg|gif)/, message: "La URL no es apropiada" }
    # validates_format_of :image_url, with: /.\.(png|jpg|jpeg|gif)/, message: "must be a URL for a GIF, JPG, or PNG image"
    
    belongs_to :todo
    has_and_belongs_to_many :tags

    scope :latest, ->(limit) { order("id desc").limit(limit) } do
        def foo
            puts "Hello world"
        end
    end
    scope :paginate_scope, ->(page=1, per_page=15) { order("id desc").offset((page - 1) * per_page).limit(per_page) if page && per_page }

    # def self.paginate(page=1, per_page=15)
    #     # will_paginate
    #     Photo.order("id desc").offset((page - 1) * per_page).limit(per_page) if page && per_page
    # end

end
