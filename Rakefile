# frozen_string_literal: true

desc "Make a pdf file"
task :pdf, %i[filepath] do |_, args|
  rouge_theme_path = Dir.glob("/usr/lib/ruby/gems/*/gems/rouge-*/lib/rouge/themes/github.rb").sort.last
  `asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-diagram -r /root/config.rb -a pdf-style=pdf-style -a pdf-stylesdir=/styles -a pdf-fontsdir="/fonts/aozoramincho-readme-ttf;/fonts/genshingothic;/fonts/RictyDiminished-master;GEM_FONTS_DIR" -r rouge -r #{rouge_theme_path} #{args.filepath}`
end

desc "Make a html file, If you want a css list, run list_css task."
task :html, %i[filepath css] do |_, args|
  args.with_defaults(css: "asciidoctor")
  `asciidoctor -r asciidoctor-diagram -a source-highlighter=highlightjs -a stylesheet=/stylesheets/#{args.css}.css #{args.filepath}`
end

desc "List css files"
task :list_css do
  puts Dir.glob("*.css", base: "/stylesheets").map {|name| name.split(".").first }.sort
end

desc "Make a slide format html file, If you want a themes list, see https://github.com/hakimel/reveal.js/#theming"
task :reveal, %i[filepath theme] do |_, args|
  args.with_defaults(theme: "white")
  `asciidoctor-revealjs -r asciidoctor-diagram -a source-highlighter=highlightjs -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.8.0 -a revealjs_theme=#{args.theme} #{args.filepath}`
end
