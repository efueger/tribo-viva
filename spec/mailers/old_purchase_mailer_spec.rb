require "rails_helper"

RSpec.describe PurchaseMailer, type: :mailer do
  describe ".pending_payment" do
    let!(:purchase) { Purchase.make!(status: PurchaseStatus::PENDING) }
    let!(:mail) { PurchaseMailer.pending_payment(purchase) }

    it "renders the headers" do
      expect(mail.subject).to eq("Compra pendente de pagamento")
      expect(mail.to).to eq([purchase.user.email])
      expect(mail.from).to eq(["confirmacao@triboviva.com.br"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Oi, #{purchase.user.name}")
      expect(mail.body.encoded).to match("Sua compra ainda está em processo de avaliação do pagamento. Assim que ela for confirmada, você receberá outro email com os dados da coleta, entre outras informações. Fique ligado na sua caixa de correio!")
    end
  end

  describe ".confirmed_payment" do
    let!(:purchase) { Purchase.make!(status: PurchaseStatus::PAID) }
    let!(:mail) { PurchaseMailer.confirmed_payment(purchase) }

    it "renders the headers" do
      expect(mail.subject).to eq("Compra confirmada")
      expect(mail.to).to eq([purchase.user.email])
      expect(mail.from).to eq(["confirmacao@triboviva.com.br"])
    end
  end
end
