###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
#


###
# Compass
###

## Change Compass configuration
#compass_config do |config|
#  config.add_import_path "bower_components/foundation-sites/scss/"
#  config.output_style = :compact
#
#  # Set this to the root of your project when deployed:
#  config.http_path = "/"
#  config.css_dir = "stylesheets"
#  config.sass_dir = "stylesheets"
#  config.images_dir = "images"
#  config.javascripts_dir = "javascripts"
#end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, :livereload_css_target => 'stylesheets/app.css'
end

# Activate sprockets
# activate :sprockets
# Add bower's directory to sprockets asset path
#after_configuration do
#  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
#  sprockets.append_path File.join "#{root}", @bower_config["directory"]
#end

# Use the correct vendor prefixes for foundation
#activate :autoprefixer do |config|
#  config.browsers = ['last 2 versions', 'ie >= 9', 'and_chr >= 2.3']
#end

#set :css_dir, 'stylesheets'
#set :js_dir, 'javascripts'
#set :images_dir, 'images'

#ignore "bower_components/*"
#
#ignore "javascripts/app.js"
#
#ignore "javascripts/script.js"
#
#ignore /stylesheets\/(?!main).*\.scss/

activate :external_pipeline,
         name: :webpack,
         command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
         source: ".tmp/dist",
         latency: 1

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :gzip
  ## Append a hash to asset urls (make sure to use the url helpers)
  #activate :asset_hash
  #activate :asset_host, :host => '//YOURDOMAIN.cloudfront.net'
end

#activate :deploy do |deploy|
#  deploy.build_before = true
#  deploy.deploy_method = :rsync
#  deploy.host   = "cedar"
#  deploy.path   = "~/apps/xyt"
#  deploy.flags  = "-avz --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r"
#end