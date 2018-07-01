defmodule Covvest2.Repo.Migrations.CreateOperators do
  use Ecto.Migration

  def change do
    create table(:operators) do
      add :name, :string
      add :tagline, :string
      add :join_date, :date
      add :email, :string
      add :token_sale, :integer
      add :pic_name, :string
      add :pic_role, :string
      add :pic_description, :string
      add :phone_number, :string
      add :address, :string
      add :company_reg_id, :string
      add :nrc, :string
      add :picture, :string
      add :description, :string
      add :number_asset, :integer
      add :total_profit_shared, :integer
      add :total_asset_value, :integer
      add :extra_string, :string

      timestamps()
    end

  end
end
