
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name first-test -dir "/home/stetd/Documents/github/VHDL_AFPA/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/stetd/Documents/github/VHDL_AFPA/TOP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/stetd/Documents/github/VHDL_AFPA} }
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
