class ReportErrorResultGenerator < ApplicationController

  attr_accessor :document_type

  def initialize document_type
  @document_type = document_type
  end

  def reporting
    puts "#{document_type.type}"
  end

end
