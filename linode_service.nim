import tables
import json
import linode
import linode_types

type LinodeService = tuple[client: Client]

proc list*(t: LinodeService, linode_id: int) =
  var u = initTable[string, string]()
  if linode_id > 0:
    u.add("LinodeID", $linode_id)
  let response = t.client.action("linode.list", u)
  let nodes = parseJson(response)
  echo nodes

proc create*(t: LinodeService, dataCenterId: int, planId: int, paymentTerm: int) =
  var u = initTable[string, string]()
  u.add("DatacenterID", $dataCenterId)
  u.add("PlanID", $planId)
  u.add("PaymentTerm", $paymentTerm)
  let response = t.client.action("linode.create", u)
  echo(response)
