defmodule VidStoreTest do
  import Should
  use ExUnit.Case

  should "update count" do
    rented_video = VidStore.renting(video)
    assert rented_video.times_rented == 1
  end
  
  should "rent video" do
    rented_video = VidStore.rent video

    assert :rented == rented_video.state
    assert 1 == Enum.count( rented_video.log )
  end

  should "handle mutiple transitions" do
    import VidStore
    vid = video |> rent |> return |> rent |> return |> rent

    assert 5 == Enum.count( vid.log )
    assert 3 == vid.times_rented
  end
  
  def video, do: Video.new title: "XMen"
  
end
