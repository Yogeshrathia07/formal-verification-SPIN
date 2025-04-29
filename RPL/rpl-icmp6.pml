proctype uip_ds6_nbr_lookup(){
    printf("uip_ds6_nbr_lookup\n");
}
proctype uip_ds6_nbr_add(){
    printf("uip_ds6_nbr_add\n");
}
proctype packetbuf_addr(){
    printf("packetbuf_addr\n");
}
proctype rpl_icmp6_update_nbr_table(){
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    :: condition1=2;
    fi;
    if
    :: (condition1 == 0) ->
        run uip_ds6_nbr_lookup();
    :: (condition1 == 1) ->
        run uip_ds6_nbr_lookup();
        run uip_ds6_nbr_add();
    :: (condition1 == 2) ->
        run uip_ds6_nbr_lookup();
        run uip_ds6_nbr_add();
        run packetbuf_addr();
    fi;
}
// --------------------------------------------------
proctype rpl_process_dis(){
    printf("rpl_process_dis() \n");
}
proctype uipbuf_clear(){
    printf("uipbuf_clear() \n")
}

proctype dis_input(){
    run rpl_process_dis();
    run uipbuf_clear();
}
// --------------------------------------------------
proctype rpl_dag_update_state(){
    printf("rpl_dag_update_state() \n");
}
proctype uip_icmp6_send(){
    printf("uip_icmp6_send() \n");
}
proctype rpl_icmp6_dis_output(){
    printf("rpl_icmp6_dis_output() \n");
    run rpl_dag_update_state();
    run uip_icmp6_send();

}
// --------------------------------------------------
proctype uip_ipaddr_copy(){
    printf("uip_ipaddr_copy() \n");
}
proctype uip_is_addr_mcast(){
    printf("uip_is_addr_mcast() \n");
}
proctype dio_input(){
    printf("dio_input() \n");
    run uip_ipaddr_copy();
    run uip_is_addr_mcast();
    run uipbuf_clear();
}
// --------------------------------------------------
proctype rpl_get_leaf_only(){
    printf("rpl_get_leaf_only() \n");
}
proctype rpl_icmp6_dio_output(){
    printf("rpl_icmp6_dio_output() \n");
    run rpl_dag_update_state();
    run rpl_get_leaf_only();
    run uip_icmp6_send();
}
// --------------------------------------------------
proctype rpl_process_dao(){
    printf("rpl_process_dao() \n");
}
proctype dao_input(){
    printf("dao_input() \n");
    run uip_ipaddr_copy();
    run rpl_process_dao();
    run uipbuf_clear();

}
// --------------------------------------------------
proctype rpl_icmp6_dao_output(){
    printf("rpl_icmp6_dao_output() \n");
    run rpl_dag_update_state();
    run uip_icmp6_send();
}
// --------------------------------------------------
proctype rpl_process_dao_ack(){
    printf("rpl_process_dao_ack() \n");
}
proctype dao_ack_input(){
    printf("dao_ack_input() \n");
    int condition1;
    if
    :: condition1=0;
    :: condition1=1;
    fi;
    if
    :: (condition1 == 0) ->
        run rpl_process_dao_ack();
    :: (condition1 == 1) ->
        printf("rpl_process_dao_ack() : Not executed\n");
    fi;
    run uipbuf_clear();
}
// --------------------------------------------------
proctype rpl_icmp6_dao_ack_output(){
    printf("rpl_icmp6_dao_ack_output() \n");
}
// --------------------------------------------------
proctype uip_icmp6_register_input_handler(){
    printf("uip_icmp6_register_input_handler() \n");
}
proctype rpl_icmp6_init(){
    printf("rpl_icmp6_init() \n");
    run uip_icmp6_register_input_handler();
}
init{
    // run rpl_icmp6_update_nbr_table();
    // run dis_input();
    // run rpl_icmp6_dis_output();
    // run dio_input();
    // run rpl_icmp6_dio_output();
    // run dao_input();
    // run rpl_icmp6_dao_output();
    // run dao_ack_input();
    // run rpl_icmp6_dao_ack_output();
    // run rpl_icmp6_init();
    run rpl_icmp6_init();
}