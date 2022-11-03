class Comment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post, foreign_key: "post_id"
end
