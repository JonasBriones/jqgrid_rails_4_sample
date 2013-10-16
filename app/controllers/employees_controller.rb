class EmployeesController < ApplicationController

  # GET /employees
  # GET /employees.json
  def index

    @columns = ['id','name', 'contact','date_of_join']
    if params[:_search]
       @employees =   Employee.search(params[:_search],params[:searchField],params[:searchString], params[:page],params[:rows],params[:searchOper],params[:sord])
     else
       @employees = Employee.paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))
    end
    if request.xhr?
      render :json => json_for_jqgrid(@employees, @columns)
    end
  end


  def update
    if params[:oper] == 'add'
      @employee = Employee.create!({:name => params[:name],:contact => params[:contact],:date_of_join => params[:date_of_join]})
    elsif params[:oper] == 'del'
      @employee = Employee.find(params[:id])
      @employee.destroy!
    else
      @employee = Employee.find(params[:id])
      @employee.update_attributes({:name => params[:name],:contact => params[:contact],:date_of_join => params[:date_of_join]})
    end
    if request.xhr?
      render :json => @employee
    end
  end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :contact, :date_of_join)
    end
end
