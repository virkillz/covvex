defmodule Covvest2Web.PageController do
  use Covvest2Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def projectdetail(conn, _params) do
    render conn, "projectdetail.html"
  end 

  def usershow(conn, _params) do
    render conn, "usershow.html"
  end 

  def operatorshow(conn, _params) do
    render conn, "operatordetail.html"
  end 

  def projectlist(conn, _params) do
    render conn, "projectlist.html"
  end        
end
