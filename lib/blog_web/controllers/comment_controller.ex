defmodule BlogWeb.CommentController do
  use BlogWeb, :controller

  alias Blog.Comments.Comment
  alias Blog.Comments

  def create(conn, %{"comment" => comments_params}) do
    case Comments.create_comment(comments_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: ~p"/posts/#{comment.post_id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
