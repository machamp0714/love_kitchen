class MyFailureApp < Devise::FailureApp
    def route(scope)
        :login_url
    end
end