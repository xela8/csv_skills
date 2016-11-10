require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'csv'

class DomainsCounter
  def parse_file
    domains_count = Hash.new(0)
    File.open("spec/fixtures/roster.csv").each do |line|
      domains_count[line.split(',')[1].split('@')[1]] += 1
    end

    write_file(domains_count)
  end

  def write_file(domains_count)
    open('output.csv', 'w') { |f|
      f << "domain,count\n"
      f << domains_count.map{|domain, count| "#{domain},#{count}"}.join("\n")

    }
  end
end
