require_relative '../lib/scraper_valdoise'


describe "the dark_trader function" do
  it "should return client, and client is not nil" do
    expect(perform).not_to be_nil
  end

  it "should displays more than 2000 hashes" do
  expect(perform.length > 200).to eq(true)
end
end
