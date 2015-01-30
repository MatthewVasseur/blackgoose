ActiveAdmin.register Escort do
  permit_params :booked, :verified

  index do
    selectable_column
    id_column
    column :created_at
    column :username
    column :email
    column :token

    column :name
    column :dob
    column :line1
    column :city
    column :state
    column :zip

    column :confirmed do |b|
      b.confirmed?
    end
    column :verified

    column :height
    column :weight
    column :ethnicity
    column :tit_size
    column :tit_type
    column :eyec
    column :hairc
    column :operation_area

    column :price do |e|
      e.price / 100.00 # price is in cents
    end

    column :online
    column :booked

    column :appointments do |c|
      c.appointments.map{|a| link_to(a.client.username, admin_appointment_path(a)) }.join(" , ").html_safe
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
