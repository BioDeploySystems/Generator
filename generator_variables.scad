//===============================================//
//===============================================//
// BioDeploy SCAD file = generator_variables.scad//
//                 Start File                    //
//===============================================//
//===============================================//
//-----------------------------------------------//
include <3dprinter.scad>
//===============================================//
//                   variables                   //
//===============================================//
//===============================================//
pad = 0.1; //padding
//choose the spec for your generator
//===============================================//
//                    magnets1                   //
//===============================================//
//Volume :
x_magnet = 5.5;
y_magnet = 21.5;
z_magnet = 21.5;
//Number of magnets on the rotor :
nbmagnetsonrotor = 16;
rotor_ext_max = 60;
//===============================================//
//                    magnets2                   //
//===============================================//
//Volume :
diam_magnet2 = 35;
z_magnet2 = 5;
//Number of magnets on the rotor :
nbmagnetsonrotor2 = 6;
//===============================================//
//                      rotor                    //
//===============================================//
smooth_rotor = 100;
smooth_bobine = 100;
z_rotor_int = 20;
//===============================================//
//                  adapter_rotor                //
//===============================================//
diam_adapter_max = 32 ;
diam_adapter_min = 25.15 ;
h_adapter = 7;
h_adapter_box = 12;
nbarm = 6;
//===============================================//
//                    Bobine1                    //
//===============================================//
r_bobine_ext_max = y_magnet/2;
r_bobine_ext_min = 4.5;
r_bobine_int = 3.5;

x_bobine = 30;
p_bobine_ext = 1;

r_bobine2_ext_min = 3.4;
r_bobine2_int = 2.5;

wire_in = 1;
wire_out = 1;


//===============================================//
//                    Protector                  //
//===============================================//

r_bobine_protector_ext_max = y_magnet/2 + 1.5;
gap_bobine_protector = (r_bobine_protector_ext_max - r_bobine_ext_max)/2;


x_bobine_protector=x_bobine+1.5;

smooth_protector = 100;

//===============================================//
//                    Socle1                     //
//===============================================//

r_socle_int = 0;
r_socle_ext = 0;
position_bobine_in = 0;
position_bobine_out = 0;
connector_socle_female =0;
connector_socle_male =0;
space_marge=3;

//-----------------------------------------------//
//===============================================//
//===============================================//
// BioDeploy SCAD file = generator_variables.scad//
//                   End  File                   //
//===============================================//
//===============================================//
