defmodule Exmeal.Users.Create do
  alias Exmeal.{User, Repo, Error}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result
  defp handle_insert({:error, reason}), do: {:Error.build(:bad_request, reason)}
end
