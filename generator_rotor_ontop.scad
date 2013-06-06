//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_ontop.scad//
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
use <generator_magnet.scad>
use <generator_magnet2.scad>
use <generator_rotor_adapter_hdd.scad>
//use <generator_logo.scad>
//===============================================//
//                    Trees                      //
//===============================================//




module magnet_rotation_adapter2() {
translate([rotor_ext_max/2+13,0,20])magnet2();}

module magnet_rerotation_adapter2() {
for(i=[0:nbmagnetsonrotor2-1]){
rotate([0,0,(360/nbmagnetsonrotor2)*i]) magnet_rotation_adapter2();}}

//%cube([x_h2o_cont_ext,y_h2o_cont_ext,z_h2o_cont_ext], center=true);

rotate([0,0,30])magnet_rerotation_adapter2();


module armontop() {
translate([0,0,+20-z_magnet2/2])cube([61,25,z_rotor_int/4], center=true);
}

module armontop_rotation_adapter() {
translate([(diam_adapter_max-diam_adapter_min)+diam_adapter_min*1.3,0,0])armontop();}

module armontop_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armontop_rotation_adapter();
}}

armontop_rotation();


module armontopdif() {
cube([10,10,50], center=true);
}

module armontopdif_rotation_adapter() {
translate([(diam_adapter_max-diam_adapter_min)+diam_adapter_min*1.3,0,0])armontopdif();}

module armontopdif_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armontopdif_rotation_adapter();
}}

module armontopunion() {
union() {
armontop_rotation();
rotate([0,0,(30)])armontop_rotation();}}
armontopunion();

difference()
{
armontopunion();
armontopdif_rotation();
}

//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_ontop.scad//
//                   End  File                   //
//===============================================//
//===============================================//
