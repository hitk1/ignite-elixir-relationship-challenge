defmodule Exmeal.Meals.Create do
  alias Exmeal.{Repo, Meal, Error}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> deal_result_insert()
  end

  defp deal_result_insert({:ok, %Meal{}} = success), do: success

  defp deal_result_insert({:error, reason}) do
    {:error, Error.build(reason, :bad_request)}
  end
end
