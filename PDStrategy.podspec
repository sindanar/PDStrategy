
Pod::Spec.new do |s|

  s.name         = "PDStrategy"
  s.version      = “0.0.1”
  s.summary      = “Helper for implementation Strategy Pattern”

  s.description  = <<-DESC
Helper for implementation Strategy Pattern
                   DESC

  s.homepage     = "https://github.com/sindanar/PDStrategy"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "Pavel Deminov" => "pavel.d.work@gmail.com" }

  s.source       = { :git => "https://github.com/sindanar/PDStrategy", :tag => ‘v0.0.1’ }
  s.source_files  = "Classes", "Classes/**/*.swift”
  s.framework = UIKIt

end