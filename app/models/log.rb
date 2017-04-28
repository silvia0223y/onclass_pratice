class Log < ApplicationRecord
  #從log反查詢
  belongs_to :candidate, counter_cache: true
end
