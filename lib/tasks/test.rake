require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << '.'
  t.libs << 'test'
  t.name       = 'test:units'
  t.test_files = FileList['test/unit/**/*_test.rb']
end

desc 'Run all tests'
task test: 'test:units' do
end
