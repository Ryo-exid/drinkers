require 'rails_helper'

describe "ユーザログイン後のテスト" do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }
  
  before do
    visit new_user_session_path
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: user.password
    click_button "ログイン"
  end
  
  describe "headerのテスト: ログインしている場合" do
    subject { current_path }
    
    context "表示内容の確認" do
      it "タイトルが表示される" do
        expect(page).to have_content "Drinker × Drinker"
      end
      it "トップ画面リンクが表示される: 左上から1番目のリンクが「Drinker × Drinker」である" do
        top_link = find_all("a")[0].native.inner_text
        expect(top_link).to match(/Drinker × Drinker/i)
      end
      it "トップ画面リンクの内容が正しい" do
        top_link = find_all("a")[0].native.inner_text
        expect(page).to have_link top_link, href: root_path
      end
      it "通知リンクが表示される: 左上から2番目のリンクが「通知」である" do
        notification_link = find_all("a")[1].native.inner_text
        expect(notification_link).to match(/通知/i)
      end
      it "通知リンクの内容が正しい" do
        notification_link = find_all("a")[1].native.inner_text
        expect(page).to have_link notification_link, href: notifications_path
      end
      it "投稿一覧リンクが表示される: 左上から3番目のリンクが「投稿一覧」である" do
        post_link = find_all("a")[2].native.inner_text
        expect(post_link).to match(/投稿一覧/i)
      end
      it "投稿一覧リンクの内容が正しい" do
        post_link = find_all("a")[2].native.inner_text
        expect(page).to have_link post_link, href: posts_path
      end
      it "マイページリンクが表示される: 左上から4番目のリンクが「マイページ」である" do
        mypage_link = find_all("a")[3].native.inner_text
        expect(mypage_link).to match(/マイページ/i)
      end
      it "マイページリンクの内容が正しい" do
        mypage_link = find_all("a")[3].native.inner_text
        expect(page).to have_link mypage_link, href: user_path(user)
      end
      it "ログアウトリンクが表示される: 左上から5番目のリンクが「ログアウト」である" do
        log_out_link = find_all("a")[4].native.inner_text
        expect(log_out_link).to match(/ログアウト/i)
      end
      it "ログアウトリンクの内容が正しい" do
        log_out_link = find_all("a")[4].native.inner_text
        expect(page).to have_link log_out_link, href: destroy_user_session_path
      end
      it "お問い合わせリンクが表示される: 左上から6番目のリンクが「お問い合わせ」である" do
        inquiry_link = find_all("a")[5].native.inner_text
        expect(inquiry_link).to match(/お問い合わせ/i)
      end
      it "お問い合わせリンクの内容が正しい" do
        inquiry_link = find_all("a")[5].native.inner_text
        expect(page).to have_link inquiry_link, href: inquiry_path
      end
    end
  end
  
  describe "ユーザログアウトのテスト" do
    before do
      click_link "ログアウト"
    end
    
    context "ログアウト機能のテスト" do
      it "正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する" do
        about_link = find_all("a")[1].native.inner_text
        expect(page).to have_link about_link, href: homes_about_path
      end
      it "ログアウト後のリダイレクト先がトップ画面になっている" do
        expect(current_path).to eq "/"
      end
    end
  end
  
  describe "投稿一覧画面のテスト" do
    before do
      visit posts_path
    end
    
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/posts"
      end
      it "投稿画像が表示される" do
        expect(page).to have_content post.post_image_id
      end
      it "自分と他人のプロフィールイメージ画像のリンク先が正しい" do
        expect(page).to have_link user.profile_image, href: user_path(post.user)
        expect(page).to have_link other_user.profile_image, href: user_path(other_post.user)
      end
      it "タイトルが表示される" do
        expect(page).to have_content post.title
      end
      it "投稿タイトルのリンク先が正しい" do
        click_link post.title
        expect(current_path).to eq "/posts/1"
      end
      it "キャプションが表示される" do
        expect(page).to have_content post.caption
      end
      it "レビューが表示される" do
        expect(page).to have_content post.rate
      end
      it "コメントボタンが表示される" do
        expect(page).to have_content post.post_comments.count
      end
      it "いいねボタンが表示される" do
        expect(page).to have_content post.favorites.count
      end
      it "場所が表示される" do
        expect(page).to have_content post.location
      end
    end
  end
  
  describe "新規投稿画面のテスト" do
    before do
      visit posts_path
      click_link "Create"
      visit new_post_path
    end
    
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/posts/new"
      end
      it "ファイルを選択が表示される" do
        expect(page).to have_field "post[post_image]"
      end
      it "タイトルフォームが表示される" do
        expect(page).to have_field "post[title]"
      end
      it "キャプションフォームが表示される" do
        expect(page).to have_field "post[caption]"
      end
      it "レビューが表示される" do
        expect(page).to have_content "レビュー"
      end
      it "場所フォームが表示される" do
        expect(page).to have_field "post[location]"
      end
    end
  end
end