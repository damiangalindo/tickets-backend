ActiveAdmin.register Ticket do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :user_id, :subject, :message, :state

  form do |f|
    f.inputs do
      f.input :user
      f.input :subject
      f.input :message
      f.input :state, as: :select, collection: ['open', 'closed']
    end
    actions
  end

end
