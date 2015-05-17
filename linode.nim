import httpclient
import tables

const BASE_URL = "https://api.linode.com/api/"

type Client = tuple[url: string, api_key: string]

proc request(client: Client, params:Table[string, string]) =
  var body: string
  let http_method = "GET"

proc action(client: Client, action: string, params:Table[string, string]) =
  var params = params
  params.add("api_key", client.api_key)
  params.add("api_action", action)
  client.request(params)
