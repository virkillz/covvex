defmodule Covvest2Web.OperatorController do
  use Covvest2Web, :controller

  plug :put_layout, "cust.html"

  alias Covvest2.Projects
  alias Covvest2.Projects.Operator

  def index(conn, _params) do
    operators = Projects.list_operators()
    render(conn, "index.html", operators: operators)
  end

  def new(conn, _params) do
    changeset = Projects.change_operator(%Operator{})
    render(conn, "new.html", changeset: changeset)
  end

  

  def create(conn, %{"operator" => operator_params}) do
    case Projects.create_operator(operator_params) do
      {:ok, operator} ->
        conn
        |> put_flash(:info, "Operator created successfully.")
        |> redirect(to: operator_path(conn, :show, operator))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    operator = Projects.get_operator!(id)
    render(conn, "show.html", operator: operator)
  end

  def edit(conn, %{"id" => id}) do
    operator = Projects.get_operator!(id)
    changeset = Projects.change_operator(operator)
    render(conn, "edit.html", operator: operator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "operator" => operator_params}) do
    operator = Projects.get_operator!(id)

    case Projects.update_operator(operator, operator_params) do
      {:ok, operator} ->
        conn
        |> put_flash(:info, "Operator updated successfully.")
        |> redirect(to: operator_path(conn, :show, operator))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", operator: operator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    operator = Projects.get_operator!(id)
    {:ok, _operator} = Projects.delete_operator(operator)

    conn
    |> put_flash(:info, "Operator deleted successfully.")
    |> redirect(to: operator_path(conn, :index))
  end
end
