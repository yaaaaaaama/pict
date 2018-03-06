class Plan < ApplicationRecord
    has_many :goods
    has_many :comments,
    dependent: :destroy

    def good_user(user_id)
        puts "planplanplanplan"
        goods.find_by(user_id: user_id)
    end
end
