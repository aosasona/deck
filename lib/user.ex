defmodule User do
  def new(first_name, last_name) do
    email = String.downcase(first_name) <> String.at(String.downcase(last_name), 0)

    %{
      first_name: first_name,
      last_name: last_name,
      email: "#{email}@wyte.space",
      created_at: Time.utc_now()
    }
  end

  def update_email(user, new_email) do
    %{user | email: new_email}
  end
end
