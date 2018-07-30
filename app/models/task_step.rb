class TaskStep < ActiveRecord::Base
  validates :content, :_type, presence: true
  belongs_to :task
  
  TYPEs = [['图文说明', 0], ['提交文本',1],['提交图片',2]]
end
