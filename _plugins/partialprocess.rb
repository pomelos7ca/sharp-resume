module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      @site=site
      find_partials(site,site.source,File.join(site.source,'_includes'))
      # site.config['partials'] << Dir.glob("#{@dir}/**").select{ |d| File.directory?(d)}
    end

    def find_partials(site,base,dir)
      hash=Hash.new
      _dir=Dir.open(dir)
      while name=_dir.read
        next if name=="."
        next if name==".."
        #注意此处只会获取到文件/文件夹名称,仅通过名称是无法判断是否为文件夹
        #必须给绝对路径
        path="#{dir}/#{name}"
        if File.directory?(path)
          arr=Dir.glob("#{path}/**/*.html").map{ |i| File.basename(i,".html") }
          hash.store(name,arr)
        end
      end
      _dir.close
      site.config['partials']=hash
    end

  end
end