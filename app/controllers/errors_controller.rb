class ErrorsController < ApplicationController
    def sin_grupo
    end
    def not_found
        render status: 404
    end
    def server_error
        render status: 500
    end
    def unacceptable 
        render status: 422
    end
end