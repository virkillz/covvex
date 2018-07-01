defmodule Covvest2.Projects.Asset do
  use Ecto.Schema
  import Ecto.Changeset


  schema "assets" do
    field :address, :string
    field :blockchain_id, :string
    field :description, :string
    field :features, :string
    field :fundraised, :integer
    field :fundraising_end_date, :date
    field :fundraising_start_date, :date
    field :fundraising_target, :integer
    field :name, :string
    field :picture, :string
    field :property_values, :integer
    field :remaining_token, :integer
    field :renting_start_date, :date
    field :status, :string
    field :tagline, :string
    field :token_supply, :integer
    field :operator_id, :id

    timestamps()
  end

  @doc false
  def changeset(asset, attrs) do
    asset
    |> cast(attrs, [:name, :blockchain_id, :tagline, :address, :remaining_token, :token_supply, :features, :property_values, :status, :fundraising_target, :fundraised, :fundraising_start_date, :fundraising_end_date, :renting_start_date, :description, :picture])
    |> validate_required([:name, :blockchain_id, :tagline, :address, :remaining_token, :token_supply, :features, :property_values, :status, :fundraising_target, :fundraised, :fundraising_start_date, :fundraising_end_date, :renting_start_date, :description, :picture])
  end
end
