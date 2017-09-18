require 'rails_helper'

feature 'ログインとログアウト' do
  let(:user){
    # ユーザを作成する
    User.create!(email: 'hogehoge@test.com', password: '123456')
  }
  scenario 'ログインする' do
    user
    # トップページを開く
    visit root_path
    # ログインフォームにEmailとパスワードを入力する
    click_link 'Sign in'
    fill_in 'Email', with: 'hogehoge@test.com'
    fill_in 'Password', with: '123456'
    # ログインボタンをクリックする
    click_on 'Log in'
    # ログインに成功したことを検証する
    expect(page).to have_content 'Sign out'
  end
  scenario 'ログアウトする' do
    login_as user, scope: :user
    visit root_path
    click_link 'Sign out'
    expect(page).to have_content 'Sign in'
  end
  scenario 'サインアップする' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'hogehoge2@test.com'
    fill_in 'Password', with: '654321'
    fill_in 'Password confirmation', with: '654321'
    click_on 'Sign up'
    expect(page).to have_content 'Sign out'
  end
end