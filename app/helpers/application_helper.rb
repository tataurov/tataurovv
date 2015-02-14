module ApplicationHelper

  def production?
    Rails.env == 'production'
  end

  def development?
    Rails.env == 'development'
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
