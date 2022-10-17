module EventsHelper
  def check_level level 
    case level
    when 1
      return "#84E1BC";
    when 2
      return "#FCE96A";
    when 3
      return "#E3A008";      
    else
      return "#E02424"; 
    end

  end
end
