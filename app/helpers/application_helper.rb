module ApplicationHelper
  def display_flash_message
    display_message(:alert)||display_message(:notice)
  end

  def display_message(type)
    if flash[type] 
      content_tag :div, class: type do
        content_tag :p do
          flash[type]
        end 
      end 
    end 
  end
end
