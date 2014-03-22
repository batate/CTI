defmodule VidStore do 
  use StateMachine

  state :available, [ 
     rent: [ to: :rented,      calls: [ &VidStore.renting/1 ]]]

  state :rented, [
     return: [ to: :available, calls: [ &VidStore.returning/1 ]], 
     lose:   [ to: :lost,      calls: [ &VidStore.losing/1 ]]]
    
  state :lost, []
  
  
  def renting(video) do # <callout id="co.vidstore.business"/>
    rented_video = log video, "Renting #{video.title}"
    result = rented_video.update times_rented: (video.times_rented + 1)
    result
  end

  def returning(video), do: log( video, "Returning #{video.title}" )

  def losing(video), do: log( video, "Losing #{video.title}" )

  def log(video, message) do
    video.update log: [message|video.log]
  end
end