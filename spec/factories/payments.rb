FactoryBot.define do
  factory :payment do
    person { nil }
    amount { 1.6 }
    paid_at { "2024-04-18" }
  end
end
