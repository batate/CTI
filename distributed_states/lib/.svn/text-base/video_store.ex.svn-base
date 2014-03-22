defmodule VideoStore do
  def renting(video) do
    vid = log video, "Renting #{video.title}"
    vid.update times_rented: (video.times_rented + 1) 
  end
  
  def returning(video), do: log( video, "Returning #{video.title}" ) 

  def losing(video), do: log( video, "Losing #{video.title}" )

  def log(video, message) do
    video.update log: [message|video.log]
  end 
end