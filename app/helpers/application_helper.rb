module ApplicationHelper
  include Pagy::Frontend
  
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
    datetime.strftime("%Y-%m-%d %H:%M")
  end

  def format_date datetime
    datetime.strftime("%Y-%m-%d")
  end


  def clock datetime
    datetime.strftime("%Y-%m-%d %H:%M:%S")
  end

  def is_admin current_user
    return user_signed_in? && current_user.role == 'admin'
  end

  def is_user current_user
    return user_signed_in? && current_user.role == 'user'
  end

  def active_menu path 
    if request.path == path 
      return 'border-l-indigo-500 bg-gray-50 text-gray-800'
    else
      return 'text-gray-600';
    end

  end
end
