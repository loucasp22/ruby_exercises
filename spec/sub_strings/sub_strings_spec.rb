require_relative '../../lib/sub_strings/sub_strings'

describe SubStrings do
	subject { SubStrings }

	describe "#substrings" do
    let( :dictionary) { ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] }

		context "when input is one word" do
			it "returns a hash listing each substring that was found in the original string" do
				string = "below"
				expect(subject.substrings(string,dictionary)).to eq({"below" => 1, "low" => 1})
			end
		end

    context "when input is multiple words" do
      it "handles it" do
        string = "Howdy partner, sit down! How's it going?"
        expect(subject.substrings(string,dictionary)).to eq({ "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 })
      end
    end
  end
end