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
require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
