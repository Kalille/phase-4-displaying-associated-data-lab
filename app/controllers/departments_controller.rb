class DepartmentsController < ApplicationController

    def index 
        render json: Department.all, only: [:display_name]
    end
end
