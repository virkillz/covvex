defmodule Covvest2Web.AssetControllerTest do
  use Covvest2Web.ConnCase

  alias Covvest2.Projects

  @create_attrs %{address: "some address", blockchain_id: "some blockchain_id", description: "some description", features: "some features", fundraised: 42, fundraising_end_date: ~D[2010-04-17], fundraising_start_date: ~D[2010-04-17], fundraising_target: 42, name: "some name", picture: "some picture", property_values: 42, remaining_token: 42, renting_start_date: ~D[2010-04-17], status: "some status", tagline: "some tagline", token_supply: 42}
  @update_attrs %{address: "some updated address", blockchain_id: "some updated blockchain_id", description: "some updated description", features: "some updated features", fundraised: 43, fundraising_end_date: ~D[2011-05-18], fundraising_start_date: ~D[2011-05-18], fundraising_target: 43, name: "some updated name", picture: "some updated picture", property_values: 43, remaining_token: 43, renting_start_date: ~D[2011-05-18], status: "some updated status", tagline: "some updated tagline", token_supply: 43}
  @invalid_attrs %{address: nil, blockchain_id: nil, description: nil, features: nil, fundraised: nil, fundraising_end_date: nil, fundraising_start_date: nil, fundraising_target: nil, name: nil, picture: nil, property_values: nil, remaining_token: nil, renting_start_date: nil, status: nil, tagline: nil, token_supply: nil}

  def fixture(:asset) do
    {:ok, asset} = Projects.create_asset(@create_attrs)
    asset
  end

  describe "index" do
    test "lists all assets", %{conn: conn} do
      conn = get conn, asset_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Assets"
    end
  end

  describe "new asset" do
    test "renders form", %{conn: conn} do
      conn = get conn, asset_path(conn, :new)
      assert html_response(conn, 200) =~ "New Asset"
    end
  end

  describe "create asset" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, asset_path(conn, :create), asset: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == asset_path(conn, :show, id)

      conn = get conn, asset_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Asset"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, asset_path(conn, :create), asset: @invalid_attrs
      assert html_response(conn, 200) =~ "New Asset"
    end
  end

  describe "edit asset" do
    setup [:create_asset]

    test "renders form for editing chosen asset", %{conn: conn, asset: asset} do
      conn = get conn, asset_path(conn, :edit, asset)
      assert html_response(conn, 200) =~ "Edit Asset"
    end
  end

  describe "update asset" do
    setup [:create_asset]

    test "redirects when data is valid", %{conn: conn, asset: asset} do
      conn = put conn, asset_path(conn, :update, asset), asset: @update_attrs
      assert redirected_to(conn) == asset_path(conn, :show, asset)

      conn = get conn, asset_path(conn, :show, asset)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, asset: asset} do
      conn = put conn, asset_path(conn, :update, asset), asset: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Asset"
    end
  end

  describe "delete asset" do
    setup [:create_asset]

    test "deletes chosen asset", %{conn: conn, asset: asset} do
      conn = delete conn, asset_path(conn, :delete, asset)
      assert redirected_to(conn) == asset_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, asset_path(conn, :show, asset)
      end
    end
  end

  defp create_asset(_) do
    asset = fixture(:asset)
    {:ok, asset: asset}
  end
end
