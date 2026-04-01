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

  it 'カレンダーの日付をクリックして、Actionを新規投稿できる' do
  today = Time.zone.now.to_date

  expect(page).to have_selector('.day', wait: 10)

  # モーダル強制オープン
  page.execute_script(<<~JS)
    document.getElementById('actionModal').style.display = 'flex';
  JS

  page.execute_script("document.getElementById('modalDateInput').value = '#{today}'")

  expect(page).to have_selector('#actionModal', visible: true, wait: 10)

  fill_in 'contentField', with: 'RSpecのテストを書き切る！'
  fill_in 'reflectionField', with: 'エラーを乗り越えて自信がついた。'
  fill_in 'goalField', with: '明日はポートフォリオをデプロイする'

  click_button '一歩進む'

  expect(page).to have_content('RSpecのテストを書き切る！', wait: 10)
end
end