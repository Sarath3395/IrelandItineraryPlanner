class AdminController < ApplicationController

  def adminhome



    if params[:commit] == 'Generate'
      charttype = params[:chart][:charttype]
      if(charttype == "linechart")
      @linechartindicator = true
      end
    else
      puts "elseeeeeeeeeeeeeeeee"
    end



  end
end
