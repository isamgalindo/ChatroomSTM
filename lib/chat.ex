defmodule Chat do

  def start_chat(n) do
    :mnesia.create_schema([node()])
    :mnesia.start()

    :mnesia.create_table(:users, [
      attributes: [:user_id, :active],
      type: :set
    ])

    :mnesia.create_table(:messages, [
      attributes: [:timestamp, :user_id, :message],
      type: :ordered_set
    ])

    Enum.each(1..n, fn user_id ->
      add_user(user_id)
    end)
  end

  def add_user(user_id) do
    :mnesia.transaction(fn ->
      :mnesia.write({:users, user_id, true})
    end)

    IO.puts("User #{user_id} added to the chat.")
  end

  def user_delete(user_id) do
    :mnesia.transaction(fn ->
      :mnesia.delete({:users, user_id})
    end)

    IO.puts("User #{user_id} removed from the chat.")
  end


  def write_message(user_id, message) do
    timestamp = :erlang.system_time(:millisecond)

    :mnesia.transaction(fn ->
      case :mnesia.read({:users, user_id}) do
        [{:users, ^user_id, true}] ->
          :mnesia.write({:messages, timestamp, user_id, message})
          IO.puts("Message from user #{user_id}: #{message}")
        _ ->
          :error
      end
    end)
  end

  def fetch_all_messages do
    :mnesia.transaction(fn ->
      :mnesia.match_object({:messages, :_, :_, :_})
    end)
  end
end
