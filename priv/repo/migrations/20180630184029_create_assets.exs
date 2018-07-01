defmodule Covvest2.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :name, :string
      add :blockchain_id, :string
      add :tagline, :string
      add :address, :string
      add :remaining_token, :integer
      add :token_supply, :integer
      add :features, :string
      add :property_values, :integer
      add :status, :string
      add :fundraising_target, :integer
      add :fundraised, :integer
      add :fundraising_start_date, :date
      add :fundraising_end_date, :date
      add :renting_start_date, :date
      add :description, :string
      add :picture, :string
      add :operator_id, references(:operators, on_delete: :nothing)

      timestamps()
    end

    create index(:assets, [:operator_id])
  end
end
