require 'rails_helper'

RSpec.describe Map, type: :model do
  before do 
    @map = build(:map)
  end
  describe 'バリデーション' do
    context "address、latitude、longitudeがある場合" do
      it '有効であること' do
        expect(@map.valid?).to eq(true)
      end
    end
    context "addressが無い場合" do
      it '無効であること' do
        @map.address = nil
        @map.valid?
        expect(@map.errors[:address]).to include("can't be blank")
      end
    end
    context "latitudeが無い場合" do
      it '無効であること' do
        @map.latitude = nil
        @map.valid?
        expect(@map.errors[:latitude]).to include("can't be blank")
      end
    end
    context "longitudeが無い場合" do
      it '無効であること' do
        @map.longitude = nil
        @map.valid?
        expect(@map.errors[:longitude]).to include("can't be blank")
      end
    end
  end
end