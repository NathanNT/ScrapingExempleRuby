require_relative '../lib/scraper'



  describe "#testing" do

    it "Give me the key thank to the value" do
      expect(testing(0)).to eq("Bitcoin"=>"$8583.13"}')
    end

    it "Give me the key thank to the value" do
      expect(testing(1)).to eq("Ethereum"=>"$191.71")
    end
    it "should displays more than 2000 hashes" do
    	expect(scraper.length > 200).to eq(true)
    end

    end
