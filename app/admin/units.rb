ActiveAdmin.register Unit do
  permit_params :name, :description, :attack, :armor, :pierce_armor, :range, :accuracy, :hp
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :attack, :armor, :pierce_armor, :range, :accuracy, :hp
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :attack, :armor, :pierce_armor, :range, :accuracy, :hp]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  
  index do
    selectable_column
    id_column
    column :name
    column :attack
    column :armor
    column :pierce_armor
    column :range
    column :accuracy
    column :hp
    actions
  end

end
