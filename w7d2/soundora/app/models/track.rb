# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  song_name  :string           not null
#  band_id    :integer          not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#do I really need the album_id to be null false?
class Track < ApplicationRecord
    validates :song_name, presence: true
    validates_uniqueness_of :song_name, scope: [:band_id]

    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end
