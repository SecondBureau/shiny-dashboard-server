atom_feed do |feed|
  feed.title "RunMyProcess"
  feed.updated Time.now
  Chart.new do |chart|
  feed.entry(chart) do |entry|
    entry.title "Chart #{@identifier}"
    entry.content ''
    entry.updated Time.now.strftime("%Y-%m-%dT%H:%M:%SZ")
    entry.content @urlfeed
    entry.summary @identifier
  end
end
end


