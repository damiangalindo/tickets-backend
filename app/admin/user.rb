ActiveAdmin.register User do
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

  permit_params :email, :first_name, :last_name, :username, :password, :password_confirmation, :user_type

  index do
    id_column
    column :email
    column :first_name
    column :last_name
    column :username
    column :user_type
    column :authentication_token
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :password
      f.input :password_confirmation
      f.input :user_type, as: :select, collection: ['agent', 'customer']
    end
    actions
  end
end
