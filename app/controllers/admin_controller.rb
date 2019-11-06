class AdminController < ApplicationController

  def adminhome



    if params[:commit] == 'Generate'
      charttype = params[:chart][:charttype]
      if(charttype == "userlinechart")
      @userlinechartindicator = true
      elsif(charttype == "hotellinechart")
        @hotellinechartindicator = true
      end
    else
      puts "elseeeeeeeeeeeeeeeee"
    end



  end
end
