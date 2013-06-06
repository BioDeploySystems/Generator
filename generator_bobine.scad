//===============================================//
//===============================================//
//  BioDeploy SCAD file = generator_bobine.scad  //
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
module bobine_port1()
{translate([0,0,p_bobine_ext/2])cylinder(p_bobine_ext,r_bobine_ext_max,r_bobine_ext_max, $fn=smooth_bobine, center = true);}


module bobine_port1_dif(){
translate([0,0,x_bobine/2])cylinder(x_bobine*1.5,r_bobine_int,r_bobine_int,$fn=smooth_bobine, center = true);
}
module bobine_port1_int() {
translate([0,0,x_bobine/2])cylinder(x_bobine-p_bobine_ext*2,r_bobine_ext_min,r_bobine_ext_min,$fn=smooth_bobine, center = true);}




module bobine1_pre() {
difference() {
union() {
bobine_port1();
bobine_port1_int();}
union(){
translate([r_bobine_ext_min+wire_in/2,0,0])cylinder(p_bobine_ext*3+pad,wire_in/1.5,wire_in/1.5,$fn=20, center=true );
translate([-r_bobine_ext_max,0,0])cylinder(p_bobine_ext*3+pad,wire_in/1.5,wire_in/1.5,$fn=20, center=true );
bobine_port1_dif();}}}

module bobine1_prefix() {
rotate([0,0,60])translate([r_bobine_ext_max,0,p_bobine_ext/2])cube([p_bobine_ext,p_bobine_ext,p_bobine_ext], center=true);
}
module bobine1_fix() {
for (i=[0:4-1]) {
rotate([0,0,90*i])bobine1_prefix();}
}


module bobine1() {
union(){
bobine1_pre();
bobine1_fix();
rotate([0,0,90])translate([r_bobine_int,0,x_bobine/2-p_bobine_ext/2])cylinder(x_bobine-p_bobine_ext,wire_in/2,wire_in/2,$fn=20, center=true );
rotate([0,0,270])translate([r_bobine_int,0,x_bobine/2-p_bobine_ext/2])cylinder(x_bobine-p_bobine_ext,wire_in/2,wire_in/2,$fn=20, center=true );}}

bobine1();

//

module bobine_port2()
{translate([0,0,p_bobine_ext/2])cylinder(p_bobine_ext,r_bobine_ext_max,r_bobine_ext_max,$fn=smooth_bobine, center = true);}


module bobine_port2_dif(){
translate([0,0,x_bobine/2])cylinder(x_bobine*1.5,r_bobine2_int,r_bobine2_int,$fn=smooth_bobine, center = true);
}
module bobine_port2_int() {
translate([0,0,x_bobine/2+p_bobine_ext/2+1.25])cylinder(x_bobine+2.5-p_bobine_ext,r_bobine2_ext_min,r_bobine2_ext_min,$fn=smooth_bobine, center = true);}




module bobine2_pre() {
difference() {
union() {
bobine_port2();
bobine_port2_int();}
bobine_port2_dif();}}


module bobine2_prefix() {
rotate([0,0,60])translate([r_bobine_ext_max,0,p_bobine_ext/2])cube([p_bobine_ext,p_bobine_ext,p_bobine_ext], center=true);
}
module bobine2_fix() {
for (i=[0:4-1]) {
rotate([0,0,90*i])bobine2_prefix();}
}

module bobine2_ontop() {
rotate([0,0,0])translate([1.5,0,p_bobine_ext/2-5])cube([p_bobine_ext/1.5,p_bobine_ext/1.5,p_bobine_ext*2], center=true);
}
module bobine2_ontop_fix() {
for (i=[0:1]) {
rotate([0,0,180*i])bobine2_ontop();}
}



module fixonsocle()
{
difference() {
translate([0,0,3.75])cylinder(4.5,r_bobine2_ext_min,0,$fn=100,center=true);
translate([0,0,2.75])cylinder(2.6,r_bobine2_ext_min-r_bobine2_ext_min/10,0,$fn=100,center=true);}
}

//mirror([0,0,1])fixonsocle();

module fixbobines() {
translate([0,0,32.25])rotate([90,0,0])cylinder(10,1,1,$fn=24, center=true);}

module screwfixbobines() {
translate([0,0,32.25])rotate([90,0,0])cylinder(6.8,0.9,0.9,$fn=24, center=true);}


module before_bobine2() {
difference() {
union(){

translate([0,0,30])fixonsocle();
bobine2_pre();
bobine2_fix();}
union(){
fixbobines();
rotate([0,0,90])translate([r_bobine_int,0,x_bobine+p_bobine_ext/2])cylinder(x_bobine*2-p_bobine_ext,(wire_in/2)*1.2,(wire_in/2)*1.2,$fn=20, center=true );
rotate([0,0,270])translate([r_bobine_int,0,x_bobine+p_bobine_ext/2])cylinder(x_bobine*2-p_bobine_ext,(wire_in/2)*1.2,(wire_in/2)*1.2,$fn=20, center=true );
}}}


module bobine2() {
union() {
before_bobine2();
translate([0,0,+30])mirror([0,0,1])bobine2_ontop_fix();}}

translate([0,0,+30])mirror([0,0,1])bobine2();

module bobine() {
bobine1();
translate([0,0,+30])mirror([0,0,1])bobine2();
}

translate([0,0,+30])mirror([0,0,1])screwfixbobines();

module bobine_socle_pre()
{
translate([0,0,x_bobine/2])%cylinder(x_bobine,r_bobine_ext_max,r_bobine_ext_max, center=true);
}
//bobine_socle_pre();




//-----------------------------------------------//
//===============================================//
//===============================================//
//  BioDeploy SCAD file = generator_bobine.scad  //
//                   End  File                   //
//===============================================//
//===============================================//
