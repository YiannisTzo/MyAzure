monitor_action_group_config = {
  actgrp-mhra-uat-alert-001 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-monitoring"
    short_name          = "bgtalr001"
    enabled             = true
    tags                = {}

    arm_role_receiver = null
    # Uncomment this block and set arm_role_receiver
    # {
    #     arm-role-receiver_001 = {
    #         role_id = ""          #custom/builtin role id
    #         use_common_alert_schema = true
    #     }  
    # }

    azure_app_push_receiver = null
    # Uncomment this block and set azure_app_push_receiver
    # {
    #     azure_app_push_receiver_001 = {
    #         email_address = "test-email-address@gmail.com"
    #     }
    # }

    email_receiver = {
      email_receiver_001 = {
        email_address           = "neil.fowler@mhra.gov.uk"
        use_common_alert_schema = true
      }
    }

    sms_receiver = null
    # Uncomment this block and set sms_receiver
    # {
    #     sms_receiver_001 = {
    #         country_code = ""
    #         phone_number = ""
    #     }
    # }

    voice_receiver = null
    # Uncomment this block and set voice_receiver
    # {
    #     voice_receiver_001 = {
    #         country_code = ""
    #         phone_number = ""
    #     }
    # }
  }
}
