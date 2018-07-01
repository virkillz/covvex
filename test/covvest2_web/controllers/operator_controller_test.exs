defmodule Covvest2Web.OperatorControllerTest do
  use Covvest2Web.ConnCase

  alias Covvest2.Projects

  @create_attrs %{address: "some address", company_reg_id: "some company_reg_id", description: "some description", email: "some email", extra_string: "some extra_string", join_date: ~D[2010-04-17], name: "some name", nrc: "some nrc", number_asset: 42, phone_number: "some phone_number", pic_description: "some pic_description", pic_name: "some pic_name", pic_role: "some pic_role", picture: "some picture", tagline: "some tagline", token_sale: 42, total_asset_value: 42, total_profit_shared: 42}
  @update_attrs %{address: "some updated address", company_reg_id: "some updated company_reg_id", description: "some updated description", email: "some updated email", extra_string: "some updated extra_string", join_date: ~D[2011-05-18], name: "some updated name", nrc: "some updated nrc", number_asset: 43, phone_number: "some updated phone_number", pic_description: "some updated pic_description", pic_name: "some updated pic_name", pic_role: "some updated pic_role", picture: "some updated picture", tagline: "some updated tagline", token_sale: 43, total_asset_value: 43, total_profit_shared: 43}
  @invalid_attrs %{address: nil, company_reg_id: nil, description: nil, email: nil, extra_string: nil, join_date: nil, name: nil, nrc: nil, number_asset: nil, phone_number: nil, pic_description: nil, pic_name: nil, pic_role: nil, picture: nil, tagline: nil, token_sale: nil, total_asset_value: nil, total_profit_shared: nil}

  def fixture(:operator) do
    {:ok, operator} = Projects.create_operator(@create_attrs)
    operator
  end

  describe "index" do
    test "lists all operators", %{conn: conn} do
      conn = get conn, operator_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Operators"
    end
  end

  describe "new operator" do
    test "renders form", %{conn: conn} do
      conn = get conn, operator_path(conn, :new)
      assert html_response(conn, 200) =~ "New Operator"
    end
  end

  describe "create operator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, operator_path(conn, :create), operator: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == operator_path(conn, :show, id)

      conn = get conn, operator_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Operator"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, operator_path(conn, :create), operator: @invalid_attrs
      assert html_response(conn, 200) =~ "New Operator"
    end
  end

  describe "edit operator" do
    setup [:create_operator]

    test "renders form for editing chosen operator", %{conn: conn, operator: operator} do
      conn = get conn, operator_path(conn, :edit, operator)
      assert html_response(conn, 200) =~ "Edit Operator"
    end
  end

  describe "update operator" do
    setup [:create_operator]

    test "redirects when data is valid", %{conn: conn, operator: operator} do
      conn = put conn, operator_path(conn, :update, operator), operator: @update_attrs
      assert redirected_to(conn) == operator_path(conn, :show, operator)

      conn = get conn, operator_path(conn, :show, operator)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, operator: operator} do
      conn = put conn, operator_path(conn, :update, operator), operator: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Operator"
    end
  end

  describe "delete operator" do
    setup [:create_operator]

    test "deletes chosen operator", %{conn: conn, operator: operator} do
      conn = delete conn, operator_path(conn, :delete, operator)
      assert redirected_to(conn) == operator_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, operator_path(conn, :show, operator)
      end
    end
  end

  defp create_operator(_) do
    operator = fixture(:operator)
    {:ok, operator: operator}
  end
end
