require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context "post_imageカラム" do
      it "画像が空でないこと" do
        post.post_image_id = ""
        is_expected.to eq false
      end
    end

    context "titleカラム" do
      it "空欄でないこと" do
        post.title = ""
        is_expected.to eq false
      end

      it "30文字以下であること: 30文字は◯" do
        post.title = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end

      it "30文字以下であること: 31文字は×" do
        post.title = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end

    context "captionカラム" do
      it "空欄でないこと" do
        post.caption = ""
        is_expected.to eq false
      end

      it "140文字以下であること: 140文字は◯" do
        post.caption = Faker::Lorem.characters(number: 140)
        is_expected.to eq true
      end

      it "140文字以下であること: 141文字は×" do
        post.caption = Faker::Lorem.characters(number: 141)
        is_expected.to eq false
      end
    end

    context "rateカラム" do
      it "レビュー評価が空でないこと" do
        post.rate = ""
        is_expected.to eq false
      end
    end

    context "locationカラム" do
      it "空欄でないこと" do
        post.location = ""
        is_expected.to eq false
      end

      it "20文字以下であること: 20文字は◯" do
        post.location = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end

      it "20文字以下であること: 21文字は×" do
        post.location = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Userモデルとの関係" do
      it "N:1となっている" do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Favoriteモデルとの関係" do
      it "1:Nとなっている" do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context "PostCommentモデルとの関係" do
      it "1:Nとなっている" do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context "Notificationモデルとの関係" do
      it "1:Nとなっている" do
        expect(Post.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
