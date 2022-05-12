require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

namespace :test do
  desc "run the test suite for 00_warmup_test.rb"
  task :warmup do
    exec "ruby -I test:lib test/00_warmup_test.rb"
  end

  desc "run the test suite for 01_dummy_test.rb"
  task :dummy do
    exec "ruby -I test:lib test/01_dummy_test.rb"
  end

  desc "run the test suite for 02_stub_test.rb"
  task :stub do
    exec "ruby -I test:lib test/02_stub_test.rb"
  end

  desc "run the test suite for 03_spy_test.rb"
  task :spy do
    exec "ruby -I test:lib test/03_spy_test.rb"
  end

  desc "run the test suite for 04_mock_test.rb"
  task :mock do
    exec "ruby -I test:lib test/04_mock_test.rb"
  end

  desc "run the test suite for 05_fake_test.rb"
  task :fake do
    exec "ruby -I test:lib test/05_fake_test.rb"
  end
end

task default: [:test]
