class Tweet < ApplicationRecord
    acts_as_votable

    
    belongs_to :user

    ################ comments ###################
    has_many :comments, dependent: :destroy

    has_one_attached :image  #to render image in the tweets controller
    def display_image
        image.variant(resize_to_limit: [700, 700])
    end
end
