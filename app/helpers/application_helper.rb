module ApplicationHelper
  def twitterized_type(type)
    case type
    when :alert
      "alert"
    when :error
      "alert alert-error"
    when :notice
      "alert alert-success"
    when :info
      "alert alert-info"
    else
      type.to_s
    end
  end
end
