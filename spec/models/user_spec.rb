require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context "nameカラム" do
      it "空欄でないこと" do
        user.name = ""
        is_expected.to eq false
      end

      it "20文字以下であること: 20文字は◯" do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end

      it "20文字以下であること: 21文字は×" do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context "birth_dateカラム" do
      it "空欄でないこと" do
        user.birth_date = ""
        is_expected.to eq false
      end
    end

    context "address_cityカラム" do
      it "空欄でないこと" do
        user.address_city = ""
        is_expected.to eq false
      end
    end

    context "address_streetカラム" do
      it "空欄でないこと" do
        user.address_street = ""
        is_expected.to eq false
      end
    end

    context "address_buildingカラム" do
      it "空欄でないこと" do
        user.address_building = ""
        is_expected.to eq false
      end
    end

    context "postcodeカラム" do
      it "数値のみであること" do
        user.postcode = Faker::Number.number(7)
        expect(user.postcode.is_a? Integer).to be_truthy
      end

      it "7文字であること" do
        user.postcode = "1111111"
        is_expected.to eq true
      end

      it "6文字は×" do
        user.postcode = Faker::Number.number(6)
        is_expected.to eq false
      end

      it "8文字は×" do
        user.postcode = Faker::Number.number(8)
        is_expected.to eq false
      end
    end

    context "emailカラム" do
      it "空欄でないこと" do
        user.email = ""
        is_expected.to eq false
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Postモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context "Favoriteモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context "PostCommentモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context "UserRoomモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:user_rooms).macro).to eq :has_many
      end
    end

    context "Chatモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end

    context "Roomモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end
  end
end