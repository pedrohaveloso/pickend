defmodule Pickend.Financial do
  alias Pickend.Repo
  alias Pickend.Financial.{Transfer}

  def create_transfer(params \\ %{}) do
    %Transfer{}
    |> Transfer.changeset(params)
    |> Repo.insert()
  end
end
