# NSG details for perf spoke subscription
nsg_config = {
  nsg-snet-mhra-perf-uks-h1s01-waf = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_Azure_Mgmt_Inbound"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "65200-65535"
        source_address_prefix      = "GatewayManager"
        destination_address_prefix = "*"
        description                = "Allow Azure Communication"
      },
      {
        name                       = "Allow_ALB_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "AzureLoadBalancer"
        destination_address_prefix = "*"
        description                = "Allow ALB Inbound"
      },
      {
        name                       = "Allow_HTTPS_Inbound"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Allow HTTPS_Inbound"
      },
      {
        name                       = "Deny_Any_Inbound"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Inbound"
      }
    ]
  },

  nsg-snet-mhra-perf-uks-h1s01-presentation = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_VDI_Inbound"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22, 443, 3389"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.100.0.82,10.100.0.113"
        destination_address_prefix = "10.25.12.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_HTTPS_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.25.10.0/24"
        destination_address_prefix = "10.25.12.0/22"
        description                = "Allow HTTPS inbound from WAF"
      },
      {
        name                       = "Allow_Inbound_snet-mhra-uat-uks-h1s01-testing"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.25.40.0/24"
        destination_address_prefix = "10.25.12.0/22"
        description                = "Allow inbound traffic from the Testing Subnet 10.17.40.0/24 snet-mhra-uat-uks-h1s01-testing"
      },
      {
        name                       = "Deny_Any_Inbound"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Inbound"
      },
      {
        name                       = "Allow_HTTP_HTTPS_Outbound"
        priority                   = 1000
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80, 443"
        source_address_prefix      = "10.25.12.0/22"
        destination_address_prefix = "*"
        description                = "Allow HTTPS Outbound"
      },
      {
        name                       = "Allow_DNS_TCP_Outbound"
        priority                   = 1050
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.12.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Tcp outbound"
      },
      {
        name                       = "Allow_DNS_UDP_Outbound"
        priority                   = 1100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.12.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Udp outbound"
      },
      {
        name                       = "Deny_Any_Outbound"
        priority                   = 4096
        direction                  = "Outbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Outbound"
      }
    ]
  },

  nsg-snet-mhra-perf-uks-h1s01-app = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_VDI_Inbound"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22, 443, 3389"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.100.0.82,10.100.0.113"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_PERF"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.162"
        destination_address_prefix = "10.25.16.16"
        description                = ""
      },
      {
        name                       = "Allow_AD_TCP_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "135, 139, 445, 636, 1688, 3268, 6269, 49152-65535"
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_AD_UDP_Inbound"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "23, 137, 138"
        source_address_prefix      = "10.5.50.12,172.27.13.11,10.5.50.11,10.7.50.11,172.27.13.12,10.7.50.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_AD_TCP_UDP_Inbound"
        priority                   = 1150
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "53, 88, 464, 389"
        source_address_prefix      = "10.5.50.12,172.27.13.11,10.5.50.11,10.7.50.11,172.27.13.12,10.7.50.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_HTTPS_Inbound"
        priority                   = 1200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.5.1.0/24,10.5.2.0/24,10.25.30.0/26,10.25.30.64/26,10.25.128.0/26"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow HTTPS inbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow Intra Subnet inbound"
      },
      {
        name                       = "Allow_ServiceBus_Inbound"
        priority                   = 1300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5671, 5672, 9350, 9351, 9352, 9354"
        source_address_prefix      = "10.25.30.64/26"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow ServiceBus inbound"
      },
      {
        name                       = "Allow_inbound_SQL_from_eCTD_SQL_Instance"
        priority                   = 1400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5671, 5672"
        source_address_prefix      = "10.25.20.16/32"
        destination_address_prefix = "10.25.16.20"
        description                = "Allow inbound from eCTD SQL Instance"
      },
      {
        name                       = "Deny_Any_Inbound"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Inbound"
      },
      {
        name                       = "Allow_HTTP_HTTPS_Outbound"
        priority                   = 1050
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80, 443"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "*"
        description                = "Allow HTTPS Outbound"
      },
      {
        name                       = "Allow_AD_TCP_Outbound"
        priority                   = 1100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "135, 139, 445, 636, 1688, 3268, 6269, 49152-65535"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_AD_UDP_Outbound"
        priority                   = 1150
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "23, 123, 137, 138"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_AD_TCP_UDP_Outbound"
        priority                   = 1200
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "53, 88, 464, 389"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_KMS_TCP_Outbound"
        priority                   = 1250
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1688"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "23.102.135.246"
        description                = "Allow KMS outbound"
      },
      {
        name                       = "Allow_DNS_TCP_Outbound"
        priority                   = 1300
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Tcp outbound"
      },
      {
        name                       = "Allow_DNS_UDP_Outbound"
        priority                   = 1350
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Udp outbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Outbound"
        priority                   = 1400
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.25.16.0/22"
        description                = "Allow Intra Subnet outbound"
      },
      {
        name                       = "Allow_ConfigMgr_TCP_Outbound"
        priority                   = 1450
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445, 8530, 8531, 10123"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.5.24,10.7.22.23"
        description                = "Allow Config Manager Outbound"
      },
      {
        name                       = "Allow_Proxy_TCP_Outbound"
        priority                   = 1500
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3128"
        source_address_prefix      = "10.25.16.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy Outbound"
      },
      {
        name                       = "Deny_Any_Outbound"
        priority                   = 4096
        direction                  = "Outbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Outbound"
      }
    ]
  },

  nsg-snet-mhra-perf-uks-h1s01-data = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_VDI_Inbound"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22,443,3389"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.100.0.82,10.100.0.113"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_PERF"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.162"
        destination_address_prefix = "10.25.20.134,10.25.20.135"
        description                = ""
      },
      {
        name                       = "Allow_AppSubnet_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.25.16.0/22,10.25.30.64/26"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow SQL from App subnet"
      },
      {
        name                       = "Allow_AD_TCP_Inbound"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "135, 139, 445, 636, 1688, 3268, 6269, 49152-65535"
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_AD_UDP_Inbound"
        priority                   = 1150
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "23, 137, 138"
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_AD_TCP_UDP_Inbound"
        priority                   = 1200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "53, 88, 464, 389"
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_HTTPS_Inbound"
        priority                   = 1250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.5.1.0/24,10.5.2.0/24,10.25.30.0/26,10.25.30.64/26,10.25.128.0/26"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow HTTPS inbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443, 1433"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow Intra Subnet inbound"
      },
      {
        name                       = "Allow_SQL_Inbound"
        priority                   = 1350
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.5.1.0/24,10.5.2.0/24,10.100.0.82,10.100.0.113,10.5.240.0/24"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow SQL inbound"
      },
      {
        name                       = "Deny_Any_Inbound"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Inbound"
      },
      {
        name                       = "Allow_Runtime_OnPremises"
        priority                   = 1000
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22,443,445,1489,1521,1567,1570,11010,11015,11017,20064,20069,22022,22023"
        source_address_prefix      = "10.25.20.133"
        destination_address_prefix = "10.210.0.144,10.150.0.144,10.5.8.11,10.210.10.110,10.210.10.117,10.210.10.114,10.210.10.115,10.210.100.4,10.210.100.1,10.200.10.110,10.200.10.117,10.200.10.114,10.200.10.115,10.200.101.4,10.200.101.1"
        description                = "Allow access to on-premises application services from Runtime VM"
      },
      {
        name                       = "Allow_HTTP_HTTPS_Outbound"
        priority                   = 1050
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80, 443"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "*"
        description                = "Allow HTTPS Outbound"
      },
      {
        name                       = "Allow_AD_TCP_Outbound"
        priority                   = 1100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "135, 139, 445, 636, 1688, 3268, 6269, 49152-65535"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_AD_UDP_Outbound"
        priority                   = 1150
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "23,123, 137, 138"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_AD_TCP_UDP_Outbound"
        priority                   = 1200
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "53, 88, 464, 389"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        description                = "Allow AD services outbound"
      },
      {
        name                       = "Allow_KMS_TCP_Outbound"
        priority                   = 1300
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1688"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "23.102.135.246"
        description                = "Allow KMS outbound"
      },
      {
        name                       = "Allow_DNS_TCP_Outbound"
        priority                   = 1350
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Tcp outbound"
      },
      {
        name                       = "Allow_DNS_UDP_Outbound"
        priority                   = 1400
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Udp outbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Outbound"
        priority                   = 1450
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443, 1433"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.25.20.0/22"
        description                = "Allow Intra Subnet outbound"
      },
      {
        name                       = "Allow_ConfigMgr_TCP_Outbound"
        priority                   = 1500
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445, 8530, 8531, 10123"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.5.24,10.7.22.23"
        description                = "Allow Config Manager Outbound"
      },
      {
        name                       = "Allow_Proxy_TCP_Outbound"
        priority                   = 1550
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3128"
        source_address_prefix      = "10.25.20.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy Outbound"
      },
      {
        name                       = "Deny_Any_Outbound"
        priority                   = 4096
        direction                  = "Outbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Deny Any Outbound"
      }
    ]
  },

  nsg-snet-mhra-perf-uks-h1s01-lgappsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_SMB_Outbound"
        priority                   = 1000
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = ""
      }
    ]
  },

  nsg-snet-mhra-perf-uks-h1s01-azfuncsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = []
  },

  nsg-snet-mhra-perf-uks-h1s01-appservicessubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    tags = {
    }
    security_rule = []
  }
}

# NSG-Subnet association details
nsg_subnet_association_config = [{
  provider_alias              = "spoke1-sub"
  is_applicable               = true
  vnet_name                   = "vnet-mhra-perf-uks-h1s01"
  subnet_name                 = "snet-mhra-perf-uks-h1s01-waf"
  network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-waf"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-presentation"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-presentation"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-app"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-app"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-data"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-data"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-lgappsubnet"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-lgappsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-azfuncsubnet"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-azfuncsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-perf-uks-h1s01"
    subnet_name                 = "snet-mhra-perf-uks-h1s01-appservicessubnet"
    network_security_group_name = "nsg-snet-mhra-perf-uks-h1s01-appservicessubnet"
  }
]