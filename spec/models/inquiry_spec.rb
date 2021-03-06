require 'rails_helper'

RSpec.describe "Inquiryモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    subject { inquiry.valid? }

    let!(:inquiry) { build(:inquiry) }

    context "nameカラム" do
      it "空欄でないこと" do
        inquiry.name = ""
        is_expected.to eq false
      end

      it "30文字以下であること: 30文字は◯" do
        inquiry.name = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end

      it "30文字以下であること: 31文字は×" do
        inquiry.name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end

    context "emailカラム" do
      it "空欄でないこと" do
        inquiry.email = ""
        is_expected.to eq false
      end
    end

    context "messageカラム" do
      it "空欄でないこと" do
        inquiry.message = ""
        is_expected.to eq false
      end

      it "500文字以下であること: 20文字は◯" do
        inquiry.message = Faker::Lorem.characters(number: 500)
        is_expected.to eq true
      end

      it "500文字以下であること: 501文字は×" do
        inquiry.message = Faker::Lorem.characters(number: 501)
        is_expected.to eq false
      end
    end
  end
end
