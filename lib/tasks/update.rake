namespace :update do
  desc "Update the online status of each escort"
  task online: :environment do
    t = Time.now # current time
    # for each escort, update status of online
    Escort.all.each do |e|
      ##
      # if there exists an online block with start time now, set online true
      # there should be at most 1
      ##
      starts = e.onlineBlocks.where(day:t.wday, start_time:t.strftime("%H:00"))
      if starts.any? and !e.online
        e.update(online:true)
        puts("#{e.username} is now ONLINE")
      end

      ##
      # same as above but with offline
      ##
      ends  = e.onlineBlocks.where(day:t.wday, end_time:t.strftime("%H:00"))
      if ends.any? and e.online
        e.update(online:false)
        puts("#{e.username} is now OFFLINE")
      end
    end

    puts("#{Escort.pluck(:id).zip(Escort.pluck(:online)).sort}")
  end
end
