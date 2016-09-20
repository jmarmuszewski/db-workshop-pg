# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1s', :first_in => 0 do |job|
  Dir.entries('/data').select {|f| !File.directory? f}.each do |action|
    @values = []
    @fname="/data/#{action}"
    begin
      File.readlines(@fname)[-20..-1].map{|s| s.to_i}.each_with_index do |item, index|
        @values << {x: index, y: item}
      end
      send_event(action, points: @values)
    rescue
      puts "Failed for #{action}"
    end
  end
end
