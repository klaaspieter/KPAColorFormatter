Pod::Spec.new do |s|
  s.name         = "KPAColorFormatter"
  s.version      = "0.0.1"
  s.summary      = "Format UIColor and NSColor instances to English names"
  s.homepage     = "https://github.com/klaaspieter/KPAColorFormatter"
  s.license      = "MIT"
  s.author       = { "Klaas Pieter Annema" => "klaaspieter@annema.me" }
  s.platform     = :ios
  s.platform     = :osx
  s.source       = { git: "https://github.com/klaaspieter/KPAColorFormatter.git", :tag => "0.0.1" }
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.resources    = ["Localizations/*.lproj", "colors.json"]
  s.requires_arc = true
end
