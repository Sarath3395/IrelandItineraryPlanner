class BasicChart
  def initialize(chart)
    @chart = chart

  end



  def draw
    return "basic chart"
  end
end

class ChartDecorator
  def initialize(real_chart)
    @real_chart = real_chart
    @features = "no feature"
  end

  # override the cost method to include the cost of the extra feature

  # override the details method to include the description of the extra feature
  def draw
    return "Chart Decorator"
  end

end

# a concrete decorator
class LineChartDecorator < ChartDecorator
  def initialize(real_chart)
    super(real_chart)
@features = "Line Chart"
  end

  # override the details method to include the description of the extra feature and its corresponding price
  def draw
    return @features+"."+@real_chart.draw
  end
end

# a concrete decorator
class ColumnChartDecorator < ChartDecorator
  def initialize(real_chart)
    super(real_chart)
@features = "Column Chart"
  end

  # override the details method to include the description of the extra feature and its corresponding price
  def draw
    return @features+"."+@real_chart.draw
  end
end