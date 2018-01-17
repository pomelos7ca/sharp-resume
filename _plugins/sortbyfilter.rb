module Jekyll
  module SortByFilter
    # 依据属性对partials数据重排
    def sort_by_prop(input,property=nil)
      @site=@context.registers[:site]
      @partials=@site.config['partials']
      @info=@site.data["info"]
      if !@info.empty? and !property.nil? and !property.empty?
        # 注意使用sort_by!覆盖 原数组才会改变
        input.sort_by!{ |s| @info[s][property] }
      else
        input.sort
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::SortByFilter)