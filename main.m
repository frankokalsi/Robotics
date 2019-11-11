clear all; 
global  a s1 s2 s3 s4 s5 s6 z cam ;
%initialize_cam();
z=init_angles([-90; 90; -90; 90; -90; 90; -90; 90; -90; 90]); % by default min and min angular joint values on J1 to J5, to be updated
[s1,s2,s3,s4,s5,s6]=robix_connect(a);
%-80; 85; -75; 80; -80; 85; -80; 70; -80; 85
%Rehome the robot
rehome();

%syms th1 th2 th3 the4 th5

%Defining vals
l1 = 95; 
l2 = 95; 
l3 = 58; 
l4 = 0; 
l5 = 0;

d1 = 135; 
d2 = 0; 
d3 = 0; 
d4 = 0; 
d5 = 110; 

a1 = 0; 
a2 = 90; 
a3 = 0; 
a4 = 90; 
a5 = 0;

%Prompt for theta vals
promptth1 = "th1?"; 
th1 = input(promptth1); 
promptth2 = "th2?"; 
th2 = input(promptth2); 
promptth3 = "th3?";
th3 = input(promptth3); 
promptth4 = "th4?"; 
th4 = input(promptth4);
th4 = th4+90;
promptth5 = "th5?"; 
th5 = input(promptth5); 

%Move Robot to prompted theta vals
move_1_by(th1);
move_2_by(th2);
move_3_by(th3);
move_4_by(th4);
move_5_by(th5);

%Defining A Matrices
A1 = [
  cosd(th1) -sind(th1)*cosd(a1) sind(th1)*sind(a1) l1*cosd(th1); 
  sind(th1) cosd(th1)*cosd(a1) -cosd(th1)*sind(a1) l1*sind(th1); 
  0 sind(a1) cosd(a1) d1; 
  0 0 0 1
]

A2 = [
  cosd(th2) -sind(th2)*cosd(a2) sind(th2)*sind(a2) l2*cosd(th2); 
  sind(th2) cosd(th2)*cosd(a2) -cosd(th2)*sind(a2) l2*sind(th2); 
  0 sind(a2) cosd(a2) d2; 
  0 0 0 1
]

A3 = [
  cosd(th3) -sind(th3)*cosd(a3) sind(th3)*sind(a3) l3*cosd(th3); 
  sind(th3) cosd(th3)*cosd(a3) -cosd(th3)*sind(a3) l3*sind(th3); 
  0 sind(a3) cosd(a3) d3; 
  0 0 0 1
]

A4 = [
  cosd(th4) -sind(th4)*cosd(a4) sind(th4)*sind(a4) l4*cosd(th4); 
  sind(th4) cosd(th4)*cosd(a4) -cosd(th4)*sind(a4) l4*sind(th4); 
  0 sind(a4) cosd(a4) d4; 
  0 0 0 1
]


A5 = [
  cosd(th5) -sind(th5)*cosd(a5) sind(th5)*sind(a5) l5*cosd(th5); 
  sind(th5) cosd(th5)*cosd(a5) -cosd(th5)*sind(a5) l5*sind(th5); 
  0 sind(a5) cosd(a5) d5; 
  0 0 0 1
]


Q = A1 * A2 * A3 * A4 * A5 


disp(Q); 





