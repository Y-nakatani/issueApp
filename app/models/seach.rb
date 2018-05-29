class Seach < ActiveRecord::Base
#enum gender: { unknown: 0, male: 1, female: 2, other: 9 }

# キーワードによる絞り込み
scope :get_by_keyword, ->(keyword) {
where(keyword:, keyword)
}
# カテゴリーによる絞り込み
scope :get_by_category, ->(category) {
where(category: category)
}
end
