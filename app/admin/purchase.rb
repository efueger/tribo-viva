ActiveAdmin.register Purchase do
  permit_params :user, :offer, :amount, :status, :receipt

  menu priority: 8

  member_action :confirm do
    p = Purchase.find(params[:id])
    p.confirm!
    redirect_to admin_offer_path(p.offer), notice: "Compra confirmada com sucesso!"
  end

  member_action :cancel do
    p = Purchase.find(params[:id])
    p.cancel!
    redirect_to admin_offer_path(p.offer), notice: "Compra cancelada com sucesso!"
  end

  action_item only: :show do
    p = Purchase.find(params[:id])
    unless p.confirmed?
      link_to 'Confirmar', confirm_admin_purchase_path
    end
  end

  action_item only: :show do
    p = Purchase.find(params[:id])
    unless p.canceled?
      link_to 'Cancelar', cancel_admin_purchase_path
    end
  end

  index do
    column :transaction_id
    column :amount
    column 'Valor total' do |purchase|
      number_to_currency (purchase.amount * (purchase.offer.value + purchase.offer.operational_tax + purchase.offer.coordinator_tax))
    end
    column :receipt do |purchase|
      image_tag purchase.receipt.url, size: '100'
    end
    column :user
    column :offer
    column :status do |purchase|
      PurchaseStatus.t purchase.status
    end
    actions
  end

  show do
    attributes_table do
      row :transaction_id
      row :status do |purchase|
        PurchaseStatus.t purchase.status
      end
      row :amount
      row 'Valor total' do |purchase|
        number_to_currency purchase.total
      end
      row :user
      row :offer
      row :receipt do |purchase|
        image_tag purchase.receipt.url, size: '100'
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, collection: PruchaseStatus.to_a, as: :select
      f.input :amount
      f.input :user
      f.input :offer
      f.input :receipt, as: :file, hint: f.object.receipt.present? ? image_tag(f.object.receipt.url, size: '300') : content_tag(:span, "Nenhuma imagem presente.")
    end

    f.actions
  end
end
