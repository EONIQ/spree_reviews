class Spree::FeedbackReviewsController < Spree::StoreController
  helper Spree::BaseHelper

  before_action :sanitize_rating, only: :create
  before_action :load_review, only: :create

  def create
    if @review.present?
      @feedback_review = Spree::FeedbackReview.find_or_initialize_by(review_id: @review.id, user_id: spree_current_user.try(:id))
      @feedback_review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
      @feedback_review.rating = feedback_review_params[:rating]
      @feedback_review.comment = feedback_review_params[:comment]
      authorize! :create, @feedback_review
      @feedback_review.save
    end

    respond_to do |format|
      format.html { redirect_to :back  }
      format.json do 
        render json: @feedback_review, root: 'feedback_review'
      end
      format.js   { render action: :create }
    end
  end

  protected

  def load_review
    @review ||= Spree::Review.find_by_id!(params[:review_id])
  end

  def permitted_feedback_review_attributes
    [:rating, :comment]
  end

  def feedback_review_params
    params.require(:feedback_review).permit(permitted_feedback_review_attributes)
  end

  def sanitize_rating
    params[:feedback_review][:rating].to_s.sub!(/\s*[^0-9|\-]*\z/, '') unless params[:feedback_review] && params[:feedback_review][:rating].blank?
  end
end
