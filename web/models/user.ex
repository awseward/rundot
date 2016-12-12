defmodule Rundot.User do
  use Rundot.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields ~w(email password)
  @optional_fields ~w(crypted_password)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/) # FIXME: crude validation
    |> validate_length(:password, min: 6)
  end
end
