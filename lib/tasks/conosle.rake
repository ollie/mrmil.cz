desc 'Start the console'
task :c do
  require 'pry'
  verbose false do
    sh "pry -r ./app"
  end
end
