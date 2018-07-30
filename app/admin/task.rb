ActiveAdmin.register Task do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :body, :money, :task_type_id, :total_count, :expired_at, :sort, :opened,  
              :repeat_count, :approve_duration,:avg_approve
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.semantic_errors
  f.inputs '基本信息' do
    f.input :task_type_id, as: :select, label: '所属分类', collection: TaskType.where(opened: true).map { |t| [t.name, t.uniq_id] }, required: true
    f.input :title
    f.input :body, as: :text, input_html: { class: 'redactor' }, placeholder: '网页内容，支持图文混排', hint: '网页内容，支持图文混排'
    f.input :_money, as: :number, label: '任务报酬', placeholder: "单位为：元，例如：1.5"
    f.input :total_count, placeholder: '必须输入一个大于0的整数'
    f.input :expired_at, as: :string, placeholder: '2018-10-32 23:59'
    f.input :repeat_count
    f.input :approve_duration, placeholder: '例如：24小时'
    f.input :avg_approve, placeholder: '例如：15小时'
    f.input :sort, placeholder: '值越大显示越靠前'
    f.input :opened
  end
  actions
end

end
