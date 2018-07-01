defmodule Covvest2Web.PageController do
  use Covvest2Web, :controller

  alias Covvest2.Projects
  alias Covvest2.Projects.Operators

  def index(conn, _params) do
    render conn, "index.html"
  end

  def projectdetail(conn, _params) do
    render conn, "projectdetail.html"
  end 

  def usershow(conn, _params) do
    render conn, "usershow.html"
  end 


  def projectindex(conn, _params) do
    projects = Projects.list_assets()    
    render conn, "projectlist.html", projects: projects
  end 



  def operatorlist(conn, _params) do
    operators = Projects.list_operators()
    render conn, "operatorlist.html", operators: operators
  end

  def operatorshow(conn, %{"id" => id}) do
        operator = Projects.get_operator!(id)
        render conn, "operatordetail.html", operator: operator
  end 

  def purchase(conn, _params) do
        render conn, "purchase.html"
  end

  def purchasereport(conn, _params) do
        render conn, "purchasereport.html"
  end


    def projectshow(conn, %{"id" => id}) do
        project = Projects.get_asset!(id)
        render conn, "projectdetail.html", project: project
  end 
end
