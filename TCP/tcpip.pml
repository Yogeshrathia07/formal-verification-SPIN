proctype init_appstate(){
    printf("init_appstate\n");
}
// -------------------------------------------------------
proctype uipbuf_get_attr(){
    printf("uipbuf_get_attr\n");
}
proctype netstack_process_ip_callback(){
    printf("netstack_process_ip_callback\n");
}
proctype uipbuf_clear(){
    printf("uipbuf_clear\n");
}
proctype tcpip_output(){
    printf("tcpip_output\n");
    run uipbuf_get_attr();
    run netstack_process_ip_callback();
    run uipbuf_clear();

}
// -------------------------------------------------------
proctype etimer_expired(){
    printf("etimer_expired\n");
}
proctype etimer_restart(){
    printf("etimer_restart\n");
}
proctype start_periodic_tcp_timer(){
    printf("start_periodic_tcp_timer\n");
    run etimer_expired();
    int condition1 = 1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run etimer_restart();
    :: else->
        printf("etimer_restart() : not executed\n");
    fi;
}
// ----------------------------------------
proctype check_for_tcp_syn(){
    printf("check_for_tcp_syn\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run start_periodic_tcp_timer();
    :: else->
        printf("start_periodic_tcp_timer() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_input(){
    printf("uip_input\n");
}
// proctype tcpip_ipv6_output(){
//     printf("tcpip_ipv6_output\n");
    // present in below code.
// }
proctype packet_input(){
    printf("packet_input\n");
    int condition1,condition2;
    if 
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition2=0;
    :: condition2=1;
    fi
    if
    :: condition1==0->
        run check_for_tcp_syn();
        run uip_input();
        if
        :: condition2==0->
            run tcpip_ipv6_output();
        :: else->
            printf("tcpip_ipv6_output() : not executed\n");
        fi;
    :: else->
        printf("check_for_tcp_syn() , uip_input() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_unlisten(){
    printf("uip_unlisten\n");
}
proctype tcp_unlisten(){
    printf("tcp_unlisten\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run uip_unlisten();
    :: else->
        printf("uip_unlisten() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_listen(){
    printf("uip_listen\n");
}
proctype tcp_listen(){
    printf("tcp_listen\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run uip_listen();
    :: else->
        printf("uip_listen() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype tcp_attach(){
    printf("tcp_attach\n");
    run init_appstate();
}
proctype icmp6_new(){
    printf("icmp6_new\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run init_appstate();
    :: else->
        printf("init_appstate() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype process_post_synch(){
    printf("process_post_synch\n");
}
proctype tcpip_icmp6_call(){
    printf("tcpip_icmp6_call\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: condition1==0->
        run process_post_synch();
    :: else->
        printf("process_post_synch() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype tcpip_input(){
    printf("tcpip_input\n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    run netstack_process_ip_callback();
    if
    :: condition1==0->
        run process_post_synch();
    :: else->
        printf("process_post_synch() : not executed\n");
    fi;
    run uipbuf_clear();
}
// -------------------------------------------------------
proctype uip_remove_ext_hdr(){
    printf("uip_remove_ext_hdr\n");
}
proctype output_fallback(){
    printf("output_fallback\n");
    int condition1,condition2;
    if
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition2=0;
    :: condition2=1;
    fi
    if
    :: condition1==0->
        run uip_remove_ext_hdr();
        if
        :: condition2==0->
            run tcpip_ipv6_output();
        :: else->
            printf("tcpip_ipv6_output() : not executed\n");
        fi;
    :: else->
        printf("uip_remove_ext_hdr() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_ds6_route_lookup(){
    printf("uip_ds6_route_lookup\n");
}
// -------------------------------------------------------
proctype uip_ds6_route_nexthop(){
    printf("uip_ds6_route_nexthop\n");
}
proctype uip_ds6_route_rm(){
    printf("uip_ds6_route_rm\n");
}
proctype annotate_transmission(){
    printf("annotate_transmission\n");
    run uip_ds6_route_lookup();
    int condition1,condition2
    if
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition2=0;
    :: condition2=1;
    fi
    if
    :: condition1==0->
        run uip_ds6_route_nexthop();
        if
        :: condition2==0->
            run uip_ds6_route_rm();
        :: else->
            printf("uip_ds6_route_rm() : not executed\n");
        fi;
    :: else->
        printf("uip_ds6_route_nexthop() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_packetqueue_alloc(){
    printf("uip_packetqueue_alloc\n");
}
proctype uip_packetqueue_set_buflen(){
    printf("uip_packetqueue_set_buflen\n");
}
proctype queue_packet(){
    printf("queue_packet\n");
    run uip_packetqueue_alloc();
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition1==0->
        run uip_packetqueue_set_buflen();
    :: else->
        printf("uip_packetqueue_set_buflen() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_packetqueue_buflen(){
    printf("uip_packetqueue_buflen\n");
}
proctype uip_packetqueue_free(){
    printf("uip_packetqueue_free\n");
}
proctype uip_ds6_nbr_get_ll(){
    printf("uip_ds6_nbr_get_ll\n");
}
proctype send_queued(){
    printf("send_queued\n");
    int condition1,condition2;
    if
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition2=0;
    :: condition2=1;
    fi
    if
    :: condition1==0->
        run uip_packetqueue_buflen();
        if
        :: condition2==0->
            run uip_packetqueue_buflen();
            run uip_packetqueue_free();
            run tcpip_output();
            run uip_ds6_nbr_get_ll();
        :: else->
            printf("uip_packetqueue_buflen() , uip_packetqueue_free(); , tcpip_output(); , uip_ds6_nbr_get_ll(); : not executed\n");
        fi;
    :: else->
        printf("uip_packetqueue_buflen() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_ds6_nbr_add(){
    printf("uip_ds6_nbr_add\n");
}
proctype uip_ds6_is_my_addr(){
    printf("uip_ds6_is_my_addr\n");
}
proctype uip_nd6_ns_output(){
    printf("uip_nd6_ns_output\n");
}
proctype send_nd6_ns(){
    printf("send_nd6_ns\n");
    run uip_ds6_nbr_add();
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi
    if
    :: condition1==0->
        run queue_packet();
        run uip_ds6_is_my_addr();
        run uip_nd6_ns_output();
    :: else->
        printf("queue_packet() , uip_ds6_is_my_addr() , uip_nd6_ns_output() : not executed\n");
    fi;
}
// -------------------------------------------------------
proctype uip_is_addr_unspecified(){
    printf("uip_is_addr_unspecified\n");
}
proctype uip_is_addr_mcast(){
    printf("uip_is_addr_mcast\n");
}
proctype uip_ds6_nbr_lookup(){
    printf("uip_ds6_nbr_lookup\n");
}
proctype uip_ds6_set_lladdr_from_iid(){
    printf("uip_ds6_set_lladdr_from_iid\n");
}
proctype tcpip_ipv6_output(){
    printf("tcpip_ipv6_output\n");
    run uip_is_addr_unspecified();
    if
    :: run uipbuf_clear();
    :: printf("uipbuf_clear() : not executed\n");
    fi;
    run uip_is_addr_mcast();
    run uip_ds6_is_my_addr();
    if
    :: run uip_ds6_is_my_addr();
    :: printf("uip_ds6_is_my_addr() : not executed\n");
    fi;
    run annotate_transmission();
    run uip_ds6_nbr_lookup();

    if
    :: run uip_ds6_set_lladdr_from_iid();
    :: printf("uip_ds6_set_lladdr_from_iid() : not executed\n");
    fi;

    if
    :: run send_queued();
    :: printf("send_queued() : not executed\n");
    fi;

    run uipbuf_clear();
}
// -------------------------------------------------------
proctype process_post(){
    printf("process_post\n");
}
proctype tcpip_poll_udp(){
    printf("tcpip_poll_udp\n");
    run process_post();
}
// -------------------------------------------------------
proctype tcpip_poll_tcp(){
    printf("tcpip_poll_tcp\n");
    run process_post();
}
// -------------------------------------------------------
proctype tcpip_uipcall(){
    printf("tcpip_uipcall\n");
}
// -------------------------------------------------------
proctype PROCESS_BEGIN(){
    printf("PROCESS_BEGIN\n");
}
proctype process_alloc_event(){
    printf("process_alloc_event\n");
}
proctype PROCESS_YIELD(){
    printf("PROCESS_YIELD\n");
}
proctype eventhandler(){
    printf("eventhandler\n");
}
proctype PROCESS_END(){
    printf("PROCESS_END\n");
}
proctype PROCESS_THREAD(){
    printf("PROCESS_THREAD\n");
    run PROCESS_BEGIN();
    run process_alloc_event();
    if
    :: {
        run PROCESS_YIELD();
        run eventhandler();
    }
    :: else->
        printf("PROCESS_YIELD() , eventhandler() : not executed\n");
    fi;
    run PROCESS_END();
}
init{
    // run init_appstate();
    // run tcpip_output();
    // run start_periodic_tcp_timer();
    // run check_for_tcp_syn();
    // run packet_input();
    // run tcp_unlisten();
    //run tcp_listen();
    //run tcp_attach();
    // run icmp6_new();
    // run tcpip_icmp6_call();
    // run uip_remove_ext_hdr();
    // run annotate_transmission();
    // run send_queued();
    // run send_nd6_ns();
    // run tcpip_ipv6_output();
    run PROCESS_THREAD();
}