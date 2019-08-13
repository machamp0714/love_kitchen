# frozen_string_literal: true

module ApplicationHelper
    def custom_title(title)
        base_title = "LoveKitchen"
        if title.empty?
            base_title
        else
            title
        end
    end
end
