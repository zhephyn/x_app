module ApplicationHelper
    def display_side_bars?
      !(controller_name == "tweets" && action_name == "home")
      !(controller_name == "sessions" && action_name == "new")
    end
end
