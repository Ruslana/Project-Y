namespace :test do 
  
Rake::TestTask.new(:remote => "db:test:prepare") do |t| 
  t.libs << "test" 
  t.pattern = 'test/remote/**/*_test.rb' 
  t.verbose = true 
end 

Rake::Task['test:remote'].comment = "Test integration with remote services"
desc 'Test all unit, functional, integration, and remote tests'
  task :all do 
    errors = %w(test:units test:functionals test:integration test:remote).collect do |task| 
      begin 
        Rake::Task[task].invoke 
        nil 
      rescue => e 
        task 
      end 
    end.compact 
    abort "Errors running #{errors.to_sentence}!" if errors.any? 
  end 
  
end 
