proctype list_head(){
    printf("list_head\n");
}
proctype linkaddr_cmp(){
    printf("linkaddr_cmp\n");
}
proctype linkerr_cmp(){
    printf("linkerr_cmp\n");
}
proctype list_item_next(){
    printf("list_item_next\n");
}
proctype neighbor_queue_from_addr(){
    printf("neighbor_queue_from_addr\n");
    run list_head();
    int condition1;
    if
    :: condition1 = 0;
    :: condition1 = 1;
    :: condition1 = 2;
    fi;
    if
    :: condition1 == 0 -> {
        run linkaddr_cmp();
    };
    :: condition1 == 1 -> {
        run linkerr_cmp();
        run list_item_next()
    }
    :: condition1 == 2 -> printf("linkaddr_cmp() or list_item_next() not executed.\n");
    fi;
}
// -------------------------------------------------------
proctype backoff_period(){
    printf("backoff_period\n");
}
// -------------------------------------------------------
proctype packetbuf_set_addr(){
    printf("packetbuf_set_addr\n");
}
// proctype packet_sent(){
//     printf("packet_sent\n");
// }
// Defined below :-------------------------------------
proctype send_one_packet(){
    printf("send_one_packet\n");
    run packetbuf_set_addr();
    run packet_sent();
}
// -------------------------------------------------------
proctype queuebuf_to_packetbuf(){
    printf("queuebuf_to_packetbuf\n");
}
// -------------------------------------------------------
proctype transmit_from_queue(){
    printf("transmit_from_queue\n");
    int condition1;
    if
    :: condition1 = 0;
    :: condition1 = 1;
    fi;
    if
    :: condition1 == 0 -> {
        run queuebuf_to_packetbuf();
        run send_one_packet();
    };
    ::else->{
        printf("queuebuf_to_packetbuf() and send_one_packet() not executed.\n");
    }
    fi;
}
// -------------------------------------------------------
proctype list_remove(){
    printf("list_remove()\n");
}

proctype memb_free(){
    printf("memb_free()\n");
}

proctype ctimer_stop(){
    printf("ctimer_stop()\n");
}

proctype schedule_transmission(){
    printf("schedule_transmission()\n");
    int condition1, condition2;

    if
    :: condition1 = 0;
    :: condition1 = 1;
    fi;

    if
    :: condition2 = 0;
    :: condition2 = 1;
    fi;

    if
    :: (condition1 == 1) -> {
        run list_remove();
        run memb_free();

        if
        :: (condition2 == 1) -> {
            run ctimer_stop();
            run list_remove();
            run memb_free();
        }
        :: else -> {
            printf("ctimer_stop(), list_remove(), memb_free() not executed.\n");
        }
        fi;
    }
    :: else -> {
        printf("condition1 != 1, skipping list_remove() and memb_free()\n");
    }
    fi;
}
// ----------------------------------------------------------
proctype free_packet(){
    printf("free_packet()\n");
}
proctype mac_call_sent_callback(){
    printf("mac_call_sent_callback()\n");
}
proctype tx_done(){
    printf("tx_done()\n");
    run free_packet();
    run mac_call_sent_callback();
}
// ----------------------------------------------------------
// proctype schedule_transmission(){
//     printf("schedule_transmission()\n");
// }
proctype queuebuf_update_attr_from_packetbuf(){
    printf("queuebuf_update_attr_from_packetbuf()\n");
}
proctype rexmit(){
    printf("rexmit()\n");
    run schedule_transmission();
    run queuebuf_update_attr_from_packetbuf();
}
// ----------------------------------------------------------
proctype collision(){
    printf("collision()\n");
    int condition1;
    if
    :: condition1 = 0;
    :: condition1 = 1;
    fi;
    if
    :: condition1 == 0 -> {
        run tx_done();
    };
    :: condition1 == 1 -> {
        run rexmit();
    }
    fi;
}
// ----------------------------------------------------------
proctype tx_ok(){
    printf("tx_ok()\n");
    run tx_done();
}
// ----------------------------------------------------------
proctype noack(){
    printf("noack()\n");
}
proctype packet_sent(){
    printf("packet_sent()\n");
    int condition1;
    if
    :: condition1 = 0;
    :: condition1 = 1;
    :: condition1 = 2;
    :: condition1 = 3;
    fi;

    if
    :: condition1 == 0 -> run tx_ok();
    :: condition1 == 1 -> run noack();
    :: condition1 == 2 -> run collision();
    :: condition1 == 3 -> run tx_done();
    fi;
}
// ----------------------------------------------------------
proctype packetbuf_addr(){
    printf("packetbuf_addr()\n");
}
proctype packetbuf_set_attr(){
    printf("packetbuf_set_attr()\n");
}
// ----------------------------------------------------------
proctype linkaddr_copy(){
    printf("linkaddr_copy()\n");
}
proctype LIST_STRUCT_INIT(){
    printf("LIST_STRUCT_INIT()\n");
}
proctype list_add(){
    printf("list_add()\n");
}
proctype packetbuf_datalen(){
    printf("packetbuf_datalen()\n");
}
proctype packetbuf_attr(){
    printf("packetbuf_attr()\n");
}
proctype list_length(){
    printf("list_length()\n");
}
proctype csma_output_packet(){
    printf("csma_output_packet()\n");
    run packetbuf_addr();
    run packetbuf_set_attr();
    run neighbor_queue_from_addr();
    int condition1;
    if
    :: condition1 = 0;
    :: condition1 = 1;
    :: condition1 = 2;
    :: condition1 = 3;
    :: condition1 = 4;
    :: condition1 = 5;
    fi;
    if
    :: condition1 == 0 -> {
        run linkaddr_copy();
        run LIST_STRUCT_INIT();
        run list_add();
        run packetbuf_datalen();
        run packetbuf_attr();
        run list_length();

    };
    fi;

    if
    :: condition1==3 -> {
        run schedule_transmission();
        run memb_free();
    };
    :: condition1==4 -> {
        run memb_free();
    };
    fi;
    
    if
    :: condition1==5->{
        run list_remove();
        run memb_free();
    };
    fi;


    run mac_call_sent_callback();
}
// ----------------------------------------------------------
proctype memb_init(){
    printf("memb_init()\n");
}
proctype csma_output_init(){
    printf("csma_output_init()\n");
    run memb_init();
}
init {
    // run neighbor_queue_from_addr();
    // run send_one_packet();
    // run transmit_from_queue();
    // run schedule_transmission();
    // run tx_done();
    // run rexmit();
    // run collision();
    // run csma_output_packet();
    run csma_output_init();

}