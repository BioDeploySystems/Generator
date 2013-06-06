//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_socle_bobine_left.scad//
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
use <generator_magnet.scad>

use <generator_base_socle.scad>
use <generator_bobine_protector.scad>
//===============================================//
//                    Trees                      //
//===============================================//

module keyfixer_pre() {
difference() {
union() {
translate([15.625,0,-15.2])cube([8.25,20,2],center=true); 
translate([13,0,-14.25+10])cube([2.5,6,24],center=true);
translate([19,0,-14.25+10])cube([2.5,10,24],center=true); 
translate([18,0,-16.25])cylinder(24,5,5);
}

translate([21.5,0,-14.25+10])cube([3.5,30,68],center=true); }}

module keyfixer() {
difference(){
keyfixer_pre();
scale([1.015,1.015,1.015])protector();}
}



module protector_prerotation(){
translate([0,rotor_ext_max+x_magnet*1.1+space_marge+15.1,10])rotate([90,90,0])keyfixer();

}

module protector_rotation(){
for(i = [0:(nbmagnetsonrotor-1)]) {
rotate([0,0,(360/nbmagnetsonrotor)*i])protector_prerotation();
}}


module socle_ring() {
difference() {
color("Blue",1)translate([0,0,-11])cylinder(3,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+2,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+2,$fn=smooth_rotor, center=true);
translate([0,0,-15])cylinder(20+pad,rotor_ext_max+x_magnet*1.1+space_marge-1.5,rotor_ext_max+x_magnet*1.1+space_marge-1.5,$fn=smooth_rotor, center=true);
}}



module socle() {
union(){
protector_rotation();
socle_ring();
}}

module socle50() {
difference() {
socle();
rotate([0,0,11.25])translate([-150,0,-75])cube([150*2,150,150]);
}}

module socle25() {
difference() {
socle50();
rotate([0,0,101.25])translate([-150,0,-75])cube([150*2,150,150]);
}}

difference(){
socle25();
rotate([0,0,22.5])translate([0,0,-75])base_socle_ring();}
//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_socle_bobine_left.scad//
//                   End  File                   //
//===============================================//
//===============================================//
