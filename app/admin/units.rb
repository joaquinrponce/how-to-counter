ActiveAdmin.register Unit do
  permit_params :name, :description, :advice,:picture_url, :building, :upgrade_tree_id, :attack, :armor, :pierce_armor, :hp,  :civilization_ids => []
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
    column "Direct Counters" do |unit|
      units = []
      unit.direct_counters.each do |rel|
        return if rel == nil
        units.push(rel.counter_unit)
      end
      units
    end
    column "Direct Countered" do |unit|
      units = []
      unit.direct_countered.each do |rel|
        return if rel == nil
        units.push(rel.countered_unit)
      end
      units
    end
    column "Tactical Counters" do |unit|
      units = []
      unit.tactical_counters.each do |rel|
        return if rel == nil
        units.push(rel.counter_unit)
      end
      units
    end
    column "Tactical Countered" do |unit|
      units = []
      unit.tactical_countered.each do |rel|
        return if rel == nil
        units.push(rel.countered_unit)
      end
      units
    end
    actions
  end

  form do |f|
    inputs do
      f.input :name
      f.input :description
      f.input :advice
      f.input :picture_url
      f.input :building, :label => 'Building', :as => :select, :collection => ['Archery Range', 'Barracks', 'Monastery', 'Siege Workshop', 'Stable']
      f.input :upgrade_tree
      f.input :civilization_ids, as: :tags, collection: Civilization.all, display_name: :name
      f.input :attack
      f.input :armor
      f.input :pierce_armor
      f.input :hp
    end
    f.actions
  end

end
