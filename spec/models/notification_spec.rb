require 'rails_helper'

RSpec.describe "Notificationモデルのテスト", type: :model do
  describe "アソシエーションのテスト" do
    context "Postモデルとの関係" do
      it "N:1となっている" do
        expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context "PostCommentモデルとの関係" do
      it "N:1となっている" do
        expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end

    context "Chatモデルとの関係" do
      it "N:1となっている" do
        expect(Notification.reflect_on_association(:chat).macro).to eq :belongs_to
      end
    end

    context "Roomモデルとの関係" do
      it "N:1となっている" do
        expect(Notification.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end
