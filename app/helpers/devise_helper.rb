module DeviseHelper
    def devise_error_messages!
        return "" if resource.errors.empty?

        html = ""
        messages = resource.errors.full_messages.each do |msg|
            html += <<-EOF
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">close</span>
                </button>
                #{msg}
            </div>
            EOF
        end
        html.html_safe
    end

    def devise_error_messages?
        resource.errors.empty? ? false : true
    end
end