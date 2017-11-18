class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  # GET users/1/decks
  def index
    @decks = current_user.decks
  end

  # GET users/1/decks/1
  def show
  end

  # GET users/1/decks/new
  def new
    @deck = current_user.decks.build
  end

  # GET users/1/decks/1/edit
  def edit
  end

  # POST users/1/decks
  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      redirect_to action: 'index', notice: 'Deck was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT users/1/decks/1
  def update
    if @deck.update_attributes(deck_params)
      redirect_to([@deck.user, @deck], notice: 'Deck was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/decks/1
  def destroy
    @deck.destroy
    redirect_to decks_url(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_deck
      @deck = current_user.decks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deck_params
      params.require(:deck).permit(:name)
    end
end
