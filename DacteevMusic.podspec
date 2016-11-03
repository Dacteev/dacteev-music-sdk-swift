Pod::Spec.new do |s|
    s.name = "DacteevMusic"
    s.version = "0.0.1"
    s.summary = "Dacteev Music SDK"
    s.homepage = "https://github.com/Dacteev/dacteev-music-sdk-swift"
    s.license = { :type => "MIT", :file => "LICENSE.md" }
    s.authors = { "Axel Etcheverry" => "euskadi31@gmail.com" }
    s.social_media_url = "http://twitter.com/euskadi31"

    s.ios.deployment_target = "9.0"
    s.osx.deployment_target = "10.11"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"

    s.source = {
        :git => "https://github.com/Dacteev/dacteev-music-sdk-swift.git",
        :tag => "v#{s.version}"
    }

    s.source_files = "Sources/*.swift"

    s.dependency "Alamofire", "~> 4.0"
end
