atom_feed do |feed|
  feed.title "RunMyProcess"
  feed.updated Time.now
  Chart.all.each do |chart|
  feed.entry(chart) do |entry|
    entry.title chart.title
    entry.content ''
    entry.updated chart.updated_at
    entry.url chart.url
  end
end
end