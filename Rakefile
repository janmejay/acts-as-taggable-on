GEMSPEC = 'acts-as-taggable-on.gemspec'

rule '.gemspec' => '.gemspec.source' do |t|
  constants = {'RUBY_FILES' => Dir['**/*.rb']}
  File.open t.name, 'w' do |target|
    target.print <<END
# This file is generated! Don't modify it by hand!
# Instead, edit the .gemspec.source file, and run:
#   rake gemspec
# Or just run
#   rake gem
# to build the gemspec and the gem together.
END
    target.puts; target.puts
    constants.each_pair do |k,v|
      target.puts "#{k} = #{v.inspect}"
    end
    File.open t.source do |source|
      while (line = source.gets)
        target.puts line
      end
    end
  end
end

task :gemspec => GEMSPEC

# Note: WILL rebuild gem, even if gemspec is unchanged.

task :gem => :gemspec do
  require 'rubygems'
  Gem::Builder.new(eval(File.read(GEMSPEC))).build
end