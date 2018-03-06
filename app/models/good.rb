class Good < ApplicationRecord
    belongs_to :plan, counter_cache: :good
    belongs_to :user
end
