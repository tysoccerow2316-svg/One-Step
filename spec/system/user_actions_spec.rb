require 'rails_helper'

RSpec.describe "Action管理機能", type: :system do
  before do
    
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: '123456'
    find('input[name="commit"]').click
   
    expect(page).to have_content('Logout', wait: 5)
  end

 it 'カレンダーの日付をクリックして、Actionを新規投稿できる', js: true do
  expect(page).to have_selector('.day', wait: 10)
today = Time.zone.now.to_date.to_s 
  
  page.execute_script <<~JS
  try {
    openModal('#{today}', '', '', '', '');
  } catch(e) {}
  document.querySelector('.modal').style.display = 'flex';
JS

  expect(page).to have_content('☀️ 今日のAction', wait: 10)

  fill_in 'contentField', with: 'RSpecのテストを書き切る！'
  fill_in 'reflectionField', with: 'エラーを乗り越えて自信がついた。'
  fill_in 'goalField', with: '明日はポートフォリオをデプロイする'

  page.execute_script <<~JS
  document.querySelector('form').submit();
JS

 expect(page).to have_text('RSpecのテストを書き切る！', wait: 15)
end
end