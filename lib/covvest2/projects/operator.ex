defmodule Covvest2.Projects.Operator do
  use Ecto.Schema
  import Ecto.Changeset


  schema "operators" do
    field :address, :string
    field :company_reg_id, :string
    field :description, :string
    field :email, :string
    field :extra_string, :string
    field :join_date, :date
    field :name, :string
    field :nrc, :string
    field :number_asset, :integer
    field :phone_number, :string
    field :pic_description, :string
    field :pic_name, :string
    field :pic_role, :string
    field :picture, :string
    field :tagline, :string
    field :token_sale, :integer
    field :total_asset_value, :integer
    field :total_profit_shared, :integer

    timestamps()
  end

  @doc false
  def changeset(operator, attrs) do
    operator
    |> cast(attrs, [:name, :tagline, :join_date, :email, :token_sale, :pic_name, :pic_role, :pic_description, :phone_number, :address, :company_reg_id, :nrc, :picture, :description, :number_asset, :total_profit_shared, :total_asset_value, :extra_string])
    |> validate_required([:name, :tagline, :join_date, :email, :token_sale, :pic_name, :pic_role, :pic_description, :phone_number, :address, :company_reg_id, :nrc, :picture, :description, :number_asset, :total_profit_shared, :total_asset_value, :extra_string])
  end
end
