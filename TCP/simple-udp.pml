proctype process_start(){
    printf("process_start\n");
}
proctype init_simple_udp(){
    printf("init_simple_udp\n");
    int condition1;
    if 
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run process_start();
    :: else->
    printf("process_start : not executed\n");
    fi;
}
// ----------------------------------------------
proctype uip_udp_packet_sendto(){
    printf("uip_udp_packet_sendto\n");
}
proctype simple_udp_send(){
    printf("simple_udp_send\n");
    int condition1;
    if
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run uip_udp_packet_sendto();
    :: else->
    printf("uip_udp_packet_sendto : not executed\n");
    fi;
}
// ----------------------------------------------
// proctype uip_udp_packet_sendto(){
//     printf("uip_udp_packet_sendto\n");
// }
proctype simple_udp_sendto(){
    printf("simple_udp_sendto\n");
    int condition1;
    if
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run uip_udp_packet_sendto();
    :: else->
    printf("uip_udp_packet_sendto() : not executed\n");
    fi;
}
// -----------------------------------------------------
proctype simple_udp_sendto_port(){
    printf("simple_udp_sendto_port\n");
    int condition1;
    if
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run uip_udp_packet_sendto();
    :: else->
        printf("uip_udp_packet_sendto() : not executed\n");
    fi;
}
// -----------------------------------------------------
proctype uip_ipaddr_copy(){
    printf("uip_ipaddr_copy\n");
}
proctype simple_udp_register(){
    printf("simple_udp_register\n");
    int condition1;
    if
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run uip_ipaddr_copy();
    :: else->
        printf("uip_ipaddr_copy() : not executed\n");
    fi;
}
// -----------------------------------------------------
proctype PROCESS_BEGIN(){
    printf("PROCESS_BEGIN\n");
}
proctype PROCESS_CONTEXT_END(){
    printf("PROCESS_CONTEXT_END\n");
}
proctype PROCESS_END(){
    printf("PROCESS_END\n");
}
proctype PROCESS_THREAD(){
    printf("PROCESS_THREAD\n");
    run PROCESS_BEGIN();
    int condition1;
    if
    ::condition1=0;
    ::condition1=1; 
    fi;
    if
    ::condition1==0 ->
        run PROCESS_CONTEXT_END();
    :: else->
        printf("PROCESS_CONTEXT_END() : not executed\n");
    fi;
    run PROCESS_END();
}
init{
    // run init_simple_udp();
    run simple_udp_send();
    run simple_udp_sendto();
    run simple_udp_register();
    run PROCESS_THREAD();
}