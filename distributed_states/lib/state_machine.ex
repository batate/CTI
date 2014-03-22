defmodule StateMachine do
  defmacro __using__(_) do # <callout id="co.full.using"/>
    quote do
      import StateMachine
      @states []
      @before_compile StateMachine
    end
  end
  
  defmacro state(name, events) do # <callout id="co.full.state"/>
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end
  
  defmacro __before_compile__(env) do # <callout id="co.full.before_compile"/>
    states = Module.get_attribute(env.module, :states)
    events = states |> 
             Keyword.values |> 
             List.flatten |> 
             Keyword.keys |> 
             Enum.uniq
    
    quote do 
      def state_machine do # <callout id="co.full.state_machine"/>
        unquote(states)
      end
      
      unquote event_callbacks(events) # <callout id="co.full.callbacks"/>
    end
  end
  
  def event_callback(name) do # <callout id="co.full.single_callback"/>
    callback = name
    quote do
      def unquote(name)(context) do
        StateMachine.Behavior.fire(state_machine, context, unquote(callback))
      end
    end
  end
  
  def event_callbacks(names) do
    Enum.map names, &event_callback/1
  end

end