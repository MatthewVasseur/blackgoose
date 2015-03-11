namespace :update do
  desc "Update the online status of each escort"
  task online: :environment do
    Bulk.all.each do |bulk|
      if bulk.total_cost >= CRITCAL_MASS[bulk.manu]
        puts "Bulk##{bulk.id} -- #{bulk.manu} -- YES"
      else
        puts "Bulk##{bulk.id} -- #{bulk.manu} -- NO"
      end
    end
  end


end
