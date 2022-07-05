defmodule Exmeal.Meals.Delete do
  alias Ecto.UUID
  alias Exmeal.{Repo, Error, Meal}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build(:bad_request, "ID invalid")}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
