require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
  @user = FactoryBot.create(:user, password: 'password123', password_confirmation: 'password123')
  end

  it 'ログインに成功し、トップページに遷移する' do
    visit new_user_session_path

    fill_in 'user_email', with: @user.email
   fill_in 'user_password', with: 'password123'
    
   find('input[name="commit"]').click

    expect(page).to have_content('Logout', wait: 2)
    expect(current_path).to eq root_path
    expect(page).to have_content(@user.name)
  end

  it 'ログインに失敗すると、再度ログインページに戻ってくる' do
    visit new_user_session_path
    fill_in 'user_email', with: 'wrong@example.com'
    fill_in 'user_password', with: 'wrongpassword'
    click_button 'Log in'

    expect(current_path).to eq new_user_session_path
  end
end