require 'chart_decorator'
class AdminController < ApplicationController
  before_action :authenticate_user!
  def adminhome



    if params[:commit] == 'Generate'



      custchart = BasicChart.new(0)
      if params[:line_chart].to_s.length > 0 then
        custchart = LineChartDecorator.new(custchart)
      end
      if params[:column_chart].to_s.length > 0 then
        custchart = ColumnChartDecorator.new(custchart)
      end
      @final = custchart
      puts @final.draw
      puts "pppppp"

      tabletype = params[:chart][:tablename]
      puts "11111111"
      puts tabletype.to_s
      if(tabletype == "users")
      @userindicator = true
      elsif(tabletype == "hotels")
        @hotelindicator = true
      end
    else

    end



  end
end
