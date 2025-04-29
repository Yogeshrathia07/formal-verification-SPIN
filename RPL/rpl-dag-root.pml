proctype uip_sr_num_nodes() {
    printf("uip_sr_num_nodes()\n");
}

proctype rpl_dag_root_is_root() {
    printf("rpl_dag_root_is_root called\n");
    run uip_sr_num_nodes();
}

proctype rpl_dag_root_print_links() {
    printf("rpl_dag_root_print_links started\n");
    run rpl_dag_root_is_root();
}
// -------------------------------------

proctype uip_ip6addr_copy() {
    printf("uip_ip6addr_copy called\n");
}

proctype memcpy_prefix() {
    printf("memcpy_prefix()\n");
}

proctype uip_ds6_set_addr_iid() {
    printf("uip_ds6_set_addr_iid()\n");
}

proctype memcpy_iid() {
    printf("memcpy_iid()\n");
}

proctype uip_ds6_addr_add() {
    printf("uip_ds6_addr_add()\n");
}
proctype uip_ds6_default_prefix(){
    printf("uip_ds6_default_prefix()\n");
}

proctype set_global_address() {
    bool prefix_null;
    bool iid_null;

    // Non-deterministic assignment
    if
    :: prefix_null = true;
    :: prefix_null = false;
    fi;

    if
    :: iid_null = true;
    :: iid_null = false;
    fi;

    printf("set_global_address \n");
    run uip_ds6_default_prefix();

    if
    :: prefix_null ->
        run uip_ip6addr_copy();
    :: else ->
        run memcpy_prefix();
    fi;

    if
    :: iid_null ->
        run uip_ds6_set_addr_iid();
    :: else ->
        run memcpy_iid();
    fi;

    run uip_ds6_addr_add();
}

// -----------------------------------------------

// proctype set_global_address(){
//     printf("set_global_address()\n");
// }

proctype rpl_dag_root_set_prefix() {
    printf("rpl_dag_root_set_prefix()\n");
    run set_global_address();
}
// ------------------------------------------------

proctype rpl_dag_init_root(){
    printf("rpl_dag_init_root()\n");
}
proctype rpl_dag_update_state(){
    printf("rpl_dag_update_state()\n");
}

proctype rpl_dag_root_start(){
    printf("rpl_dag_root_start()\n");
    bool conditions;
    if
    :: conditions = false;
    :: conditions = true;
    fi;
    if
    :: conditions == true->
        run rpl_dag_init_root();
        run rpl_dag_update_state();
    fi;
}

// ------------------------------------------------
init {
    // run rpl_dag_root_print_links();
    // run set_global_address();
    // run rpl_dag_root_set_prefix();
    run rpl_dag_root_start();
}
