updateico = ->
  ico = 'N/A'
  ttip = 'N/A'
  fsym = "XLM"
  tsym = localStorage['tsym'] || "USD"
  query = "https://min-api.cryptocompare.com/data/price?fsym=#{fsym}&tsyms=#{tsym}"
  
  $.getJSON query, (data) ->
    #data = data[0]
    # round down
    ico = Math.round(data[tsym] * 100) / 100
    # round down ttip
    tipstr = Number(data[tsym]).toFixed(5)
    chrome.browserAction.setTitle 'title': "1 #{fsym} = #{tipstr} #{tsym}"
    chrome.browserAction.setBadgeText 'text': '' + ico
    return
  return

setInterval updateico, 60000
updateico()
chrome.browserAction.onClicked.addListener (tab) ->
  chrome.browserAction.setBadgeText 'text': '...'
  updateico()
  return

explorer_name = localStorage['explorer_name'] || "StellarChain.io"
explorer_str = localStorage['explorer_str'] || "https://stellarchain.io/address/%s"

searchBlockChain = (e) ->
  console.log e
  q = e.selectionText
  url = explorer_str.replace("%s", q)
  chrome.tabs.create url: url
  return

chrome.contextMenus.create
  title: "#{explorer_name}"
  contexts: [ "selection" ]
  onclick: searchBlockChain
  
