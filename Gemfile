source 'https://rubygems.org'

gem "jekyll", "~> 4.3" # installed by `gem jekyll`
# gem "webrick"        # required when using Ruby >= 3 and Jekyll <= 4.2.2

# gem "just-the-docs", "0.4.0.rc3" # currently the latest pre-release
# BUGBUG below is fix for dup external links https://github.com/just-the-docs/just-the-docs/issues/1062
#gem "just-the-docs", path: "/jtd"
gem "just-the-docs", :git => "https://github.com/diablodale/just-the-docs", :branch => "dp-release"

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  #gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-relative-links", "~> 0.6.1"
  gem "jekyll-link-attributes", github: "twinsunllc/jekyll-link-attributes", ref: "6669401e43f8f5b5ebf5b1660613f216ebf118a0"
  gem "nokogiri", ">= 1.18.9" # required for jekyll-link-attributes yet its gemspec does not specify it, and https://github.com/diablodale/dp.docs/security/dependabot/25
  gem "jekyll-redirect-from", "~> 0.16.0"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
