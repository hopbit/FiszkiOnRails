class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cards
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET decks/1/cards
  def index
    @cards = @deck.cards
  end

  # GET decks/1/cards/1
  def show
  end

  # GET decks/1/cards/new
  def new
    @card = @deck.cards.build
  end

  # GET decks/1/cards/1/edit
  def edit
  end

  # POST decks/1/cards
  def create
    @card = @deck.cards.build(card_params)

    if @card.save
      redirect_to([@card.deck, @card], notice: 'Card was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT decks/1/cards/1
  def update
    if @card.update_attributes(card_params)
      redirect_to([@card.deck, @card], notice: 'Card was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE decks/1/cards/1
  def destroy
    @card.destroy

    redirect_to deck_cards_url(@deck)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cards
      @deck = Deck.find(params[:deck_id])
    end

    def set_card
      @card = @deck.cards.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:front, :back)
    end
end
