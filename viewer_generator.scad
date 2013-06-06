//===============================================//
//===============================================//
//  BioDeploy SCAD file = viewer_generator.scad  //
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
use <generator_base_socle.scad>
use <generator_base.scad>
use <generator_rotor_adapter_hdd.scad>
use <generator_hdd.scad>
use <generator_rotor_adapter_cap_hdd.scad>
//include <viewer_generator_socle_bobine.scad>
use <viewer_generator_rotor.scad>
//include <generator_rotor_ontop.scad>
//===============================================//
//                    Trees                      //
//===============================================//
translate([0,0,50])rotate([0,180,0])caps();

module viewer_rotor() {
union() {
translate([0,0,-38.5])generator_rotor_adapter_hdd();
translate([-25,0,-45])hdd();}}



module socle_part1(){
union(){
import("generator_socle_bobine_leftx4.stl");
rotate([0,0,90])import("generator_socle_bobine_leftx4.stl");
rotate([0,0,180])import("generator_socle_bobine_leftx4.stl");
rotate([0,0,270])import("generator_socle_bobine_leftx4.stl");}}

module socle(){
union(){
translate([0,0,-10])socle_part1();
translate([0,0,10])mirror([0,0,1])socle_part1();}}

module viewer_protector_pre(){
translate([-84,0,0])rotate([0,90,0])import("generator_bobine_protector.stl");}

module viewer_protector(){
for (i=[0:15]) {
rotate([0,00,360/16*i])viewer_protector_pre();}}


module stage1(){
union(){
viewer_protector();
socle();}}

stage1();

translate([0,0,60])stage1();
translate([0,0,120])stage1();
translate([0,0,180])stage1();

translate([0,0,180])mirror([0,0,1])viewer_rotor();
viewer_rotor();

module viewer_generator_rotor() {
union() {
import("generator_rotor_top.stl");
import("generator_rotor_bottom.stl");
}}

viewer_generator_rotor();
translate([0,0,60])viewer_generator_rotor();
translate([0,0,120])viewer_generator_rotor();
translate([0,0,180])viewer_generator_rotor();

translate([0,0,-55])import("generator_base_socle.stl");
translate([0,0,+180+55])mirror([0,0,1])import("generator_base_socle.stl");


rotate([0,00,-11.25])translate([0,0,-70])import("generator_base.stl");
rotate([0,00,-56.25])translate([0,0,250])import("generator_base.stl");


translate([200,0,150])import("generator_rotor_adapter_stagelinker.stl");



//-----------------------------------------------//
//===============================================//
//===============================================//
//  BioDeploy SCAD file = viewer_generator.scad  //
//                   End  File                   //
//===============================================//
//===============================================//
