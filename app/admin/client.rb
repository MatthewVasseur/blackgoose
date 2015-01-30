ActiveAdmin.register Client do
  permit_params :verified

  index do
    selectable_column
    id_column
    column :created_at
    column :username
    column :token
    column :name
    column :dob
    column :line1
    column :city
    column :state
    column :zip

    column :verified

    column :appointments do |c|
      c.appointments.map{|a| link_to(a.escort.username, admin_appointment_path(a)) }.join(" , ").html_safe
    end

    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
