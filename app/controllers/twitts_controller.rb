class TwittsController < ApplicationController
  def index
    @twitts = Twitt.order(created_at: :desc)
    @twitt = Twitt.new
  end

  def create
    @twitt = current_user.twitts.new(twitt_params)
    @twitt = Twitt.new if @twitt.save

    render turbo_stream: turbo_stream.replace('twitts_form',
      partial: 'twitts/form',
      locals: { twitt: @twitt })
  end

  def like
    twitt = Twitt.find(params[:id])
    twitt.like += 1
    twitt.save!
  end

  private

  def twitt_params
    params.require(:twitt).permit(:content)
  end
end
