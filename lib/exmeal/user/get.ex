defmodule Exmeal.Users.Get do
  alias Ecto.UUID
  alias Exmeal.{User, Repo, Error}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> Error.build(:bad_request, "ID invalid")
      {:ok, _uuid} -> get(id)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
