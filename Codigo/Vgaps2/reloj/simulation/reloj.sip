set_global_assignment -entity "reloj" -library "lib_reloj" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "reloj" -library "lib_reloj" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "reloj" -library "lib_reloj" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_reloj" -name SPD_FILE [file join $::quartus(sip_path) "../reloj.spd"]
set_global_assignment -library "lib_reloj" -name MISC_FILE [file join $::quartus(sip_path) "../../reloj.qsys"]

set_global_assignment -library "lib_reloj" -name MISC_FILE [file join $::quartus(sip_path) "reloj.v"]
