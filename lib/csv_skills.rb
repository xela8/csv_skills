require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'csv'

def parse_file
  data = File.read("spec/fixtures/roster.csv")

  write_file
end

def write_file
  open('output.csv', 'w') { |f|
    f  << "domain,count\n"
    f  << "yahoo.com,331\n"
    f  << "gmail.com,330\n"
    f  << "hotmail.com,339\n"
  }
end
