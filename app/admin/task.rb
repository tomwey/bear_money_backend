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

end
