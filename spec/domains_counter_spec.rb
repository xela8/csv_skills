require 'spec_helper'
require 'domains_counter'
require 'csv'

describe DomainsCounter do

  let(:domains_counter) { DomainsCounter.new }

  it "generates a count of the domains used in email addresses" do
    domains_counter.parse_csv("spec/fixtures/roster.csv", 1)

    expect(CSV.read("output.csv")).to eq([
      ["domain", "count"],
      ["yahoo.com", "331"],
      ["gmail.com", "330"],
      ["hotmail.com", "339"],
    ])
  end
  it ".extact_domain extracts the domain from an email" do
    expect(domains_counter.extract_domain('alex@gmail.com')).to eq('gmail.com')
  end
  it ".extract_cell from a csv row" do
    expect(domains_counter.extract_cell('a,b,c', 1)).to eq('b')
  end
end
