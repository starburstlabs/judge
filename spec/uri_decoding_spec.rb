require 'uri'

RSpec.describe "URI::DEFAULT_PARSER.unescape parity with removed URI.decode" do
  it "decodes percent-encoded spaces" do
    expect(URI::DEFAULT_PARSER.unescape("hello%20world")).to eq "hello world"
  end

  it "decodes UTF-8 sequences" do
    expect(URI::DEFAULT_PARSER.unescape("caf%C3%A9")).to eq "café"
  end

  it "leaves plain strings unchanged" do
    expect(URI::DEFAULT_PARSER.unescape("plaintext")).to eq "plaintext"
  end

  it "treats plus literally (not as space)" do
    expect(URI::DEFAULT_PARSER.unescape("a+b")).to eq "a+b"
  end
end
