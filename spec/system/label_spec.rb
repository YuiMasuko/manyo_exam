require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  let!(:label) { FactoryBot.create(:label) }
  let!(:basic_user) { FactoryBot.create(:basic_user) }
  let!(:task) { FactoryBot.create(:task, user:basic_user) }
  let!(:second_task) { FactoryBot.create(:second_task, user: basic_user) }
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'basic_email@gmail.com'
    fill_in 'session[password]', with:'basicuser'
    click_button 'ログイン'
    visit new_task_path
    fill_in 'task[title]', with: 'test_title'
    fill_in 'task[content]', with: 'test_content'
    fill_in 'task[expired_at]', with: '2021-08-23 00:00:00'.to_date
    find('.field_status').set('着手中')
    find('.field_priority').set('中')
    check 'task_label_ids_1'
    click_button '送信'
    click_button '作成する'
  end
  describe '新規作成機能' do
    context 'タスクを新規作成したとき' do
      it 'ラベルがタスクと一緒に登録される' do
        expect(page).to have_content 'ラベル1'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it 'タスクにつけたラベルの内容が表示される' do
        all('.index_list')[0].click_link '詳細'
        expect(page).to have_content 'ラベル1'
      end
    end
  end
  describe '検索機能' do
    context 'ラベル検索をした場合' do
      it "検索したラベルがついているタスクが絞り込まれる" do
        select 'ラベル1', from: 'label_id'
        click_button '検索'
        expect(page).to have_content 'ラベル1'
      end
    end
  end
end
