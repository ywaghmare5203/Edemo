ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :email
    column :username
    column :contact_number
    column :gender
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :firstname
  filter :lastname
  filter :email
  filter :username
  filter :contact_number
  filter :gender

  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :username
      f.input :contact_number
      f.input :gender , :as => :select, :collection => ["Male", "Female"]

    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:admin_user => [:firstname, :lastname, :contact_number, :username, :gender, :sign_in_count])
    end
  end

end
