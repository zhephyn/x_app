module ApplicationHelper
    def display_side_bars?
      !(controller_name == "tweets" && action_name == "home")
    end
end
