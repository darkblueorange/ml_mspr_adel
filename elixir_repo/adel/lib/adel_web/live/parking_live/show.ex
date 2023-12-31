defmodule AdelWeb.ParkingLive.Show do
  use AdelWeb, :live_view

  alias Adel.Parkings

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:parking, Parkings.get_parking!(id))}
  end

  defp page_title(:show), do: "Show Parking"
  defp page_title(:edit), do: "Edit Parking"
end
