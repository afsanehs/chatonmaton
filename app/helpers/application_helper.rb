module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def hide_footer
    current_page?(root_path) ? "d-none" : "footer-fixed"
  end

  def flash_class(level)
    case level
        when "notice"
          return "alert alert-info"
        when "success"
          return "alert alert-success"
        when "error" 
          return "alert alert-danger"
        when "warning" 
          return "alert alert-warning"
        when "alert"
          return "alert alert-danger"
    end
  end

  def get_time(time_utc)
    return time_utc.strftime("%Y-%m-%d %k:%M:%S")
  end
  def get_time_verbose(time_utc)
    return time_utc.strftime("%B %d, %Y")
  end
  def get_day_verbose(time_utc)
    return time_utc.strftime("%B %d, %Y")
  end
  def get_only_time(time_utc)
    return time_utc.strftime("%k:%M:%p")
  end
  def get_month(time)
    return time.strftime("%B").upcase
  end
  def get_day(time)
    return time.strftime("%d")
  end

  def amount_item_cart
    return ItemCart.where(cart: current_user.cart).count
  end


    #----------------------------------#
  # Using devise form in another page
  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  #---------------------------------------#
  # Image for action mailer
  def image_url(source)
    URI.join(root_url, image_path(source))
  end

end
