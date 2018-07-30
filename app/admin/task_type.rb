ActiveAdmin.register TaskType do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :icon, :name, :sort, :opened
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column('#',:id)
  column :uniq_id
  column :icon do |model,opts|
    image_tag model.icon.url(:large)
  end
  column :name
  column :opened
  column :sort
  
  actions
end

end
