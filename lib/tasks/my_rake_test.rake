desc "first rake task just for test"
task :my_test_rake => :environment do
  puts "test rake"
  puts Rails.env
  puts Employee.first.inspect

end
