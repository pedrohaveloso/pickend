defmodule Pickend.Accounts do
  alias Pickend.TestBinaryId
  alias Pickend.Repo
  alias Pickend.Accounts.{User, Session}

  def get_user(id: id) do
    Repo.get(User, id)
  end

  def get_user(email: email) do
    Repo.get_by(User, email: email)
  end

  def get_user(document: document) do
    Repo.get_by(User, document: document)
  end

  def create_user(params \\ %{}) do
    params = Map.put(params, "password", password_hashing(params["password"]))

    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def update_user_money(id, money, :add) do
    user = get_user(id: id)

    Ecto.Changeset.change(user, money: user.money + money)
    |> Repo.update()
  end

  def update_user_money(id, money, :remove) do
    user = get_user(id: id)

    Ecto.Changeset.change(user, money: user.money - money)
    |> Repo.update()
  end

  defp password_hashing(password) do
    Argon2.hash_pwd_salt(password)
  end

  def get_session(id: id) do
    Repo.get(Session, id)
  end

  def create_session(params \\ %{}) do
    %Session{}
    |> Session.changeset(params)
    |> Repo.insert()
  end

  def update_session_active(id, active?) do
    with true <- TestBinaryId.valid?(id),
         session <- get_session(id: id),
         changeset <- Ecto.Changeset.change(session, active?: active?),
         {:ok, struct} <- Repo.update(changeset) do
      {:ok, struct}
    else
      _ ->
        {:error}
    end
  end
end
