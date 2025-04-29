proctype uip_sr_get_node(){
    printf("uip_sr_get_node\n");
}
proctype uip_ipaddr_copy(){
    printf("uip_ipaddr_copy\n");
}
proctype uip_create_linklocal_prefix(){
    printf("uip_create_linklocal_prefix\n");
}
proctype rpl_ext_header_srh_get_next_hop(){
    printf("rpl_ext_header_srh_get_next_hop\n");
    run uip_sr_get_node();
    int condition1;
    if
    ::condition1=0;
    ::condition1=1;
    fi;
    if
    :: condition1==1->{
        run uip_ipaddr_copy();
        run uip_create_linklocal_prefix();
    }
    else->{
        printf("uip_ipadder_copy and uip_create_linklocal_prefix : not executed\n");
    }
    fi;
}
// -------------------------------------------------------
proctype rpl_ext_header_srh_update(){
    printf("rpl_ext_header_srh_update\n");
    int condition1;
    if
    ::condition1=0;
    ::condition1=1;
    fi;
    if
    :: condition1==1->
    {
        run uip_ipaddr_copy();
    }
    ::else->
    {
        printf("uip_ipaddr_copy : not executed\n");
    }
    fi;
    
}
proctype count_matching_bytes(){
    printf("count_matching_bytes\n");
}
// -------------------------------------------------------
proctype uipbuf_add_ext_hdr(){
    printf("uipbuf_add_ext_hdr\n");
}
proctype uipbuf_set_len_field(){
    printf("uipbuf_set_len_field\n");
}
proctype insert_srh_header(){
    printf("insert_srh_header\n");
    run uip_ipaddr_copy();
    run uipbuf_add_ext_hdr();
    run uipbuf_set_len_field();
}
// -------------------------------------------------------
proctype rpl_process_hbh(){
    printf("rpl_process_hbh\n");
}
proctype rpl_ext_header_hbh_update(){
    printf("rpl_ext_header_hbh_update\n");
    run rpl_process_hbh();
}
// -------------------------------------------------------
proctype update_hbh_header(){
    printf("update_hbh_header\n");
}
// -------------------------------------------------------
proctype insert_hbh_header(){
    printf("insert_hbh_header\n");
    run uipbuf_add_ext_hdr();
    run uipbuf_set_len_field();
    run update_hbh_header();
}
// -------------------------------------------------------
proctype uipbuf_get_next_header(){
    printf("uipbuf_get_next_header\n");
}
proctype rpl_ext_header_remove(){
    printf("rpl_ext_header_remove\n");
    run uipbuf_get_next_header();
    int condition1;
    if
    ::condition1=0;
    ::condition1=1;
    fi;
    if
    :: condition1==1->
    {
        run uipbuf_set_len_field();
    }
    ::else->
    {
        run uipbuf_get_next_header();
    }
    fi;
}
proctype rpl_dag_root_is_root(){
    printf("rpl_dag_root_is_root\n");
    int condition1,condition2;
    if
    ::condition1=0;
    ::condition1=1;
    fi;
    if
    ::condition2=0;
    ::condition2=1;
    fi;
    if
    :: condition1==1->
    {
        run rpl_ext_header_remove();
    }
    ::else->
    {
        printf("rpl_ext_header_remove : not executed\n");
        if
        :: condition2==1->
        {
            run insert_hbh_header();
        }
        ::else->
        {
            run update_hbh_header();
        }
        fi;
    }
    fi;
}
// -------------------------------------------------------
init{
    // run rpl_ext_header_srh_get_next_hop();
    // run rpl_ext_header_srh_update();
    // run count_matching_bytes();
    // run insert_srh_header();
    // run rpl_ext_header_hbh_update();
    // run update_hbh_header();
    // run insert_hbh_header();
    // run rpl_dag_root_is_root();
    run rpl_ext_header_remove();
}