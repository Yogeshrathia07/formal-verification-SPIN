proctype rpl_dag_state_to_str(){
	printf("rpl_dag_state_to_str()\n");
}
// -----------------------------------------

proctype uip_ipaddr_copy(){
	printf("uip_ipadder_copy()\n");
}

proctype rpl_dag_get_root_ipaddr(){
	printf("rpl_dag_get_root_ipaddr()\n");
	bool condition;
	if
	:: condition = true;
	:: condition = false;
	fi;
	
	if
	:: condition == true -> 
		run uip_ipaddr_copy();
	:: else -> 
		printf("uip_ipaddr_copy() not executed\n");
	fi;
}
// ------------------------------------------
proctype RPL_LOLLIPOP_INCREMENT(){
	printf("RPL_LOLLIPOP_INCREMENT()\n");
}
proctype rpl_icmp6_dao_output(){
	printf("rpl_icmp6_dao_output()\n");
}
proctype link_stats_reset(){
	printf("link_stats_reset()\n");
}
proctype rpl_neighbor_remove_all(){
	printf("rpl_neighbor_remove_all()\n");
}
proctype rpl_timers_stop_dag_timers(){
	printf("rpl_timers_stop_dag_timers()\n");
}
proctype rpl_dag_leave(){
	printf("rpl_dag_leave()\n");
	bool condition1,condition2;
	if
	:: condition1 = true;
	:: condition1 = false;
	fi;
	if
	:: condition2 = true;
	:: condition2 = false;
	fi;
	if
	:: condition1 == true -> 
		{
			run RPL_LOLLIPOP_INCREMENT();
			run rpl_icmp6_dao_output();
		}
	:: else -> 
		{
			printf("RPL_LOLLIPOP_INCREMENT() and rpl_icmp6_dao_output() not executed\n");
		}
	fi;
	run link_stats_reset();
	run rpl_neighbor_remove_all();
	run rpl_timers_stop_dag_timers();
	if
	:: condition2 == true -> 
		run rpl_dag_get_root_ipaddr();
	fi;
	
}
// ------------------------------------------
proctype rpl_timers_schedule_state_update(){
	printf("rpl_timers_schedule_state_update()\n");
}
proctype rpl_dag_poison_and_leave(){
	printf("rpl_dag_poison_and_leave()\n");
	run rpl_timers_schedule_state_update();
}
// ------------------------------------
proctype rpl_icmp6_dis_output(){
	printf("rpl_icmp6_dis_output()\n");
}
proctype rpl_dag_periodic(){
	printf("rpl_dag_periodic()\n");
	if
	:: run rpl_timers_schedule_state_update();
	:: run rpl_icmp6_dis_output();
	fi;
}
// ------------------------------------
proctype rpl_is_addr_in_our_dag(){
	printf("rpl_is_addr_in_our_dag()\n");
}
// ------------------------------------
proctype rpl_get_default_instance(){
	printf("rpl_get_default_instance()\n");
}
// ------------------------------------
proctype rpl_get_any_dag(){
	printf("rpl_get_any_dag()\n");
}
// ------------------------------------
proctype find_objective_function(){
	printf("find_objective_function()\n");
}
// ------------------------------------
proctype rpl_neighbor_print_list(){
	printf("rpl_neighbor_print_list()\n");
}
proctype rpl_refresh_routes(){
	printf("rpl_refresh_routes()\n");
	run RPL_LOLLIPOP_INCREMENT();
	if
	:: run rpl_neighbor_print_list();
	:: printf("rpl_neighbor_print_list() not executed\n");
	fi;
}
// ------------------------------------
// proctype rpl_local_repair(){
//     printf("rpl_local_repair()\n");
// }
// defined below
proctype rpl_global_repair(){
	printf("rpl_global_repair()\n");
	bool condition1,condition2;
	if
	:: condition1 = true;
	:: condition1 = false;
	fi;
	if
	:: condition2 = true;
	:: condition2 = false;
	fi;
	
    if
	:: condition1 == true -> 
		{
			run RPL_LOLLIPOP_INCREMENT();
            run rpl_local_repair();
		}
	:: condition1 == true && condition2 == true -> 
		{
			run rpl_neighbor_print_list();
		}
	fi;
	
}
// -------------------------------------
proctype rpl_neighbor_set_preferred_parent(){
    printf("rpl_neighbor_set_preferred_parent()\n");
}

proctype process_dio_init_dag(){
    printf("process_dio_init_dag()\n");
}
proctype global_repair_non_root() {
    printf("global_repair_non_root()\n");

    int condition1, condition2;
    if
    :: condition1 = 1;
    :: condition1 = 0;
    fi;
    if
    :: condition2 = 1;
    :: condition2 = 0;
    fi;

    if
    :: condition1 == 1 ->
        if
        :: condition2 == 1 ->
            run rpl_neighbor_print_list();
        :: condition2 == 0 ->
            printf("rpl_neighbor_print_list() not executed\n");
        fi;

        run rpl_timers_stop_dag_timers();
        run rpl_neighbor_set_preferred_parent();
        run process_dio_init_dag();
        run rpl_local_repair();
    fi;
}
// --------------------------------------
proctype rpl_timers_dio_reset(){
	printf("rpl_timers_dio_reset()\n");
}
proctype rpl_local_repair(){
	printf("rpl_local_repair()\n");
	run rpl_neighbor_remove_all();
	run rpl_timers_dio_reset();
	run rpl_timers_schedule_state_update();
}

proctype rpl_dag_ready_to_advertise(){
	printf("rpl_dag_ready_to_advertise()\n");
}
proctype rpl_timers_unschedule_state_update(){
	printf("rpl_timers_unschedule_state_update()\n");
}
// --------------------
proctype rpl_timers_schedule_leaving(){
	printf("rpl_timers_schedule_leaving()\n");
}
proctype rpl_neighbor_select_best(){
	printf("rpl_neighbor_select_best()\n");
}
proctype rpl_neighbor_rank_via_nbr(){
	printf("rpl_neighbor_rank_via_nbr()\n");
}
proctype nbr_table_head(){
	printf("nbr_table_head()\n");
}
proctype nbr_table_next(){
	printf("nbr_table_next()\n");
}
proctype rpl_timers_unschedule_leaving(){
	printf("rpl_timers_unschedule_leaving()\n");
}
proctype rpl_timers_schedule_periodic_dis(){
	printf("rpl_timers_schedule_periodic_dis()\n");
}
proctype update_metric_container(){
	printf("update_metric_container()\n");
}
proctype rpl_dag_update_state(){
	printf("rpl_dag_update_state()\n");
	int condition1,condition2,condition3;
	if
	:: condition1 = 0;
	:: condition1 = 1;
	:: condition1 = 2;
	fi;
	if
	:: condition2 = 0;
	:: condition2 = 1;
	fi;
	if
	:: condition3 = 0;
	:: condition3 = 1;
	fi;
	run rpl_timers_unschedule_state_update();
	if
	:: condition1 == 1 ->
		{
			run rpl_neighbor_set_preferred_parent();
			run rpl_timers_dio_reset();
      		run rpl_timers_schedule_leaving();
		}
	:: condition1 == 2 ->
		{
			run rpl_timers_dio_reset();
			run rpl_timers_schedule_leaving();
		}
	:: condition1 == 0 ->
		{
			run rpl_neighbor_set_preferred_parent();
			run rpl_neighbor_select_best();
			run rpl_neighbor_rank_via_nbr();
			run nbr_table_head();
			run nbr_table_next();

		}
	fi;
	if
	:: condition2 == 1 ->
		{
			run rpl_timers_dio_reset();
			run rpl_timers_unschedule_leaving();
		}
	:: condition2 == 0 ->
		{
			run rpl_timers_dio_reset();
			run rpl_timers_schedule_periodic_dis();
			run rpl_timers_schedule_leaving();
		}
	fi;
	if
	:: condition3 == 1 ->
		{
			run rpl_neighbor_print_list();
		}
	:: condition3 == 0 ->
		{
			printf("rpl_neighbor_print_list() not executed\n");
		}
	fi;
	run update_metric_container();
}
proctype rpl_neighbor_get_from_ipaddr(){
	printf("rpl_neighbor_get_from_ipaddr()\n");
}
// ------------------------------------
proctype update_nbr_from_dio(){
	printf("update_nbr_from_dio()\n");
	int condition1;
	if
	:: condition1 = 0;
	:: condition1 = 1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run rpl_neighbor_get_from_ipaddr();
		}
	:: condition1 == 0 ->
		{
			printf("rpl_neighbor_get_from_ipaddr() not executed\n");
		}
	fi;

}
// -----------------------------------
proctype process_dio_from_current_dag(){
	printf("process_dio_from_current_dag()\n");
	int condition1,condition2;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition2=0;
	:: condition2=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run rpl_timers_dio_reset();
		}
	:: condition1 == 0 ->
		{
			printf("rpl_timers_dio_reset() not executed\n");
		}
	fi;
	if
	:: condition2 == 1 ->
		{
			run rpl_global_repair();
		}
	:: condition2 == 0 ->
		{
			run global_repair_non_root();
		}
	fi;
}
// -----------------------------------
proctype init_dag_from_dio(){
	printf("init_dag_from_dio()\n");
}
// -----------------------------------
proctype rpl_process_dio(){
	printf("rpl_process_dio()\n");
	int condition1;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run process_dio_from_current_dag();
			run rpl_dag_update_state();
		}
	:: condition1 == 0 ->
		{
			printf("process_dio_from_current_dag() and rpl_dag_update_state() not executed\n");
		}
	fi;
}
// -----------------------------------
proctype rpl_icmp6_dio_output()
{
	printf("rpl_icmp6_dio_output()\n");
}
proctype rpl_process_dis(){
	printf("rpl_process_dis()\n");
	int condition1,condition2;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition2=0;
	:: condition2=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run rpl_timers_dio_reset();
		}
	:: condition1 == 0 ->
		{
			printf("rpl_timers_dio_reset() not executed\n");
			if
			:: condition2 == 1 ->
				{
					run rpl_icmp6_dio_output();
				}
			:: condition2 == 0 ->
				{
					printf("rpl_icmp6_dio_output() not executed\n");
				}
			fi;
		}
	fi;
}
// -----------------------------------
proctype uip_sr_expire_parent(){
	printf("uip_sr_expire_parent()\n");
}
proctype rpl_process_dao(){
	printf("rpl_process_dao()\n");
	int condition1;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run uip_sr_expire_parent();
		}
	:: condition1 == 0 ->
		{
			printf("uip_sr_expire_parent() not executed\n");
		}
	fi;
}
// -----------------------------------
proctype rpl_timers_notify_dao_ack(){
	printf("rpl_timers_notify_dao_ack()\n");
}
proctype rpl_process_dao_ack(){
	printf("rpl_process_dao_ack()\n");
	int condition1;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run rpl_timers_dio_reset();
		}
	:: condition1 == 0 ->
		{
			printf("rpl_timers_dio_reset() not executed\n");
		}
	fi;
	run rpl_timers_notify_dao_ack();
}
// -----------------------------------
proctype rpl_timers_schedule_unicast_dio(){
	printf("rpl_timers_schedule_unicast_dio()\n");
}
proctype rpl_process_hbh(){
	printf("rpl_process_hbh()\n");
	int condition1,condition2,condition3;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition2=0;
	:: condition2=1;
	fi;
	if
	:: condition3=0;
	:: condition3=1;
	fi;
	if
	:: condition1 == 1 ->
		{
			run rpl_timers_dio_reset();
		}
	:: condition1 == 0 ->
		{
			printf("rpl_timers_dio_reset() not executed\n");
		}
	fi;
	if
	:: condition1==1 && condition2 == 1 ->
		{
			run rpl_timers_schedule_unicast_dio();
		}
	::else->
		{
			printf("rpl_timers_schedule_unicast_dio() not executed\n");
		}
	fi;
	if
	:: condition3==1->
		{
			run rpl_dag_update_state();
		}
	::else->
		{
			printf("rpl_dag_update_state() not executed\n");
		}
	fi;

}
// -----------------------------------
proctype rpl_dag_init_root(){
	printf("rpl_dag_init_root()\n");
	int condition1,condition2;
	if
	:: condition1=0;
	:: condition1=1;
	fi;
	if
	:: condition2=0;
	:: condition2=1;
	fi;
	if
	:: condition1 == 1 && condition2==1 ->
		{
			run RPL_LOLLIPOP_INCREMENT();
			run rpl_dag_leave();
		}
	:: condition1 == 1 && condition2==0 ->
		{
			run rpl_dag_leave();
		}
	fi;
	run rpl_timers_dio_reset();
}
init{
// run rpl_dag_state_to_str();
// run rpl_dag_get_root_ipaddr();
// run rpl_dag_leave();
// run rpl_dag_poison_and_leave();
// run rpl_dag_periodic();
// run rpl_refresh_routes();
// run global_repair_non_root();
// run rpl_local_repair();
// run rpl_dag_ready_to_advertise();
// run rpl_dag_update_state();
// run rpl_dag_update_state();
// run update_nbr_from_dio();
// run process_dio_from_current_dag();
// run init_dag_from_dio();
// run rpl_process_dis();
// run rpl_process_dao();
// run rpl_process_dao_ack();
// run rpl_process_hbh();
run rpl_dag_init_root();
}