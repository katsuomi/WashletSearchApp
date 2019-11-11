FactoryBot.define do
  factory :map do
    address { "名称未設定" }
    latitude { 35.157948219808546 }
    longitude { 136.97206483823697 }
    trait :invalid do
      address { nil }
    end
  end

  factory :house, class: Map do
    address { "青木の家" }
    latitude { 35.938913410 }
    longitude { 136.3308130 }
  end

  factory :school, class: Map do
    address { "名古屋大学" }
    latitude { 35.8473691 }
    longitude { 136.52241261 }
  end

end