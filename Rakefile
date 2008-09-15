GEMSPEC = 'acts-as-taggable-on.gemspec'

rule '.gemspec' => '.gemspec.source' do |t|
  constants = {'RUBY_FILES' => Dir['**/*.rb']}
  File.open t.name, 'w' do |target|
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