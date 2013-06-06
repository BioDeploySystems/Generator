//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_adapter_stagelinker.scad//
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

module armlinker() {
translate([0,0,25/2])cube([8,8,25], center=true);
}




module armlinkerint() {
translate([0,0,32/2-pad])cube([6.9,6.9,32], center=true);
}




module stagemarker(){
translate([7,0,25/2])rotate([90,0,0])cylinder(8,5,5, center=true);}


module blanklinker(){
translate([-50,4,0])cube([100,10,35]);}

module prelinker1(){
difference(){
union(){
rotate([0,0,45])stagemarker();
rotate([0,0,225])stagemarker();
rotate([0,0,135])stagemarker();
rotate([0,0,315])stagemarker();}
union(){
rotate([0,0,0])blanklinker();
rotate([0,0,90])blanklinker();
rotate([0,0,180])blanklinker();
rotate([0,0,270])blanklinker();}}}


module prelinker2(){
difference() {
armlinker();
armlinkerint();
}}





module linker(){
prelinker1();
prelinker2();
}

linker();

module barrelinker() {
translate([0,0,55])cube([6,6,32], center=true);
rotate([180,0,0])translate([0,0,25])cube([6,6,32], center=true);}

barrelinker();



//-----------------------------------------------//
//===============================================//
//===============================================//
//BioDeploy SCAD file = generator_rotor_adapter_stagelinker.scad//
//                   End  File                   //
//===============================================//
//===============================================//
