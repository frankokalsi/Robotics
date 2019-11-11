% General initialization sequence
% connect Robix via USB port before launching initialization
% uncomment 'initialize_cam()' when also using the camera

clear all; 
global  a s1 s2 s3 s4 s5 s6 z cam ;
initialize_cam();
z=init_angles([-90; 90; -90; 90; -90; 90; -90; 90; -90; 90]); % by default min and min angular joint values on J1 to J5, to be updated
[s1,s2,s3,s4,s5,s6]=robix_connect(a);


% add your function calls from 'Robix_toolbox' below
rehome();
move_1_by(30); 
move_2_by(15); 

move_3_by(-30);

move_5_by(45);
