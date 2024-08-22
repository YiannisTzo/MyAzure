# NSG details for dev spoke subscription
####################################################################################################
###################### NSG details for new dev01 spoke subscription ################################
####################################################################################################
nsg_config = {
  nsg-snet-mhra-dev01-uks-h1s01-waf = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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

  nsg-snet-mhra-dev01-uks-h1s01-presentation = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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
        destination_address_prefix = "10.16.12.0/22"
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
        source_address_prefix      = "10.16.10.0/24"
        destination_address_prefix = "10.16.12.0/22"
        description                = "Allow HTTPS inbound from WAF"
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
        source_address_prefix      = "10.16.12.0/22"
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
        source_address_prefix      = "10.16.12.0/22"
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
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS Udp outbound"
      },
      {
        name                       = "Allow_APIM_Outbound"
        priority                   = 1150
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3443"
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.16.128.0/26,10.16.16.0/22"
        description                = "Allow APIM outbound"
      },
      {
        name                       = "Allow_Redis_Outbound"
        priority                   = 1200
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "6379-6380,10221-10231,13000-13999,15000-15999"
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allow Redis Outbound"
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

  nsg-snet-mhra-dev01-uks-h1s01-app = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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
        destination_address_prefix = "10.16.16.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_Dev"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.162/32"
        destination_address_prefix = "10.5.83.16/32"
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
        destination_address_prefix = "10.16.16.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.16.16.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12,10.5.88.10,10.5.88.11"
        destination_address_prefix = "10.16.16.0/22"
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
        source_address_prefix      = "10.5.1.0/24,10.16.30.64/26,10.20.0.0/22,10.20.4.0/22,10.5.2.0/24,10.16.128.0/26,10.16.30.0/26,10.16.12.0/22,192.168.208.0/21,10.50.0.0/16,10.16.128.128/29,172.27.4.0/22,172.27.8.0/22,158.119.113.0/25,158.119.122.0/23,10.10.40.0/24,10.10.42.0/24"
        destination_address_prefix = "10.16.16.0/22"
        description                = "Allow HTTPS inbound including South Mimms - NTT-43005"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5671,5672,443,3443"
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "10.16.16.0/22"
        description                = "Allow Intra Subnet inbound"
      },
      {
        name                       = "Allow_Application_Inbound"
        priority                   = 1300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5671,5672,9350,9351,9352,9354"
        source_address_prefix      = "10.16.30.0/26,10.16.30.64/26"
        destination_address_prefix = "10.16.16.0/22"
        description                = "Allow Application Inbound "
      },
      {
        name                       = "Allow_APIM_Inbound"
        priority                   = 1350
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3443,443"
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.16.16.0/22"
        description                = ""
      },
      {
        name                       = "Allow_SQL_Inbound"
        priority                   = 1400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1443"
        source_address_prefix      = "*"
        destination_address_prefix = "10.20.4.0/22"
        description                = "Allow SQL Inbound from VDI to eCTD SQL Instance  "
      },
      {
        name                       = "Allow_Inbound_from_Azure_Storage"
        priority                   = 1450
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443,2049,111"
        source_address_prefix      = "10.16.20.137,10.16.20.157"
        destination_address_prefix = "*"
        description                = "Allow Inbound Access to from eCTD Azure Storage Account/Containers stmhradevuksrms03 stmhradevuksrms03"
      },
      {
        name                       = "Allow_SMB_Inbound_Lorenz"
        priority                   = 1500
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "10.16.20.137,10.16.20.157"
        destination_address_prefix = "*"
        description                = "Allow SMB for Lorenz Dossier Fileshare"
      },
      {
        name                       = "Allow_MHRA_Internal"
        priority                   = 1550
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.50.0.0/16"
        destination_address_prefix = "*"
        description                = "To allow MHRA internal connectivity to eCTC Web server"
      },
      {
        name                       = "DEV_UAT_RDP_To_DocuBridge"
        priority                   = 1600
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.21.0.0/24"
        destination_address_prefix = "10.16.16.0/22"
        description                = "Change Ref - NTT39183. Ports/protocols will be filtered down in a future date."
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
        source_address_prefix      = "10.16.16.0/22"
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
        source_address_prefix      = "10.16.16.0/22"
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
        source_address_prefix      = "10.16.16.0/22"
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
        source_address_prefix      = "10.16.16.0/22"
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
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "23.102.135.246,20.118.99.224,40.83.235.53"
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
        source_address_prefix      = "10.16.16.0/22"
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
        source_address_prefix      = "10.16.16.0/22"
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
        destination_port_range     = "443,3443"
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.16.16.0/22"
        description                = "Allow Intra Subnet outbound"
      },
      {
        name                       = "Allow_ConfigMgr_TCP_Outbound"
        priority                   = 1450
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "67,68,69,445,4011,8530,8531,10123"
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "10.5.9.12,10.50.1.132,158.119.116.96,10.7.22.23"
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
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy Outbound"
      },
      {
        name                       = "Allow_tcp_udp_Outbound_Storage"
        priority                   = 1550
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443,111,2049"
        source_address_prefix      = "*"
        destination_address_prefix = "10.16.20.137,10.16.20.157"
        description                = "Allow Outbound to eCTD Dossier Azure Storage Account/Container(Dirty/Cleansed) & (Final/Clean)"
      },
      {
        name                       = "Allow_SMTP_outbound_for_email_notifications"
        priority                   = 1600
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "25,587,443"
        source_address_prefix      = "10.16.0.0/16"
        destination_address_prefix = "10.2.22.31"
        description                = "Allow SMTP connections outbound from Dev for email notifications"
      },
      {
        name                       = "allow_SQL_TCP_Outbound"
        priority                   = 1650
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "*"
        destination_address_prefix = "10.16.20.13"
        description                = "Lorenz Docubridge app server to Lorenz SQL DB"
      },
      {
        name                       = "Allow_SMB_Outbound_Lorenz"
        priority                   = 1700
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "*"
        destination_address_prefix = "10.16.20.137,10.16.20.157"
        description                = "Allow_SMB_Outbound fromLorenz  to ECTD Dossier Fileshare"
      },
      {
        name                       = "Allow_MHRA_internal_outbound"
        priority                   = 1750
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "10.50.0.0/16"
        description                = "To allow MHRA internal connectivity to eCTC Web server"
      },
      {
        name                       = "Allow_Outbound_DEV_UAT_RDP_To_DocuBridge"
        priority                   = 1800
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.16.16.0/22"
        destination_address_prefix = "10.21.0.0/24"
        description                = "NTT-39183"
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

  nsg-snet-mhra-dev01-uks-h1s01-data = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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
        destination_address_prefix = "10.16.20.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_Sync_Dev_UAT"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.162/32"
        destination_address_prefix = "10.5.83.134,10.5.83.135"
        description                = ""
      },
      {
        name                       = "Allow_SolarWinds_Inbound"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.7.22.50/32"
        destination_address_prefix = "10.16.20.0/22"
        description                = ""
      },
      {
        name                       = "Allow_AppSubnet_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433,443,445,3306"
        source_address_prefix      = "10.16.16.0/22,10.16.30.0/26,10.16.30.64/26,10.16.128.0/26"
        destination_address_prefix = "10.16.20.0/22"
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
        destination_address_prefix = "10.16.20.0/22"
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
        destination_address_prefix = "10.16.20.0/22"
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
        destination_address_prefix = "10.16.20.0/22"
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
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22,10.5.1.0/24,10.5.2.0/24,10.16.30.0/26,10.16.30.64/26,10.16.128.0/26,10.18.20.135,10.16.128.128/29"
        destination_address_prefix = "10.16.20.0/22"
        description                = "Allow HTTPS inbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443,1433"
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "10.16.20.0/22"
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
        destination_address_prefix = "10.16.20.0/22"
        description                = "Allow SQL inbound"
      },
      {
        name                       = "Allow_SMB_Inbound"
        priority                   = 1400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22"
        destination_address_prefix = "10.16.20.0/22"
        description                = "Allow SMB traffic"
      },
      {
        name                       = "Alow_Inbound_Azure_storage"
        priority                   = 1450
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "111,443,2049"
        source_address_prefix      = "10.20.0.0/22,10.18.20.135"
        destination_address_prefix = "10.16.20.137,10.16.20.157"
        description                = "Allow Inbound Access to from eCTD PROD Azure Storage Account/Container to stmhradevuksla03 stmhradevuksrms03"
      },
      {
        name                       = "Allow_Inbound_SMB_Storage"
        priority                   = 1500
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "139,445"
        source_address_prefix      = "10.18.20.133"
        destination_address_prefix = "10.16.20.137,10.16.20.157"
        description                = "allow vmectd01uatuks access to Azure Storage account"
      },
      {
        name                       = "Allow_Inbound_vmectd01uatuks"
        priority                   = 1550
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "139,445"
        source_address_prefix      = "10.17.16.20"
        destination_address_prefix = "10.16.20.137"
        description                = "Allow vmectd01uatuks smb to Storage account for Lorenz"
      },
      {
        name                       = "Allow_Inbound_Documentum_via_Rest_api"
        priority                   = 1600
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8090"
        source_address_prefix      = "10.210.100.5"
        destination_address_prefix = "10.16.20.133,10.16.20.32"
        description                = "8090 needs to be opened to access Documentum via rest api from the Source"
      },
      {
        name                       = "Allow_inbound_LA_DEV_SHIR_to_Appian"
        priority                   = 1650
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "172.30.0.2"
        destination_address_prefix = "10.16.20.133,10.16.20.32"
        description                = "Allow inbound connectivity to Azure VM from Appian Test Maria DB"
      },
      {
        name                       = "Allow_Inbound_prod_eCTDvm"
        priority                   = 1700
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "553,445,11,2049,139"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.16.20.137"
        description                = "Access to eCTD Azure Storage Account/Container ( Dirty/Cleansed) fromProd VM"
      },
      {
        name                       = "Allow_PostgreSQL_TCP_Inbound"
        priority                   = 1750
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5432,6432"
        source_address_prefix      = "10.16.129.0/26"
        destination_address_prefix = "10.16.20.0/22"
        description                = "Allow PostgreSQL TCP Inbound"
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
        source_address_prefix      = "10.16.20.133,10.16.20.32"
        destination_address_prefix = "10.150.0.144,10.200.10.110,10.200.10.114,10.200.10.115,10.200.10.117,10.200.101.1,10.200.101.4,10.210.0.144,10.210.10.110,10.210.10.114,10.210.10.115,10.210.10.117,10.210.100.1,10.210.100.4,10.210.20.110,10.210.20.114,10.210.20.115,10.210.20.4,10.210.20.9,10.5.8.11"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "23.102.135.246,20.118.99.224,40.83.235.53"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
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
        destination_port_range     = "443,1433"
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
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
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy Outbound"
      },
      {
        name                       = "Allow_SQL_Outbound"
        priority                   = 1600
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "*"
        description                = "Allow SQL Outbound"
      },
      {
        name                       = "Allow_Outbound_Azure_Storage"
        priority                   = 1650
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "111,443,2049"
        source_address_prefix      = "10.16.20.137,10.16.20.157"
        destination_address_prefix = "10.18.20.135"
        description                = "Allow Outbound from Lorenz VM to eCTD Dossier Azure Storage Account in Prod stmhradevuksla03  stmhradevuksrms03"
      },
      {
        name                       = "Allow_MySQL_MariaDB_Outbound"
        priority                   = 1700
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "*"
        description                = "MySQL outbound rule for MariaDB - NTT-32115"
      },
      {
        name                       = "Allow_Outbound_vmectd01uatuks_Azure_Storage"
        priority                   = 1750
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "111,443,2049,445,139"
        source_address_prefix      = "10.16.20.137"
        destination_address_prefix = "10.17.16.20"
        description                = "allow vmectd01uatuks access to Azure Storage account"
      },
      {
        name                       = "Allow_Documentum_via_Rest_API_Outbound"
        priority                   = 1800
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8090"
        source_address_prefix      = "10.16.20.133,10.16.20.32"
        destination_address_prefix = "10.210.100.5"
        description                = "8090 needs to be opened to access Documentum via rest api from the Source"
      },
      {
        name                       = "Allow_Outbound_Vmla01devuks_to_Apian"
        priority                   = 1850
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "10.16.20.133,10.16.20.32"
        destination_address_prefix = "172.30.0.2"
        description                = "Allow outbound connectivity from Azure VM to Appian Test Maria DB   NTT36268"
      },
      {
        name                       = "Allow_outbound_eCTD_Prodvm"
        priority                   = 1900
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443,445,111,2049,139"
        source_address_prefix      = "10.16.20.137"
        destination_address_prefix = "10.18.16.25"
        description                = "Access from eCTD Azure Storage Account/Container ( Dirty/Cleansed) to Prod VM"
      },
      {
        name                       = "Allow_PostgreSQL_TCP_Outbound"
        priority                   = 1950
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5432,6432"
        source_address_prefix      = "10.16.20.0/22"
        destination_address_prefix = "10.16.129.0/26"
        description                = "Allow PostgreSQL TCP Outbound"
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
  }

  nsg-snet-mhra-dev01-uks-h1s01-lgappsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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

  nsg-snet-mhra-dev01-uks-h1s01-azfuncsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
    tags = {
    }
    security_rule = []
  },

  nsg-snet-mhra-dev01-uks-h1s01-appservicessubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
    tags = {
    }
    security_rule = []
  },
    nsg-snet-mhra-dev01-uks-h1s01-redis = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
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
        destination_port_range     = "443,6380"
        source_address_prefix      = "10.20.0.0/22,10.20.4.0/22"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "6379,6380,8443,10221-10231,13000-13999,15000-15999,20226"
        source_address_prefix      = "10.16.128.192/27"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allows Intra Subnet Inbound"
      },
      {
        name                       = "Allow_Presentation_Subnet_Inbound"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "6379,6380,8443,10221-10231,13000-13999,15000-15999"
        source_address_prefix      = "10.16.12.0/22"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allow Presentation Subnet Inbound"
      },
      {
        name                       = "Allow_ALB_TCP_Inbound"
        priority                   = 1150
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "6379,6380,8443,10221-10231,13000-13999,15000-15999,16001"
        source_address_prefix      = "AzureLoadBalancer"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allow SQL from App subnet"
      },
      {
        name                       = "Allow_ALB_UDP_Inbound"
        priority                   = 1200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "8500,16001"
        source_address_prefix      = "AzureLoadBalancer"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allow SQL from App subnet"
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
        destination_port_range     = "80,443"
        source_address_prefix      = "10.16.128.192/27"
        destination_address_prefix = "*"
        description                = "Allow HTTP HTTPS outbound"
      },
      {
        name                       = "Allow_Intra_Subnet_Outbound"
        priority                   = 1050
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8443,10221-10231,20226,13000-13999,15000-15999,6379-6380"
        source_address_prefix      = "10.16.128.192/27"
        destination_address_prefix = "10.16.128.192/27"
        description                = "Allow Intra Subnet Outbound"
      },
      {
        name                       = "Allow_DNS_TCP_Outbound"
        priority                   = 1100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.16.128.192/27"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS TCP Outbound"
      },
      {
        name                       = "Allow_DNS_UDP_Outbound"
        priority                   = 1150
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.16.128.192/27"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS UDP Outbound"
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
  }

    nsg-snet-mhra-dev01-uks-h1s01-apimsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
    tags = {
    }
    security_rule = [
      {
        name                       = "Allow_HTTPS_Inbound"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.16.10.0/24,10.16.16.0/22,10.16.128.0/26"
        destination_address_prefix = "10.16.128.128/29"
        description                = "Allow HTTPS Inbound"
      },
      {
        name                       = "Allow_APIM_TCP_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3443"
        source_address_prefix      = "ApiManagement"
        destination_address_prefix = "10.16.128.128/29"
        description                = "Allow APIM TCP Inbound"
      },
      {
        name                       = "Allow_ALB_TCP_Inbound"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "6390"
        source_address_prefix      = "AzureLoadBalancer"
        destination_address_prefix = "10.16.128.128/29"
        description                = "Allow_ALB_TCP_Inbound"
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
        destination_port_range     = "80,443"
        source_address_prefix      = "10.16.128.128/29"
        destination_address_prefix = "*"
        description                = "Allow HTTP HTTPS Outbound"
      },
      {
        name                       = "Allow_DNS_TCP_Outbound"
        priority                   = 1050
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.16.128.128/29"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS TCP Outbound"
      },
      {
        name                       = "Allow_DNS_UDP_Outbound"
        priority                   = 1100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Udp"
        source_port_range          = "*"
        destination_port_range     = "53"
        source_address_prefix      = "10.16.128.128/29"
        destination_address_prefix = "10.5.255.68,10.5.255.132,168.63.129.16"
        description                = "Allow DNS UDP Outbound"
      },
      {
        name                       = "Allow_SQL_TCP_Outbound"
        priority                   = 1150
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.16.128.128/29"
        destination_address_prefix = "*"
        description                = "Allow_SQL_TCP_Outbound"
      },
      {
        name                       = "Allow_APIM_Monitor_TCP_Outbound"
        priority                   = 1200
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1886"
        source_address_prefix      = "10.16.128.128/29"
        destination_address_prefix = "*"
        description                = "Allow_APIM_Monitor_TCP_Outbound"
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
  }
}


# NSG-Subnet association details
nsg_subnet_association_config = [{
  provider_alias              = "spoke1-sub"
  is_applicable               = true
  vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
  subnet_name                 = "snet-mhra-dev01-uks-h1s01-waf"
  network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-waf"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-presentation"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-presentation"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-app"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-app"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-data"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-data"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-lgappsubnet"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-lgappsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-azfuncsubnet"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-azfuncsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-appservicessubnet"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-appservicessubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                 = "snet-mhra-dev01-uks-h1s01-redis"
    network_security_group_name = "nsg-snet-mhra-dev01-uks-h1s01-redis"
  }
]
