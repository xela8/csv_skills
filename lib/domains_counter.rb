require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)


class DomainsCounter
  def parse_csv(file, column_num)
    domain_counts = Hash.new(0)
    File.open(file).each do |line|
      domain_counts[extract_domain(extract_cell(line, column_num))] += 1
    end

    write_file(domain_counts)
  end

  def write_file(domain_counts)
    open('output.csv', 'w') { |f|
      f << "domain,count\n"
      f << domain_counts.map{|domain, count| "#{domain},#{count}"}.join("\n")
    }
  end

  def extract_domain(email)
    email.split('@').last
  end

  def extract_cell(line, col_num)
    line.split(',')[col_num]
  end
end
