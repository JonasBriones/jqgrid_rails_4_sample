module EmployeesHelper
    include JqgridsHelper

  def employee_jqgrid

    options = {:on_document_ready => true, :html_tags => false}

    grid = [{
      :url => '/employees',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => [  'ID','Name', 'Mobile Number', 'Date of Join'],
      :colModel  => [
        { :name => 'id',   :index => 'id',    :width => 100,:align => 'left', :editable => true},
        { :name => 'name',   :index => 'name',    :width => 200,:align => 'left', :editable => true},
        { :name => 'contact', :index => 'mobile_no',  :width => 200 ,:align => 'left', :editable => true},
        { :name => 'date_of_join', :index => 'mobile_no',  :width => 200 ,:align => 'left', :editable => true}
      ],
      :editurl => '/employees/update',
      :pager => '#invoices_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :sortname => 'name',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'Employee List',
      :onSelectRow => "function() { alert('Row selected!');}".to_json_var
    }]


    pager = [:navGrid, "#invoices_pager", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]

    pager_button = [:navButtonAdd, "#invoices_pager", {:caption => 'Add', :onClickButton => 'function() {alert("Custom button!")}'.to_json_var }]

    jqgrid_api 'invoices_list', grid, pager, pager_button, options

  end
end
