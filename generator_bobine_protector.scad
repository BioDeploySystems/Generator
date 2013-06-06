//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_bobine_protector.scad//
//                 Start File                    //
//===============================================//
//===============================================//
//-----------------------------------------------//

//===============================================//
//                   variables                   //
//===============================================//
include <generator_variables.scad>
//===============================================//
//               Calls for use                   //
//===============================================//
//use <generator_logo.scad>
use <generator_bobine.scad>
//===============================================//
//                    Trees                      //
//===============================================//




module bobine_protector_prefix_int() {
rotate([0,0,60])translate([r_bobine_ext_max,0,p_bobine_ext/2+0])cube([p_bobine_ext*1.15,p_bobine_ext*1.15,p_bobine_ext*32], center=true);
}
module bobine_protector_int_fix() {
for (i=[0:4-1]) {
rotate([0,0,90*i])bobine_protector_prefix_int();}
}

module unionprotector(){
union() {
translate([0,0,-15])bobine();
cylinder(x_bobine+1,r_bobine_ext_max+0.1,r_bobine_ext_max+0.1,$fn=smooth_protector, center=true);
cylinder(x_bobine*2,r_bobine_int+0.15,r_bobine_int+0.15,$fn=smooth_protector, center=true);
bobine_protector_int_fix();}}



module protector_pre() {
difference() {
translate([0,0,-gap_bobine_protector/2-pad])cylinder(x_bobine_protector,r_bobine_protector_ext_max,r_bobine_protector_ext_max,$fn=smooth_protector, center=true);
unionprotector();
}}


module keyprotector() {
difference() {
union(){
translate([r_bobine_protector_ext_max+4,0,+(gap_bobine_protector-10)/2-0.85])cube([9,3.5,x_bobine_protector-10], center=true);
translate([r_bobine_protector_ext_max+6,0,+(gap_bobine_protector-10)/2-0.85])cylinder(x_bobine_protector-10,4,4,$fn=24, center=true);
}
union() {
translate([r_bobine_protector_ext_max+11,0,+(gap_bobine_protector-10)/2-0.85])cube([10,10,x_bobine_protector], center=true);
translate([r_bobine_protector_ext_max+6,0,+(gap_bobine_protector-10)/2-0.85])cylinder(x_bobine_protector,3,3,$fn=24, center=true);
}}}

module keyprotector2() {
rotate([0,0,180])keyprotector();
}


module bobine_protector_screw_protector_hole() {
difference() {
rotate([0,0,30])translate([r_bobine_ext_max+4,0,-x_bobine_protector/2+0.275])cube([6,6,1.5], center=true);
rotate([0,0,30])translate([r_bobine_ext_max+4,0,-x_bobine_protector/2+0.275])cylinder(10,1.25,1.25,$fn=24, center=true);
}}


module bobine_protector_screw_protector_prefix_int() {
bobine_protector_screw_protector_hole();
}
module screw_protector1() {
for (i=[0:1]) {
rotate([0,0,180*i])bobine_protector_screw_protector_prefix_int();}
}

module bobine_protector_screw_protector_prefix_int() {
bobine_protector_screw_protector_hole();
}
module screw_protector2() {
for (i=[0:1]) {
rotate([0,0,180*i])bobine_protector_screw_protector_prefix_int();}
}

module screw_protector() {
union(){
screw_protector1();
rotate([0,0,300])screw_protector2();
}
}

module protector() {
union(){
screw_protector();
protector_pre();
keyprotector();
keyprotector2();}}

protector();

//translate([0,0,-15])bobine();



//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_bobine_protector.scad//
//                   End  File                   //
//===============================================//
//===============================================//
