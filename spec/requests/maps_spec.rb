require 'rails_helper'

RSpec.describe MapsController, type: :request do
  describe 'GET #index' do
    before do
      FactoryBot.create :house
      FactoryBot.create :school
    end

    it 'リクエストが成功すること' do
      get maps_url
      expect(response.status).to eq 200
    end

    it '住所が表示されていること' do
      get maps_url
      expect(response.body).to include "青木の家"
      expect(response.body).to include "名古屋大学"
    end
  end

  describe 'GET #show' do
    context 'マップが存在する場合' do
      let(:house) { FactoryBot.create :house }

      it 'リクエストが成功すること' do
        get map_url(house.id)
        expect(response.status).to eq 200
      end

      it 'showテンプレートで表示されること' do
        get map_url(house.id)
        expect(response).to render_template :show
      end

      it '@mapが取得できていること' do
        get map_url(house.id)
        expect(assigns :map).to eq house
      end
    end

    context 'マップが存在しない場合' do
      subject { -> { get map_url(1) } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'GET #edit' do
    context 'マップが存在する場合' do
      let(:house) { FactoryBot.create :house }

      it 'リクエストが成功すること' do
        get edit_map_url(house.id)
        expect(response.status).to eq 200
      end

      it 'editテンプレートで表示されること' do
        get edit_map_url(house.id)
        expect(response).to render_template :edit
      end

      it '@mapが取得できていること' do
        get edit_map_url(house.id)
        expect(assigns :map).to eq house
      end
    end

    context 'マップが存在しない場合' do
      subject { -> { get edit_map_url(1) } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post maps_url, params: { map: FactoryBot.attributes_for(:map) }
        expect(response.status).to eq 302
      end

      it 'マップが登録されること' do
        expect do
          post maps_url, params: { map: FactoryBot.attributes_for(:map) }
        end.to change(Map, :count).by(+1)
      end

      it 'リダイレクトすること' do
        post maps_url, params: { map: FactoryBot.attributes_for(:map) }
        expect(response).to redirect_to root_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post maps_url, params: { map: FactoryBot.attributes_for(:map, :invalid) }
        expect(response.status).to eq 302
      end

      it 'マップが登録されないこと' do
        expect do
          post maps_url, params: { map: FactoryBot.attributes_for(:map, :invalid) }
        end.to_not change(Map, :count)
      end
    end
  end

  describe 'PUT #update' do
    let(:map) { FactoryBot.create :house }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put map_url map, params: { map: FactoryBot.attributes_for(:school) }
        expect(response.status).to eq 302
      end

      it '住所が更新されること' do
        expect do
          put map_url map, params: { map: FactoryBot.attributes_for(:school) }
        end.to change { Map.find(map.id).address }.to('名古屋大学')
      end

      it 'リダイレクトすること' do
        put map_url map, params: { map: FactoryBot.attributes_for(:school) }
        expect(response).to redirect_to root_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        put map_url map, params: { map: FactoryBot.attributes_for(:map, :invalid) }
        expect(response.status).to eq 200
      end

      it '住所が変更されないこと' do
        expect do
          put map_url map, params: { map: FactoryBot.attributes_for(:map, :invalid) }
        end.to_not change(Map.find(map.id), :address)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:map) { FactoryBot.create :house }

    it 'リクエストが成功すること' do
      delete map_url map
      expect(response.status).to eq 302
    end

    it 'マップが削除されること' do
      expect do
        delete map_url map
      end.to change(Map, :count).by(-1)
    end

    it 'マップ一覧にリダイレクトすること' do
      delete map_url map
      expect(response).to redirect_to(maps_url)
    end
  end
end