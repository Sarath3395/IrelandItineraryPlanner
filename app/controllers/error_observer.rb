class ErrorObserver
  def initialize
    @observers=[]
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def update(sug, uid)
    tmp = ReportError.find_by_id(uid.id)
      tmp.assignstatus = "Successfully Added to User_id#{uid.user_id}"
      tmp.save
      puts "This error #{sug} is assigned to this user_id#{uid.user_id}."
  end
end

