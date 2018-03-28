class SearchController < ApplicationController

def index
   if params[:query].present?
     school = School.search(params[:query])
   else
     @school = School.all.order("name")
   end
 end

end