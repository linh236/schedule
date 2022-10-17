module ApplicationHelper
  def message_class_for(flash_type)
    {
      success: "bg-teal-100 border-teal-400 text-teal-700",
      error: "bg-red-100 border-red-400 text-red-700",
      alert: "bg-orange-100 border-orange-400 text-orange-700",
      notice: "bg-blue-100 border-blue-400 text-white-700"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def is_image type
    type.include?("image") 
  end

  def format_datetime datetime
    datetime.strftime("%Y-%m-%d")
  end
end
