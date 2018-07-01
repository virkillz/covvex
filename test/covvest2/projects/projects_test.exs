defmodule Covvest2.ProjectsTest do
  use Covvest2.DataCase

  alias Covvest2.Projects

  describe "operators" do
    alias Covvest2.Projects.Operator

    @valid_attrs %{address: "some address", company_reg_id: "some company_reg_id", description: "some description", email: "some email", extra_string: "some extra_string", join_date: ~D[2010-04-17], name: "some name", nrc: "some nrc", number_asset: 42, phone_number: "some phone_number", pic_description: "some pic_description", pic_name: "some pic_name", pic_role: "some pic_role", picture: "some picture", tagline: "some tagline", token_sale: 42, total_asset_value: 42, total_profit_shared: 42}
    @update_attrs %{address: "some updated address", company_reg_id: "some updated company_reg_id", description: "some updated description", email: "some updated email", extra_string: "some updated extra_string", join_date: ~D[2011-05-18], name: "some updated name", nrc: "some updated nrc", number_asset: 43, phone_number: "some updated phone_number", pic_description: "some updated pic_description", pic_name: "some updated pic_name", pic_role: "some updated pic_role", picture: "some updated picture", tagline: "some updated tagline", token_sale: 43, total_asset_value: 43, total_profit_shared: 43}
    @invalid_attrs %{address: nil, company_reg_id: nil, description: nil, email: nil, extra_string: nil, join_date: nil, name: nil, nrc: nil, number_asset: nil, phone_number: nil, pic_description: nil, pic_name: nil, pic_role: nil, picture: nil, tagline: nil, token_sale: nil, total_asset_value: nil, total_profit_shared: nil}

    def operator_fixture(attrs \\ %{}) do
      {:ok, operator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_operator()

      operator
    end

    test "list_operators/0 returns all operators" do
      operator = operator_fixture()
      assert Projects.list_operators() == [operator]
    end

    test "get_operator!/1 returns the operator with given id" do
      operator = operator_fixture()
      assert Projects.get_operator!(operator.id) == operator
    end

    test "create_operator/1 with valid data creates a operator" do
      assert {:ok, %Operator{} = operator} = Projects.create_operator(@valid_attrs)
      assert operator.address == "some address"
      assert operator.company_reg_id == "some company_reg_id"
      assert operator.description == "some description"
      assert operator.email == "some email"
      assert operator.extra_string == "some extra_string"
      assert operator.join_date == ~D[2010-04-17]
      assert operator.name == "some name"
      assert operator.nrc == "some nrc"
      assert operator.number_asset == 42
      assert operator.phone_number == "some phone_number"
      assert operator.pic_description == "some pic_description"
      assert operator.pic_name == "some pic_name"
      assert operator.pic_role == "some pic_role"
      assert operator.picture == "some picture"
      assert operator.tagline == "some tagline"
      assert operator.token_sale == 42
      assert operator.total_asset_value == 42
      assert operator.total_profit_shared == 42
    end

    test "create_operator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_operator(@invalid_attrs)
    end

    test "update_operator/2 with valid data updates the operator" do
      operator = operator_fixture()
      assert {:ok, operator} = Projects.update_operator(operator, @update_attrs)
      assert %Operator{} = operator
      assert operator.address == "some updated address"
      assert operator.company_reg_id == "some updated company_reg_id"
      assert operator.description == "some updated description"
      assert operator.email == "some updated email"
      assert operator.extra_string == "some updated extra_string"
      assert operator.join_date == ~D[2011-05-18]
      assert operator.name == "some updated name"
      assert operator.nrc == "some updated nrc"
      assert operator.number_asset == 43
      assert operator.phone_number == "some updated phone_number"
      assert operator.pic_description == "some updated pic_description"
      assert operator.pic_name == "some updated pic_name"
      assert operator.pic_role == "some updated pic_role"
      assert operator.picture == "some updated picture"
      assert operator.tagline == "some updated tagline"
      assert operator.token_sale == 43
      assert operator.total_asset_value == 43
      assert operator.total_profit_shared == 43
    end

    test "update_operator/2 with invalid data returns error changeset" do
      operator = operator_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_operator(operator, @invalid_attrs)
      assert operator == Projects.get_operator!(operator.id)
    end

    test "delete_operator/1 deletes the operator" do
      operator = operator_fixture()
      assert {:ok, %Operator{}} = Projects.delete_operator(operator)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_operator!(operator.id) end
    end

    test "change_operator/1 returns a operator changeset" do
      operator = operator_fixture()
      assert %Ecto.Changeset{} = Projects.change_operator(operator)
    end
  end

  describe "assets" do
    alias Covvest2.Projects.Asset

    @valid_attrs %{address: "some address", blockchain_id: "some blockchain_id", description: "some description", features: "some features", fundraised: 42, fundraising_end_date: ~D[2010-04-17], fundraising_start_date: ~D[2010-04-17], fundraising_target: 42, name: "some name", picture: "some picture", property_values: 42, remaining_token: 42, renting_start_date: ~D[2010-04-17], status: "some status", tagline: "some tagline", token_supply: 42}
    @update_attrs %{address: "some updated address", blockchain_id: "some updated blockchain_id", description: "some updated description", features: "some updated features", fundraised: 43, fundraising_end_date: ~D[2011-05-18], fundraising_start_date: ~D[2011-05-18], fundraising_target: 43, name: "some updated name", picture: "some updated picture", property_values: 43, remaining_token: 43, renting_start_date: ~D[2011-05-18], status: "some updated status", tagline: "some updated tagline", token_supply: 43}
    @invalid_attrs %{address: nil, blockchain_id: nil, description: nil, features: nil, fundraised: nil, fundraising_end_date: nil, fundraising_start_date: nil, fundraising_target: nil, name: nil, picture: nil, property_values: nil, remaining_token: nil, renting_start_date: nil, status: nil, tagline: nil, token_supply: nil}

    def asset_fixture(attrs \\ %{}) do
      {:ok, asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_asset()

      asset
    end

    test "list_assets/0 returns all assets" do
      asset = asset_fixture()
      assert Projects.list_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Projects.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      assert {:ok, %Asset{} = asset} = Projects.create_asset(@valid_attrs)
      assert asset.address == "some address"
      assert asset.blockchain_id == "some blockchain_id"
      assert asset.description == "some description"
      assert asset.features == "some features"
      assert asset.fundraised == 42
      assert asset.fundraising_end_date == ~D[2010-04-17]
      assert asset.fundraising_start_date == ~D[2010-04-17]
      assert asset.fundraising_target == 42
      assert asset.name == "some name"
      assert asset.picture == "some picture"
      assert asset.property_values == 42
      assert asset.remaining_token == 42
      assert asset.renting_start_date == ~D[2010-04-17]
      assert asset.status == "some status"
      assert asset.tagline == "some tagline"
      assert asset.token_supply == 42
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      assert {:ok, asset} = Projects.update_asset(asset, @update_attrs)
      assert %Asset{} = asset
      assert asset.address == "some updated address"
      assert asset.blockchain_id == "some updated blockchain_id"
      assert asset.description == "some updated description"
      assert asset.features == "some updated features"
      assert asset.fundraised == 43
      assert asset.fundraising_end_date == ~D[2011-05-18]
      assert asset.fundraising_start_date == ~D[2011-05-18]
      assert asset.fundraising_target == 43
      assert asset.name == "some updated name"
      assert asset.picture == "some updated picture"
      assert asset.property_values == 43
      assert asset.remaining_token == 43
      assert asset.renting_start_date == ~D[2011-05-18]
      assert asset.status == "some updated status"
      assert asset.tagline == "some updated tagline"
      assert asset.token_supply == 43
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_asset(asset, @invalid_attrs)
      assert asset == Projects.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Projects.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Projects.change_asset(asset)
    end
  end
end
