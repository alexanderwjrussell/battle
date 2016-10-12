require_relative 'welpers'
require 'spec_helper'

feature 'attack player 2' do
  scenario "attacks the other player" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content ("Larry's turn")
  end

  scenario "attacks player 2 and reduces hit points by 10" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content ("Larry HP: 90")
  end
end

feature 'attack player 1' do
  scenario 'player 2 attacks player 1' do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'ATTACK!'
    expect(page).to have_content ("Larry has attacked Bob")
  end
end

feature 'Switching turns' do
  scenario 'allows only player 1 to attack' do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'ATTACK!'
    expect(page).to have_content ("Bob's turn")
  end
end