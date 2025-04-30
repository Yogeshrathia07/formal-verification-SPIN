proctype uip_acc32(){
    printf("uip_acc32\n");
}
proctype uip_add32(){
    printf("uip_add32\n");
    run uip_acc32();
}
// ------------------------------------------------------
proctype chksum(){
    printf("chksum\n");
}
// ------------------------------------------------------
// proctype uip_htons(){
//     printf("uip_htons\n");
// Defined below
// }
proctype uip_chksum(){
    printf("uip_chksum\n");
    run uip_htons();
}
// ------------------------------------------------------
proctype uip_ipchksum(){
    printf("uip_ipchksum\n");
    run chksum();
}
// ------------------------------------------------------
proctype uipbuf_get_len_field(){
    printf("uipbuf_get_len_field\n");
}
proctype upper_layer_chksum(){
    printf("upper_layer_chksum\n");
    run uipbuf_get_len_field();
    run chksum();
}
// ------------------------------------------------------
proctype uip_icmp6chksum(){
    printf("uip_icmp6chksum\n");
    run upper_layer_chksum();
}
// ------------------------------------------------------
proctype uip_tcpchksum(){
    printf("uip_tcpchksum\n");
    run upper_layer_chksum();
}
// ------------------------------------------------------
proctype uip_udpchksum(){
    printf("uip_udpchksum\n");
    run upper_layer_chksum();
}
// ------------------------------------------------------
proctype uipbuf_init(){
    printf("uipbuf_init\n");
}
proctype uip_ds6_init(){
    printf("uip_ds6_init\n");
}
proctype uip_icmp6_init(){
    printf("uip_icmp6_init\n");
    run uip_icmp6chksum();
}
proctype uip_nd6_init(){
    printf("uip_nd6_init\n");
}
proctype uip_init(){
    printf("uip_init\n");
    run uipbuf_init();
    run uip_ds6_init();
    run uip_icmp6_init();
    run uip_nd6_init();
}
// ------------------------------------------------------
proctype uip_ipaddr_copy(){
    printf("uip_ipaddr_copy\n");
}
proctype uip_connect(){
    printf("uip_connect\n");
    run uip_ipaddr_copy();
}
// ------------------------------------------------------
proctype uipbuf_clear(){
    printf("uipbuf_clear\n");
}
proctype uipbuf_add_ext_hdr(){
    printf("uipbuf_add_ext_hdr\n");
}
proctype uipbuf_set_len_field(){
    printf("uipbuf_set_len_field\n");
}
proctype uip_remove_ext_hdr(){
    printf("uip_remove_ext_hdr\n");
    int condition1;
    if 
    ::  condition1=0;
    ::  condition1=1;
    ::  condition1=2;
    fi
    if
    :: condition1==0 -> {
        run uipbuf_clear();
    }
    :: condition1==1 -> {
        run uipbuf_clear();
        run uipbuf_add_ext_hdr();
        run uipbuf_set_len_field();
    }
    ::condition1==2 -> {
        printf("uipbuf_clear , uipbuf_add_ext_hdr , uipbuf_set_len_field : not executed\n");
    }
    fi;
}
//------------------------------------------------------
proctype uip_udp_new(){
    printf("uip_udp_new\n");
    int condition1;
    if
    ::  condition1=0;
    ::  condition1=1;
    fi;
    if
    :: condition1==0 -> {
        run uip_ipaddr_copy();
    }
    :: condition1==1 -> {
        printf("uip_ipaddr_copy : not executed\n");
    }
    fi;
}
// ------------------------------------------------------
proctype uip_unlisten(){
    printf("uip_unlisten\n");
}
// ------------------------------------------------------
proctype uip_listen(){
    printf("uip_listen\n");
}
// ------------------------------------------------------
proctype uip_ipaddr_cmp(){
    printf("uip_ipaddr_cmp\n");
}
proctype etimer_stop(){
    printf("etimer_stop\n");
}

proctype uip_reass(){
    printf("uip_reass\n");
    run uip_ipaddr_cmp();
    int condition1;
    if
    ::  condition1=0;
    ::  condition1=1;
    fi;
    if
    :: condition1==0 -> {
        run etimer_stop();
        run uipbuf_set_len_field();
    }
    :: condition1==1 -> {
        printf("etimer_stop , uipbuf_set_len_field : not executed\n");
    }
    fi;
}
// ------------------------------------------------------
proctype uip_icmp6_error_output(){
    printf("uip_icmp6_error_output\n");
}
proctype uip_reass_over(){
    printf("uip_reass_over\n");
    run etimer_stop();
    if
    ::{
        run uipbuf_clear();
        run uip_icmp6_error_output();
    }
    ::{
        printf("uipbuf_clear , uip_icmp6_error_output : not executed\n");
    }
    fi;
}
// ------------------------------------------------------
proctype uip_add_rcv_nxt(){
    printf("uip_add_rcv_nxt\n");
}
// ------------------------------------------------------
proctype ext_hdr_options_process(){
    printf("ext_hdr_options_process\n");
    if
    ::{
        run uip_icmp6_error_output();
    }
    ::{
        printf("uip_icmp6_error_output : not executed\n");
    }
    fi;
}
// ------------------------------------------------------
proctype process_tcp_options(){
    printf("process_tcp_options\n");
}
// ------------------------------------------------------
proctype UIP_STAT(){
    printf("UIP_STAT\n");
}
proctype uip_check_mtu(){
    printf("uip_check_mtu\n");
    run uip_ipaddr_cmp();
    if
    ::{
        run uip_icmp6_error_output();
        run UIP_STAT();
    }
    ::{
        printf("uip_icmp6_error_output , UIP_STAT : not executed\n");
    }
    fi;
}
// ------------------------------------------------------
proctype uip_update_ttl(){
    printf("uip_update_ttl\n");
    run uip_ipaddr_cmp();
    if 
    ::{
        run uip_icmp6_error_output();
        run UIP_STAT();
    }
    ::{
        printf("uip_icmp6_error_output , UIP_STAT : not executed\n");
    }
    fi
}
// ------------------------------------------------------
proctype uip_process(){
    printf("uip_process\n");
}
// ------------------------------------------------------
proctype UIP_HTONS(){
    printf("UIP_HTONS\n");
}
proctype uip_htons(){
    printf("uip_htons\n");
    run UIP_HTONS();
}
proctype uip_send(){
    printf("uip_send\n");
}
init{
    // run uip_add32();
    // run uip_init();
    // run uip_remove_ext_hdr();
    // run uip_reass();
    // run uip_reass_over();
    run ext_hdr_options_process();
}