defmodule Exmeal.Users.Update do
  alias Ecto.UUID
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build(:bad_request, "ID invalid format")}
      {:ok, _uuid} -> update_user(params)
    end
  end

  defp update_user(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil ->
        {:error, Error.build_user_not_found_error()}

      user ->
        user
        |> User.changeset(params)
        |> Repo.update()
    end
  end
end
