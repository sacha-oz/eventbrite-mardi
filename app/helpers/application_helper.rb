module ApplicationHelper
	def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
    end
    
    def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
                  concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                  concat message 
                end)
        end
        nil
    end

    def authenticate_user
     unless current_user
       flash[:alert] = "Please log in."
       redirect_to new_user_session_path
     end
    end

    def authenticate_current_user
      @event = Event.find(params[:id].to_i)
      unless current_user.id == @event.user_id
    	redirect_to events_path
  	  end
    end
end
