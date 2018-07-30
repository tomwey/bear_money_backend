class Task < ActiveRecord::Base
  validates :title, :body, :money, :_money, :task_type_id, :total_count, :expired_at, presence: true
  
  has_many :task_steps, dependent: :destroy
  accepts_nested_attributes_for :task_steps, allow_destroy: true, reject_if: proc { |o| o[:_type].blank? or o[:content].blank? }
  
  before_create :generate_uniq_id
  def generate_uniq_id
    begin
      n = rand(10)
      if n == 0
        n = 8
      end
      self.uniq_id = (n.to_s + SecureRandom.random_number.to_s[2..8]).to_i
    end while self.class.exists?(:uniq_id => uniq_id)
  end
  
  def _money=(val)
    if val.present?
      self.money = (val.to_f * 100.0).to_i
    end
  end
  
  def _money
    if self.money
      (self.money / 100.0)
    end
  end
end
