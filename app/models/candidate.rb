class Candidate < ActiveRecord::Base
  validates :name, presence: true
  has_many :logs
  
  # 必須是candidate類別
  def display_name
    "#{name}(#{party})"
  end
  
  def vote
    self.votes = self.votes + 1
    save
    #increment(:votes) 比較沒那麼直覺
  end
end