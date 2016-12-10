module ApplicationHelper
  def log(message)
    logger.debug %{ \n #{message} \n }.colorize(:color => :black, :background => :light_white )
  end
end
