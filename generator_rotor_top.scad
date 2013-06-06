//===============================================//
//===============================================//
// BioDeploy SCAD file = generator_rotor_top.scad//
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


module magnet_rotation_adapter() {
translate([rotor_ext_max,0,0])magnet();}


module magnet_rotation(){
for(i = [0:(nbmagnetsonrotor-1)]) {
rotate([0,0,(360/nbmagnetsonrotor)*i])magnet_rotation_adapter();
}}




module magnetmaintaintop() {
difference()
{
color("Green",1)translate([0,0,+z_rotor_int/2-z_magnet/6])cylinder(z_rotor_int/2+z_magnet/6,rotor_ext_max+x_magnet*1.1,rotor_ext_max+x_magnet*1.1,$fn=smooth_rotor, center=true);
translate([0,0,+z_rotor_int/2-z_magnet/6+pad])cylinder(z_rotor_int+z_magnet/6,rotor_ext_max-x_magnet*1.1,rotor_ext_max-x_magnet*1.1,$fn=smooth_rotor, center=true);
}}


module arm() {
cube([6.9,6.9,60], center=true);
}


module arm_rotation_adapter() {
translate([diam_adapter_max/1.7,0,30])arm();}


module arm_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])arm_rotation_adapter();
}}

//!
module armtop() {
translate([-20,0,z_rotor_int/2-z_magnet/6+z_rotor_int/4.605])cube([80,15,z_rotor_int/4], center=true);
}

module armtop_rotation_adapter() {
translate([(diam_adapter_max-diam_adapter_min)+diam_adapter_min*1.3,0,0])armtop();}

module armtop_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armtop_rotation_adapter();
}}

//armtop_rotation();


module armtopdif() {
cube([10,10,50], center=true);
}

module armtopdif_rotation_adapter() {
translate([(diam_adapter_max-diam_adapter_min)+diam_adapter_min*1.3,0,0])armtopdif();}

module armtopdif_rotation(){
for(i = [0:(nbarm-1)]) {
rotate([0,0,(60)*i])armtopdif_rotation_adapter();
}}



module fulldif() {
difference()
{
armtop_rotation();
arm_rotation();
}}



module fullunion() {
union() {
magnetmaintaintop();
fulldif();
}}

module generator_rotor_top() {
difference()
{
fullunion();
magnet_rotation();
}}

generator_rotor_top();




//-----------------------------------------------//
//===============================================//
//===============================================//
// BioDeploy SCAD file = generator_rotor_top.scad//
//                   End  File                   //
//===============================================//
//===============================================//
