module TimeHelper
  def minutes_and_seconds(seconds)
    Time.at(seconds).utc.strftime("%M:%S")
  end
end
