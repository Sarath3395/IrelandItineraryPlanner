require 'simple_writer'
require 'numbering_writer'
class DocumentType < ApplicationController
  def type
    raise NotImplementedError, 'Ask the subclass'
  end

  def numberedlog
    numberedline = NumberingWriter.new(SimpleWriter.new('ReportedErrorsLog.txt'))
    File.open("mylog.txt",'r') do |fileb|
      while line = fileb.gets
        numberedline.write_line line
      end
    end
    numberedline.close
  end

end

class TextReport < DocumentType
  def type
    File.open("ReportedErrorsLog.txt",'w') do |filea|
      File.open("mylog.txt",'r') do |fileb|
        while line = fileb.gets
          filea.puts line
        end
      end
    end
  end
end

class NumberedTextReport < DocumentType
  def type
    numberedlog
  end
end
