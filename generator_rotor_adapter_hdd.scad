//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_adapter_hdd.scad//
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
//===============================================//
//                    Trees                      //
//===============================================//

module arm() {
cube([6,6,60], center=true);
}


module arm_rotation_adapter() {
translate([diam_adapter_max/1.7,0,30])arm();}


module arm_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])arm_rotation_adapter();
}}

//
module armbase() {
cube([3,12,25], center=true);
}


module armbase_rotation_adapter() {
translate([diam_adapter_max/1.7,0,12.5])armbase();}


module armbase_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armbase_rotation_adapter();
}}
//

module centralringattach() {
difference()
{
color("Blue",1)translate([0,0,0])cylinder(h_adapter,diam_adapter_max/2,diam_adapter_max/2,center=true);
translate([0,0,0])cylinder(h_adapter+pad,diam_adapter_min/2,diam_adapter_min/2,center=true);}
}


module centralringattachext() {
difference()
{
color("Red",1)translate([0,0,+pad/2])cylinder(h_adapter+pad,45/2,45/2,center=true);
translate([0,0,+pad/2])cylinder(h_adapter+pad*2,diam_adapter_max/2,diam_adapter_max/2,center=true);}
}
module generator_rotor_adapter_hdd_a() {
union() {
centralringattach();
centralringattachext();
arm_rotation();
armbase_rotation();

}
}






module armscrewdif() {

cylinder(20,1.25,1.25,$fn=24,center=true);
}


module armscrewdif_rotation_adapter() {
translate([diam_adapter_max/1.7,0,50+pad])armscrewdif();}


module armscrewdif_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armscrewdif_rotation_adapter();
}}

module generator_rotor_adapter_hdd() {
difference() {
generator_rotor_adapter_hdd_a();
armscrewdif_rotation();}}


generator_rotor_adapter_hdd();

//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_adapter_hdd.scad//
//                   End  File                   //
//===============================================//
//===============================================//
