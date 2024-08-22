# NSG details for prod spoke subscription
nsg_config = {
  nsg-snet-mhra-prod-uks-h1s01-waf = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
        description                = "Allow Azure communication"
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
        description                = "Allow HTTPS inbound"
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

  nsg-snet-mhra-prod-uks-h1s01-presentation = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
        destination_address_prefix = "10.18.12.0/22"
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
        source_address_prefix      = "10.18.10.0/24"
        destination_address_prefix = "10.18.12.0/22"
        description                = "Allow HTTPS inbound from WAF"
      },
      {
        name                       = "Temp_Allow_ICMP_PW"
        priority                   = 1100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Icmp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "192.168.214.170"
        destination_address_prefix = "10.18.12.4"
        description                = ""
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
        source_address_prefix      = "10.18.12.0/22"
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
        source_address_prefix      = "10.18.12.0/22"
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
        source_address_prefix      = "10.18.12.0/22"
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

  nsg-snet-mhra-prod-uks-h1s01-app = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
        destination_address_prefix = "10.18.16.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_Prod"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.163"
        destination_address_prefix = "10.18.16.16"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.16.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.16.0/22"
        description                = "Allow AD services inbound"
      },
      {
        name                       = "Allow_SMB_TCP_Inbound"
        priority                   = 1149
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445"
        source_address_prefix      = "172.27.4.0/22,172.27.8.0/22,158.119.113.0/25,158.119.122.0/23,10.10.40.0/24,10.10.42.0/24"
        destination_address_prefix = "10.18.16.0/22"
        description                = ""
      },
      {
        name                       = "Allow_AD_TCP_UDP_Inbound"
        priority                   = 1150
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "53, 88, 464, 389"
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.16.0/22"
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
        source_address_prefix      = "10.5.1.0/24,10.20.0.0/22,10.20.4.0/22,10.18.128.0/26,10.5.2.0/24,10.18.30.0/26,10.18.30.64/26,172.27.4.0/22,172.27.8.0/22,158.119.113.0/25,158.119.122.0/23,10.10.40.0/24,10.10.42.0/24"
        destination_address_prefix = "10.18.16.0/22"
        description                = "Allow HTTPS inbound  Including South Mimms,  as per NTT-43005"
      },
      {
        name                       = "Allow_Intra_Subnet_Inbound"
        priority                   = 1250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.18.16.0/22"
        destination_address_prefix = "10.18.16.0/22"
        description                = "Allow Intra Subnet inbound"
      },
      {
        name                       = "Allow_ServiceBus_Inbound"
        priority                   = 1300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5671, 5672"
        source_address_prefix      = "10.18.30.64/26"
        destination_address_prefix = "10.18.16.0/22"
        description                = "Allow ServiceBus inbound"
      },
      {
        name                       = "Allow_inbound_Docubridge_server"
        priority                   = 1350
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.20.4.0/22,10.50.0.0/16,192.168.208.0/21"
        destination_address_prefix = "10.18.16.25"
        description                = "DocuBridge Web Server Access Allow Web Server Access from VDI and MHRA Users"
      },
      {
        name                       = "Allow_docubridge_Client_Inbound"
        priority                   = 1400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.20.4.0/22,10.50.0.0/16,192.168.208.0/21"
        destination_address_prefix = "10.18.16.25"
        description                = "eCTD DocuBridge Client  Allow DocuBridge Client from VDI + All Internal MHRA Users"
      },
      {
        name                       = "Allow_VDI_SQL_"
        priority                   = 1450
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.20.4.0/22"
        destination_address_prefix = "10.18.20.7/32"
        description                = "Allow SQL Inbound from VDI to eCTD SQL Instance"
      },
      {
        name                       = "Allow_Inbound_eCTD_Storage_Final"
        priority                   = 1500
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "111,2049,445,139"
        source_address_prefix      = "10.18.20.12"
        destination_address_prefix = "*"
        description                = "Allow Inbound Access to from eCTD Azure Storage Account/Container ( Final/Clean) STMHRAPRODUKSRMS03"
      },
      {
        name                       = "Allow_Inbound_eCTD_SQL"
        priority                   = 1550
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.18.20.7"
        destination_address_prefix = "10.18.16.25"
        description                = "Allow inbound from eCTD SQL Instance"
      },
      {
        name                       = "Allow_Inbound_to_eCTD_Dirty_storage_DEV"
        priority                   = 1600
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "111,2049,445,139,443"
        source_address_prefix      = "10.16.20.137"
        destination_address_prefix = "10.18.16.25"
        description                = "Allow Inbound Access to from eCTD Azure Storage Account/Container ( Dirty/Cleansed) stmhradevuksla03"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
        destination_address_prefix = "10.18.16.0/22"
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
        source_address_prefix      = "10.18.16.0/22"
        destination_address_prefix = "10.5.9.12,10.50.1.132,158.119.116.96,10.7.22.23"
        description                = "Allow Config Manager outbound"
      },
      {
        name                       = "Allow_Proxy_TCP_Outbound"
        priority                   = 1500
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3128"
        source_address_prefix      = "10.18.16.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy outbound"
      },
      {
        name                       = "Allow_DataSubnet_Outbound"
        priority                   = 1550
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443,445"
        source_address_prefix      = "10.18.16.14,10.18.16.19"
        destination_address_prefix = "10.18.20.136,10.18.20.132"
        description                = "To allow Logic App Connectivity to Storage account NTT:30451"
      },
      {
        name                       = "Allow_SMTP_outbound"
        priority                   = 1600
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "25,587,443"
        source_address_prefix      = "10.18.0.0/16"
        destination_address_prefix = "10.2.22.31"
        description                = "SMTP Out for Prod Services"
      },
      {
        name                       = "Allow_otbound_eCTD_storage_Final_CLean"
        priority                   = 1650
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443,111,2049,445,139"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.18.20.12"
        description                = "Allow Outbound from Lorenz VM to eCTD Dossier Azure Storage Account/Container (Final/Clean)  stmhraproduksrms03"
      },
      {
        name                       = "AllowSQL_Instance_to_Docubridge"
        priority                   = 1700
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.18.20.7"
        description                = "Allow SQL connection outbound from Lorenz SQL Instance to Lorenz DocuBridge 10.18.20.7/32"
      },
      {
        name                       = "Allow_Outbound__smtp_Lorenz"
        priority                   = 1750
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "25"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.2.22.31"
        description                = "Allow SMTP connection outbound from Lorenz DocuBridge for email notifications"
      },
      {
        name                       = "Allow_outbound_Lorenz_to_VDI_Pool"
        priority                   = 1800
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "10.18.20.7/32"
        destination_address_prefix = "10.24.4.0/22"
        description                = "Allow outbound from Lorenz SQL Instance to VDI Pool"
      },
      {
        name                       = "Allow_Outbound_docubridge_to_VDI_Pool"
        priority                   = 1850
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.24.4.0/22"
        description                = "Allow outbound from Lorenz DocuBridge Server to VDI Pool"
      },
      {
        name                       = "Allow_outbound_Docubridge_server_all_MHRA"
        priority                   = 1900
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.24.4.0/22,10.50.0.0/16,192.168.208.0/21"
        description                = "Allow outbound from Lorenz DocuBridge Server to VDI Pool and MHRA Users 10.24.4.0/22 +Internal MHRA 10.50.0.0/16 +VPN192.168.208.0/21"
      },
      {
        name                       = "Allow_Outbound_Lorenz_to_eCTD_Storage_Dirty"
        priority                   = 1950
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443,111,2049,445,139"
        source_address_prefix      = "10.18.16.25"
        destination_address_prefix = "10.16.20.137"
        description                = "Allow Outbound from Lorenz VM to eCTD Dossier Azure Storage Account/Container (Dirty/Cleansed) stmhradevuksla03"
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

  nsg-snet-mhra-prod-uks-h1s01-data = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
        destination_address_prefix = "10.18.20.0/22"
        description                = "Allows access from on-premises VDI"
      },
      {
        name                       = "Allow_DCS_Prod"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.2.22.163"
        destination_address_prefix = "10.18.20.134,10.18.20.135"
        description                = ""
      },
      {
        name                       = "Allow_AppSubnet_Inbound"
        priority                   = 1050
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433,443,445"
        source_address_prefix      = "10.18.16.0/22,10.18.30.64/26,10.18.30.0/26"
        destination_address_prefix = "10.18.20.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.20.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.20.0/22"
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
        source_address_prefix      = "10.5.50.11,10.5.50.12,10.7.50.11,10.7.50.12,172.27.13.11,172.27.13.12"
        destination_address_prefix = "10.18.20.0/22"
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
        source_address_prefix      = "10.5.1.0/24,10.20.0.0/22,10.20.4.0/22,10.18.128.0/26,10.5.2.0/24,10.18.30.0/26,10.18.30.64/26,10.16.20.137"
        destination_address_prefix = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.18.20.0/22"
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
        destination_address_prefix = "10.18.20.0/22"
        description                = "Allow SQL inbound"
      },
      {
        name                       = "Allow_SMB_Storage_Inbound"
        priority                   = 1400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "445,139"
        source_address_prefix      = "10.16.20.137,10.16.20.157,10.20.0.0/22,10.20.4.0/22,192.168.208.0/21"
        destination_address_prefix = "*"
        description                = "Allow Azure Storage Inbound from STMHRADEVUKSLA03 STMHRADEVRMS03"
      },
      {
        name                       = "Allow_Sentinel_inbound"
        priority                   = 1450
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "8090"
        source_address_prefix      = "10.150.100.5"
        destination_address_prefix = "10.18.20.0/22"
        description                = "8090 needs to be opened to access Documentum via rest api from the Source"
      },
      {
        name                       = "Allow_MoveIT_Auto_Staging_Inbound"
        priority                   = 1500
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.5.121.4"
        destination_address_prefix = "10.18.20.135"
        description                = "Allow_MoveIT_Auto_Staging_Inbound  access to storage account in stmhraProduksla02"
      },
      {
        name                       = "Inbound_from_Appian_Pre_prod_Maria_db"
        priority                   = 1550
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "172.30.0.3,172.30.0.6,172.30.0.7"
        destination_address_prefix = "10.18.20.0/22"
        description                = "NTT-39083"
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
        destination_port_range     = "22,443,445,1521,1531,51010,51011,51015,51017"
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.210.0.144,10.150.0.144,10.150.10.110,10.150.10.117,10.150.10.114,10.150.10.115,10.150.100.4,10.150.100.1,10.5.8.11,10.2.22.163"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
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
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.18.20.0/22"
        description                = "Allow Intra Subnet outbound"
      },
      {
        name                       = "Allow_ConfigMgr_TCP_Outbound"
        priority                   = 1500
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "67,68,69,445,4011,8530,8531,10123"
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.5.9.12,10.50.1.132,158.119.116.96,10.7.22.23"
        description                = "Allow Config Manager outbound"
      },
      {
        name                       = "Allow_Proxy_TCP_Outbound"
        priority                   = 1550
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3128"
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.5.255.38,10.5.255.36,10.5.255.37"
        description                = "Allow Proxy outbound"
      },
      {
        name                       = "Allow_SMB_Outbound_Storage"
        priority                   = 1600
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "139,445"
        source_address_prefix      = "*"
        destination_address_prefix = "10.16.20.137,10.16.20.157"
        description                = "Allow SMB to Azure Storage STMHRADEVUKSLA03 STMHRADEVRMS03"
      },
      {
        name                       = "Allow_Sentinel_Outbound"
        priority                   = 1650
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "8090"
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "10.150.100.5"
        description                = "8090 needs to be opened to access Documentum via rest api from the Source"
      },
      {
        name                       = "Allow_MoveIT_Auto_Staging_OUT"
        priority                   = 1700
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.18.20.135"
        destination_address_prefix = "10.5.121.4"
        description                = "Allow_MoveIT_Auto_Staging_outbound  from storage account stmhraProduksla02"
      },
      {
        name                       = "Allow_MoveIT_Auto_Staging_OUT"
        priority                   = 1750
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "10.18.20.0/22"
        destination_address_prefix = "172.30.0.3,172.30.0.6,172.30.0.7"
        description                = "NTT-39083"
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

  nsg-snet-mhra-prod-uks-h1s01-lgappsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
    tags = {
    }
    security_rule = []
  },

  nsg-snet-mhra-prod-uks-h1s01-azfuncsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
    tags = {
    }
    security_rule = []
  },

  nsg-snet-mhra-prod-uks-h1s01-appservicessubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
    tags = {
    }
    security_rule = []
  }

nsg-snet-mhra-prod-uks-h1s01-apimsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
        source_address_prefix      = "10.18.10.0/24,10.18.16.0/22,10.18.128.0/26"
        destination_address_prefix = "10.18.128.128/29"
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
        destination_address_prefix = "10.18.128.128/29"
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
        destination_address_prefix = "10.18.128.128/29"
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
        source_address_prefix      = "10.18.128.128/29"
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
        source_address_prefix      = "10.18.128.128/29"
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
        source_address_prefix      = "10.18.128.128/29"
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
        source_address_prefix      = "10.18.128.128/29"
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
        source_address_prefix      = "10.18.128.128/29"
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
  vnet_name                   = "vnet-mhra-prod-uks-h1s01"
  subnet_name                 = "snet-mhra-prod-uks-h1s01-waf"
  network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-waf"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-presentation"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-presentation"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-app"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-app"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-data"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-data"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-lgappsubnet"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-lgappsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-azfuncsubnet"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-azfuncsubnet"
  },
  {
    provider_alias              = "spoke1-sub"
    is_applicable               = true
    vnet_name                   = "vnet-mhra-prod-uks-h1s01"
    subnet_name                 = "snet-mhra-prod-uks-h1s01-appservicessubnet"
    network_security_group_name = "nsg-snet-mhra-prod-uks-h1s01-appservicessubnet"
  }
]
