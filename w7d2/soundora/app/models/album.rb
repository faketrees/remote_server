# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, presence: true, 
    validates_uniqueness_of :title, scope: [:band_id]

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band

    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track,
        dependent: :destroy
        
end
