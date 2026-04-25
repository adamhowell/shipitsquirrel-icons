RSpec.describe Shipitsquirrel::Icons::Feather do
  describe "#initialize" do
    it "sets the icon name as string when passed as string" do
      icon = described_class.new("user")
      expect(icon.instance_variable_get(:@icon)).to eq("user")
    end

    it "sets the icon name as string when passed as symbol" do
      icon = described_class.new(:user)
      expect(icon.instance_variable_get(:@icon)).to eq("user")
    end
  end

  describe "#svg_path" do
    it "finds the icon" do
      expect(described_class.new("user").svg_path).not_to be_nil
    end

    it "does not include the svg wrapper html element" do
      expect(described_class.new("user").svg_path).not_to match(/<svg/)
    end

    it "raises error if icon is undefined" do
      expect { described_class.new("fooicon").svg_path }
        .to raise_error("Couldn't find icon for fooicon")
    end
  end

  describe "HTML attributes" do
    it "passes any html attribute through to the wrapping <svg>" do
      icon = described_class.new("user", class: "custom-class")
      expect(icon.options[:class]).to eq("custom-class")
    end
  end

  describe "fill and stroke defaults" do
    let(:icon) { described_class.new("user") }

    it "sets fill to none"           do expect(icon.options[:fill]).to eq("none") end
    it "sets stroke to currentColor" do expect(icon.options[:stroke]).to eq("currentColor") end
    it "sets viewBox to 0 0 24 24"   do expect(icon.options[:viewBox]).to eq("0 0 24 24") end
    it "defaults width and height to 24" do
      expect(icon.options[:width]).to eq(24)
      expect(icon.options[:height]).to eq(24)
    end
    it "defaults stroke-width to 2" do
      expect(icon.options[:"stroke-width"]).to eq(2)
    end
    it "sets stroke-linecap and stroke-linejoin to round" do
      expect(icon.options[:"stroke-linecap"]).to eq("round")
      expect(icon.options[:"stroke-linejoin"]).to eq("round")
    end
  end

  describe "size override" do
    it "respects size:" do
      icon = described_class.new("user", size: 20)
      expect(icon.options[:width]).to eq(20)
      expect(icon.options[:height]).to eq(20)
    end
  end

  describe "stroke_width override" do
    it "respects stroke_width:" do
      icon = described_class.new("user", stroke_width: 1)
      expect(icon.options[:"stroke-width"]).to eq(1)
    end
  end

  describe "accessibility" do
    it "sets aria-hidden=true when no aria-label is given" do
      icon = described_class.new("user")
      expect(icon.options[:"aria-hidden"]).to eq("true")
    end

    it "sets role=img when aria-label is given (kebab form)" do
      icon = described_class.new("user", "aria-label": "icon")
      expect(icon.options.key?(:"aria-hidden")).to be_falsy
      expect(icon.options[:role]).to eq("img")
    end

    it "sets role=img when aria-label is given (nested form)" do
      icon = described_class.new("user", aria: { label: "icon" })
      expect(icon.options.key?(:"aria-hidden")).to be_falsy
      expect(icon.options[:role]).to eq("img")
    end
  end
end
