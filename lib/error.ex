defmodule Exmeal.Error do
  @keys [:status, :result]
  @enforce_keys @keys
  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_meal_not_found_error, do: build(1, 2)
  def build_user_not_found_error, do: build(1, 2)
end
