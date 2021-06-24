class BasicAssetFileLoader
  def self.named(filename)
    File.open("app/assets/#{filename}", "rb") do |file|
      file.read
    end
  end
end

InlineSvg.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.asset_file = InlineSvg::CachedAssetFile.new(
      paths: Rails.root.join('app', 'assets', 'images')
    )
  else
    config.asset_file = BasicAssetFileLoader
  end

  config.svg_not_found_css_class = 'svg-icon-not-found'
end
