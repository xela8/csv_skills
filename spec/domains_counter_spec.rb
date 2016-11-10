require 'spec_helper'
require 'domains_counter'
require 'csv'

describe DomainsCounter do

  let(:domains_counter) { DomainsCounter.new }

  it "generates a count of the domains used in email addresses" do
    domains_counter.parse_file

    expect(CSV.read("output.csv")).to eq([
      ["domain", "count"],
      ["yahoo.com", "331"],
      ["gmail.com", "330"],
      ["hotmail.com", "339"],
    ])
  end
end
