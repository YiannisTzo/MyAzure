/*
import {
  to = module.network_routes_spoke1.azurerm_route_table.route_tables["udr-snet-mhra-dev01-uks-h1s01-redis"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/routeTables/udr-snet-mhra-dev01-uks-h1s01-redis"
}

import {
  to = module.nsg_spoke1.azurerm_network_security_group.nsg_resource["nsg-snet-mhra-dev01-uks-h1s01-redis"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/networkSecurityGroups/nsg-snet-mhra-dev01-uks-h1s01-redis"
}

#nsg association snet-mhra-dev01-uks-h1s01-waf
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["0"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-waf"
}

#nsg association snet-mhra-dev01-uks-h1s01-app
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["2"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-app"
}

#nsg association snet-mhra-dev01-uks-h1s01-data
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["3"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-data"
}

#nsg association snet-mhra-dev01-uks-h1s01-presentation
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["1"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-presentation"
}

#nsg association snet-mhra-dev01-uks-h1s01-lgappsubnet
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["4"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-lgappsubnet"
}

#nsg association snet-mhra-dev01-uks-h1s01-azfuncsubnet
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["5"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-azfuncsubnet"
}

#nsg association snet-mhra-dev01-uks-h1s01-appservicessubnet
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["6"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-appservicessubnet"
}

#nsg association snet-mhra-dev01-uks-h1s01-redis
import {
  to = module.nsg_spoke1.azurerm_subnet_network_security_group_association.nsg_subnet_asssociation["7"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-redis"
}


#route table association udr-snet-mhra-dev01-uks-h1s01-data
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["0"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-data"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-app
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["1"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-app"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-presentation
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["2"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-presentation"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-waf
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["3"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-waf"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-lgappsubnet
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["4"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-lgappsubnet"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-azfuncsubnet
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["5"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-azfuncsubnet"
}

#route table association udr-snet-mhra-dev01-uks-h1s01-appservicessubnet
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["6"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-appservicessubnet"
}
}

#route table association udr-snet-mhra-dev01-uks-h1s01-redis
import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["7"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-redis"
}


import {
  to = module.nsg_spoke1.azurerm_network_security_group.nsg_resource["nsg-snet-mhra-dev01-uks-h1s01-apimsubnet"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/networkSecurityGroups/nsg-snet-mhra-dev01-uks-h1s01-apimsubnet"
}


import {
  to = module.network_routes_spoke1.azurerm_route_table.route_tables["udr-snet-mhra-dev01-uks-h1s01-apimsubnet"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/routeTables/udr-snet-mhra-dev01-uks-h1s01-apimsubnet"
}

import {
  to = module.network_routes_spoke1.azurerm_subnet_route_table_association.route_table_subnets["8"]
  id = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/virtualNetworks/vnet-mhra-dev01-uks-h1s01/subnets/snet-mhra-dev01-uks-h1s01-apimsubnet"
}
*/