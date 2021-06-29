require 'rails_helper'

describe "ログインユーザ前のテスト" do
  describe "トップ画面のテスト" do
    before do
      visit root_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/"
      end
      it "新規登録リンクが表示される: 左上から4番目のリンクが「新規登録」である" do
        sign_up_link = find_all("a")[3].native.inner_text
        expect(sign_up_link).to match(/新規登録/i)
      end
      it "新規登録リンクの内容が正しい" do
        sign_up_link = find_all("a")[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
      it "ログインリンクが表示される: 左上から5番目のリンクが「ログイン」である" do
        log_in_link = find_all("a")[4].native.inner_text
        expect(log_in_link).to match(/ログイン/i)
      end
      it "ログインリンクの内容が正しい" do
        log_in_link = find_all("a")[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
    end
  end

  describe "About画面のテスト" do
    before do
      visit "/homes/about"
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/homes/about"
      end
    end
  end

  describe "headerのテスト: ログインしていない場合" do
    before do
      visit root_path
    end

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
      it "Aboutリンクが表示される: 左上から2番目のリンクが「About」である" do
        about_link = find_all("a")[1].native.inner_text
        expect(about_link).to match(/About/i)
      end
      it "Aboutリンクの内容が正しい" do
        about_link = find_all("a")[1].native.inner_text
        expect(page).to have_link about_link, href: homes_about_path
      end
      it "投稿一覧リンクが表示される: 左上から3番目のリンクが「投稿一覧」である" do
        post_link = find_all("a")[2].native.inner_text
        expect(post_link).to match(/投稿一覧/i)
      end
      it "投稿一覧リンクの内容が正しい" do
        post_link = find_all("a")[2].native.inner_text
        expect(page).to have_link post_link, href: posts_path
      end
      it "新規登録リンクが表示される: 左上から4番目のリンクが「新規登録」である" do
        sign_up_link = find_all("a")[3].native.inner_text
        expect(sign_up_link).to match(/新規登録/i)
      end
      it "新規登録リンクの内容が正しい" do
        sign_up_link = find_all("a")[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
      it "ログインリンクが表示される: 左上から5番目のリンクが「ログイン」である" do
        log_in_link = find_all("a")[4].native.inner_text
        expect(log_in_link).to match(/ログイン/i)
      end
      it "ログインリンクの内容が正しい" do
        log_in_link = find_all("a")[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
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

  describe "ユーザ新規登録のテスト" do
    before do
      visit new_user_registration_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users/sign_up"
      end
      it "「アカウントを作成」と表示される" do
        expect(page).to have_content "アカウントを作成"
      end
      it "ユーザネームフォームが表示される" do
        expect(page).to have_field "user[name]"
      end
      it "「生年月日」と表示される" do
        expect(page).to have_content "生年月日"
      end
      it "郵便番号フォームが表示される" do
        expect(page).to have_field "user[postcode]"
      end
      it "都道府県セレクトタグが表示される" do
        expect(page).to have_select "user[prefecture_code]"
      end
      it "市区町村フォームが表示される" do
        expect(page).to have_field "user[address_city]"
      end
      it "番地フォームが表示される" do
        expect(page).to have_field "user[address_street]"
      end
      it "建物名フォームが表示される" do
        expect(page).to have_field "user[address_building]"
      end
      it "メールアドレスフォーム表示される" do
        expect(page).to have_field "user[email]"
      end
      it "パスワードフォームが表示される" do
        expect(page).to have_field "user[password]"
      end
      it "パスワード(確認用)フォームが表示される" do
        expect(page).to have_field "user[password_confirmation]"
      end
      it "「新規登録」ボタンが表示される" do
        expect(page).to have_button "新規登録"
      end
    end

    context "新規登録成功のテスト" do
      before do
        fill_in "user[name]", with: Faker::Lorem.characters(number: 10)
        fill_in "user[postcode]", with: "1111111"
        fill_in "user[address_city]", with: Faker::Lorem.characters(number: 10)
        fill_in "user[address_street]", with: "1-1-1"
        fill_in "user[address_building]", with: Faker::Lorem.characters(number: 10)
        fill_in "user[email]", with: Faker::Internet.email
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
      end

      it "正しく新規登録される" do
        expect { click_button "新規登録" }.to change(User.all, :count).by(1)
      end
      it "新規登録後のリダイレクト先が、投稿一覧ページになっている" do
        click_button "新規登録"
        expect(current_path).to eq "/posts"
      end
    end
  end

  describe "ユーザログイン" do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users/sign_in"
      end
      it "「ログイン」と表示される" do
        expect(page).to have_content "ログイン"
      end
      it "ユーザネームフォームが表示される" do
        expect(page).to have_field "user[name]"
      end
      it "パスワードフォームが表示される" do
        expect(page).to have_field "user[password]"
      end
      it "「ログイン」ボタンが表示される" do
        expect(page).to have_button "ログイン"
      end
      it "emailフォームは表示されない" do
        expect(page).not_to have_field "user[email]"
      end
    end

    context "ログイン成功のテスト" do
      before do
        fill_in "user[name]", with: user.name
        fill_in "user[password]", with: user.password
        click_button "ログイン"
      end

      it "ログイン後のリダイレクト先が投稿一覧になっている" do
        expect(current_path).to eq "/posts"
      end
    end

    context "ログイン失敗のテスト" do
      before do
        fill_in "user[name]", with: ""
        fill_in "user[password]", with: ""
        click_button "ログイン"
      end

      it "ログインに失敗し、ログイン画面にリダイレクトされる" do
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end
end
