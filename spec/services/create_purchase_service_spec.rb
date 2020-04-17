# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CreatePurchaseService' do
  describe 'call' do
    let(:user) { create(:user) }
    let(:purchase_option) { create(:purchase_option) }

    context 'new content' do
      it 'returns a saved purchase' do
        purchase = CreatePurchaseService.call(user_id: user.id, purchase_option_id: purchase_option.id)

        expect(purchase).to be_persisted
        expect(purchase.user_id).to eq(user.id)
        expect(purchase.purchase_items.first.purchase_option).to eq(purchase_option)
      end
    end

    context 'previous purchase is not expired' do
      it 'must not allow to create purchase and raise error' do
        create(:purchase, user: user, purchase_items: [build(:purchase_item, purchase_option: purchase_option)])

        expect do
          CreatePurchaseService.call(user_id: user.id, purchase_option_id: purchase_option.id)
        end.to raise_error('PrevPurchaseIsNotExpired')
      end
    end

    context 'previous purchase is expired' do
      it 'allows to repurchase the content' do
        create(:purchase, :expired, user: user, purchase_items: [build(:purchase_item, purchase_option: purchase_option)])

        purchase = CreatePurchaseService.call(user_id: user.id, purchase_option_id: purchase_option.id)

        expect(purchase).to be_persisted
        expect(purchase.user_id).to eq(user.id)
        expect(purchase.purchase_items.first.purchase_option).to eq(purchase_option)
      end
    end
  end
end
