//===============================================//
//===============================================//
//   BioDeploy SCAD file = generator_base.scad   //
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





rotate([0,0,101.25])translate([0,0,+22])import("generator_base_socle.stl");



module base_ring_ext() {
difference(){
union(){
hull(){
cylinder(15,80,80, center=true);
rotate([0,0,0])translate([0,rotor_ext_max+x_magnet*1.1+space_marge+55.1,0])cylinder(15,40,40, center=true);}}
union()
rotate([0,0,0])translate([0,rotor_ext_max+x_magnet*1.1+space_marge+55.1,0])cylinder(18,8,8, center=true);
rotate([0,0,0])translate([0,rotor_ext_max+x_magnet*1.1+space_marge+55.1,6])cylinder(6,12,12, center=true);
}}


module base_ring_ext_x4() {
base_ring_ext();
rotate([0,0,90])base_ring_ext();
rotate([0,0,180])base_ring_ext();
rotate([0,0,270])base_ring_ext();}




module base_ring_pre() {
difference() {
union(){

translate([0,0,0])rotate([0,0,45])base_ring_ext_x4();
translate([0,0,0])rotate([0,0,90])mirror([0,0,1])base_ring_ext_x4();
color("Blue",1)translate([0,0,0])cylinder(15,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+2,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+2,$fn=smooth_rotor, center=true);}
translate([0,0,0])cylinder(18+pad,rotor_ext_max+x_magnet*1.1+space_marge-1.5,rotor_ext_max+x_magnet*1.1+space_marge-1.5,$fn=smooth_rotor, center=true);
}}









module  base_prerotation(){
translate([50,0,0])cube([100,30,15], center = true);}

module  base_rotation(){
for(i = [0:3]) {
rotate([0,0,360/4*i]) base_prerotation();}}

module base(){
union(){
base_ring_pre();
base_rotation();}}

base();
//-----------------------------------------------//
//===============================================//
//===============================================//
//   BioDeploy SCAD file = generator_base.scad   //
//                   End  File                   //
//===============================================//
//===============================================//
