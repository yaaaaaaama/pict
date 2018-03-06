class Comment < ApplicationRecord
    belongs_to :plan, counter_cache: :comment
end