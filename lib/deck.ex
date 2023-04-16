defmodule Deck do
  def create_deck do
    values = ["ace", "two", "three", "four", "five"]
    suits = ["spade", "club", "hearts", "diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle_deck(cards) do
    Enum.shuffle(cards)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
