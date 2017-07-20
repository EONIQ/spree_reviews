module Spree
  class ReviewSerializer < ApplicationSerializer    
    attributes :id, :name, :title, :rating, :review, :locale, :created_at, :updated_at, :number_of_thumb_up, :number_of_thumb_down

    has_many :user_feedback_reviews

    def created_at
      object.created_at.strftime('%b %d, %y')
    end
  end
end
