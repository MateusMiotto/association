require 'rails_helper'

RSpec.describe "/payments", type: :request do

  let(:valid_attributes) {
    {
      "person" => Person.create!(name: "John Doe", national_id: CPF.generate),
      "amount" => 15.50,
      "paid_at" => Time.zone.today
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Payment.create! valid_attributes
      get payments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      payment = Payment.create! valid_attributes
      get payment_url(payment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_payment_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      payment = Payment.create! valid_attributes
      get edit_payment_url(payment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Payment" do
        expect {
          post payments_url, params: { payment: valid_attributes }
        }.to change(Payment, :count).by(1)
      end

      it "redirects to the created payment" do
        post payments_url, params: { payment: valid_attributes }
        expect(response).to redirect_to(payment_url(Payment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Payment" do
        expect {
          post payments_url, params: { payment: invalid_attributes }
        }.to change(Payment, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post payments_url, params: { payment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested payment" do
        payment = Payment.create! valid_attributes
        patch payment_url(payment), params: { payment: new_attributes }
        payment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the payment" do
        payment = Payment.create! valid_attributes
        patch payment_url(payment), params: { payment: new_attributes }
        payment.reload
        expect(response).to redirect_to(payment_url(payment))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        payment = Payment.create! valid_attributes
        patch payment_url(payment), params: { payment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested payment" do
      payment = Payment.create! valid_attributes
      expect {
        delete payment_url(payment)
      }.to change(Payment, :count).by(-1)
    end

    it "redirects to the payments list" do
      payment = Payment.create! valid_attributes
      delete payment_url(payment)
      expect(response).to redirect_to(payments_url)
    end
  end
end
