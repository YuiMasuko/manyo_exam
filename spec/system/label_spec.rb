# require 'rails_helper'
# RSpec.describe 'ラベル機能', type: :system do
#   let!(:label) { FactoryBot.create(:label) }
#   let!(:second_label) { FactoryBot.create(:second_label) }
#   let!(:basic_user) { FactoryBot.create(:basic_user) }
#   let!(:task) { FactoryBot.create(:task, user:basic_user) }
#   let!(:second_task) { FactoryBot.create(:second_task, user: basic_user) }
#   before do
#     visit new_session_path
#     fill_in 'session[email]', with: 'basic_email@gmail.com'
#     fill_in 'session[password]', with:'basicuser'
#     click_button 'ログイン'
#   end
#   describe '新規作成機能' do
#     context 'ラベルを新規作成した場合' do
#       it '作成したラベルが一覧に表示される' do
#       visit new_task_path
#       fill_in 'task[title]', with: 'test_title'
#       fill_in 'task[content]', with: 'test_content'
#       fill_in 'task[expired_at]', with: '2021-08-11 00:00:00'.to_date
#       find('.field_status').set('着手中')
#       find('.field_priorty').set('中')
#       select
#       click_button '送信'
#       click_button '作成する'
#       expect(page).to have_content 'test_title'
#       expect(page).to have_content 'test_content'
#       expect(page).to have_content '着手中'
#       expect(page).to have_content '中'
#       end
#     end
#   end
