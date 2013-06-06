//===============================================//
//===============================================//
//  BioDeploy SCAD file = generator_rotor.scad   //
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
include <generator_rotor_top.scad>
include <generator_rotor_bottom.scad>
use <generator_rotor_adapter_hdd.scad>
use <generator_hdd.scad>
use <generator_rotor_adapter_cap_hdd.scad>
//include <generator_rotor_ontop.scad>
//===============================================//
//                    Trees                      //
//===============================================//
translate([0,0,50])rotate([0,180,0])caps();
translate([0,0,-38.5])generator_rotor_adapter_hdd();
translate([-25,0,-45])hdd();
//-----------------------------------------------//
//===============================================//
//===============================================//
//  BioDeploy SCAD file = generator_rotor.scad   //
//                   End  File                   //
//===============================================//
//===============================================//