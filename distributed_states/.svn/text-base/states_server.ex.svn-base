defmodule States.Server do
  use GenServer.Behaviour # <callout id="co.otp.use"/>
  require VidStore
  
  def start_link(videos) do # <callout id="co.otp.start_link"/>
    :gen_server.start_link({ :local, :video_store }, __MODULE__, videos, [])
  end

  def init(videos) do # <callout id="co.otp.init"/>
    { :ok, videos }
  end

  def handle_call({action, item}, _from, videos) do # <callout id="co.otp.call"/>
    video = videos[item]
    new_video = apply VidStore, action, [video]
    { :reply, new_video, Keyword.put(videos, item, new_video) }
  end

  def handle_cast({ :add, video }, videos) do # <callout id="co.otp.cast"/>
    { :noreply, [video|videos] }
  end
end