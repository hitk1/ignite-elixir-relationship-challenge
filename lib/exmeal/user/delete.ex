defmodule Exmeal.Users.Delete do
  alias Ecto.UUID
  alias Exmeal.{User, Repo, Error}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build("ID invalid")}
      {:ok, _uuid} -> delete(id)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
