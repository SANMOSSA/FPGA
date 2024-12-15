set_global_assignment -entity "DivisorFrec" -library "lib_DivisorFrec" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "DivisorFrec" -library "lib_DivisorFrec" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "DivisorFrec" -library "lib_DivisorFrec" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_DivisorFrec" -name SPD_FILE [file join $::quartus(sip_path) "DivisorFrec.spd"]

set_global_assignment -library "lib_DivisorFrec" -name MISC_FILE [file join $::quartus(sip_path) "DivisorFrec_sim/DivisorFrec.vo"]
