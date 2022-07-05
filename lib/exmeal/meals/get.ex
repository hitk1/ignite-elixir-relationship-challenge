defmodule Exmeal.Meals.Get do
  alias Ecto.UUID
  alias Exmeal.{Meal, Error, Repo}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build(:bad_request, "ID invalid")}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end
end
