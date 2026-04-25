RSpec.describe Shipitsquirrel::Icons do
  it "has a version number" do
    expect(Shipitsquirrel::Icons::VERSION).not_to be nil
  end

  it "exposes the path to the bundled feather icon set" do
    expect(File.directory?(described_class.icon_path)).to be true
  end
end
