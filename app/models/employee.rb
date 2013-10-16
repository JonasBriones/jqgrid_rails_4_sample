class Employee < ActiveRecord::Base

  def self.search(_search,searchField, searchString,page,rows,searchOper,sord)
    if searchOper == 'cn' && _search # contains
      wildcard_search = "%#{searchString}%" 
      where("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows)
    elsif searchOper == 'nc' && _search # does not contain
      wildcard_search = "%#{searchString}%" 
      where.not("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows)
    elsif searchOper == 'bw' && _search # begin with
      wildcard_search = "#{searchString}%"
      where("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows)    
    elsif searchOper == 'bn' && _search # does not begin with
      wildcard_search = "#{searchString}%"
      where.not("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows)    
    elsif searchOper == 'en' && _search # does not end with
      wildcard_search = "%#{searchString}"
      where.not("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows) 
    elsif searchOper == 'ew' && _search # ends with
      wildcard_search = "%#{searchString}"
      where("#{searchField} LIKE :search", search: wildcard_search).page(page).per_page(rows)
    elsif searchOper == 'eq' && _search # equal
     where("#{searchField} = :search", search: searchString).page(page).per_page(rows)  
    elsif searchOper == 'ne' && _search # not equal
      where.not("#{searchField} = :search", search: searchString).page(page).per_page(rows)
    elsif searchOper == 'in' && _search # is in 
      # where("#{searchField} = :search", search: searchString).page(page).per_page(rows)      
    elsif searchOper == 'ni' && _search # is in 
      # where("#{searchField} = :search", search: searchString).page(page).per_page(rows)  
    elsif searchOper == 'lt' && _search # less 
      where("#{searchField} < :search", search: searchString).page(page).per_page(rows)  
    elsif searchOper == 'le' && _search # less or equal
      where("#{searchField} <= :search", search: searchString).page(page).per_page(rows)
    elsif searchOper == 'gt' && _search # greater
      where("#{searchField} > :search", search: searchString).page(page).per_page(rows) 
    elsif searchOper == 'ge' && _search # greater or equal 
      where("#{searchField} >= :search", search: searchString).page(page).per_page(rows)
    else
      wildcard_search = "%#{searchString}%" # contains
      where("name LIKE :search", search: wildcard_search).page(page).per_page(rows)    
    end
  end
  
end
