require_relative '../lib/scraper'



  describe "#testing" do

  
    it "should displays more than 2000 hashes" do
    	expect(scraper.length > 200).to eq(true)
    end
end
