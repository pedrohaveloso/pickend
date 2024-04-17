alias Pickend.Accounts

Accounts.create_user(%{
  "full_name" => "João de Freytas",
  "document" => "40312304870",
  "email" => "email@gmail.com",
  "password" => "senha",
  "money" => 1000,
  "type" => :common
})

Accounts.create_user(%{
  "full_name" => "Venda 1234",
  "document" => "12308912390",
  "email" => "venda@gmail.com",
  "password" => "senha",
  "money" => 10000,
  "type" => :merchant
})
