//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_base_socle.scad//
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

module base_socle() {
cube([240,240,2], center = true);}

//base_socle();


module base_socle_ring_ext() {
hull(){
cylinder(6,80,80, center=true);
rotate([0,0,-11.25])translate([0,rotor_ext_max+x_magnet*1.1+space_marge+55.1,0])cylinder(6,20,20, center=true);}}

module base_socle_ring_ext_x4() {
base_socle_ring_ext();
rotate([0,0,90])base_socle_ring_ext();
rotate([0,0,180])base_socle_ring_ext();
rotate([0,0,270])base_socle_ring_ext();}




module base_socle_ring_pre() {
difference() {
union(){
base_socle_ring_ext_x4();
color("Blue",1)translate([0,0,0])cylinder(6,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+5,rotor_ext_max+x_magnet*1.1+space_marge+x_bobine+5,$fn=smooth_rotor, center=true);}
translate([0,0,0])cylinder(8+pad,rotor_ext_max+x_magnet*1.1+space_marge-1.5,rotor_ext_max+x_magnet*1.1+space_marge-1.5,$fn=smooth_rotor, center=true);
}}




module barre_ext(){
translate([0,rotor_ext_max+x_magnet*1.1+space_marge+22.1,150])rotate([00,0,0])cylinder(300,5,5, $fn=24, center=true);}



module  base_socle_prerotation(){
rotate([00,00,22.5])barre_ext();}

module  base_socle_rotation(){
for(i = [0:7]) {
rotate([0,0,360/8*i]) base_socle_prerotation();}}


module barre_ext_max(){
translate([0,rotor_ext_max+x_magnet*1.1+space_marge+55.1,150])rotate([00,0,0])cylinder(330,7,7, $fn=24, center=true);}



module  base_socle_prerotation2(){
rotate([00,00,0])barre_ext_max();}

module  base_socle_rotation2(){
for(i = [0:3]) {
rotate([0,0,360/4*i]) base_socle_prerotation2();}}




module base_socle_ring() {
union(){
base_socle_ring_pre();
rotate([0,0,11.25])base_socle_rotation();
rotate([0,0,-11.25])base_socle_rotation2();}}



base_socle_ring();












//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_base_socle.scad//
//                   End  File                   //
//===============================================//
//===============================================//
