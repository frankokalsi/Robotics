clear all; 
global  a s1 s2 s3 s4 s5 s6 z cam ;
%initialize_cam();
z=init_angles([-90; 90; -90; 90; -90; 90; -90; 90; -90; 90]); % by default min and min angular joint values on J1 to J5, to be updated
[s1,s2,s3,s4,s5,s6]=robix_connect(a);
%-80; 85; -75; 80; -80; 85; -80; 70; -80; 85
%Rehome the robot
rehome();


%Prompt for pose values
promptth = "theta?"; 
th = input(promptth); 
promptphi = "phi?"; 
phi = input(promptphi); 
promptpsi = "psi?";
psi = input(promptpsi); 
promptx = "x?"; 
xed = input(promptx);
prompty = "y?"; 
yed = input(prompty);
promptz = "z?"; 
zed = input(promptz); 


TRPY = [cosd(th)*cosd(phi) cosd(th)*sind(phi)*sind(psi)-sind(th)*cosd(psi) cosd(th)*sind(phi)*cosd(psi)+sind(th)*sind(psi) x;
        sind(th)*cosd(phi) sind(th)*sind(phi)*sind(psi)+cosd(th)*cosd(psi) sind(th)*sind(phi)*cosd(psi)-cosd(th)*sind(psi) y;
        -sind(phi) cosd(phi)*sind(psi) cosd(phi)*cosd(psi) zed;
        0 0 0 1];
disp(TRPY); 


r1c1= TRPY(1,1);
r1c2= TRPY(1,2);
r1c3= TRPY(1,3);
r2c1= TRPY(2,1);
r2c2= TRPY(2,2);
r2c3= TRPY(2,3);
r3c1= TRPY(3,1);
r3c2= TRPY(3,2);
r3c3= TRPY(3,3);


theta3= asind((zed-110*r3c3-135)/58);
theta4= asind(r3c3) - theta3;

if(theta3+theta4== -90 || theta3+theta4 == 90)
	a1= 95;				%a1
	a2= 58*cosd(theta3)+95; %a2
	c2= (x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2);
	si2 = sqrt(1-c2^2);
		
	numTheta1 = (a1+a2*c2)*y - a2*si2*x;
	demTheta1 = x^2+y^2;
		
	theta2 = atan2d(si2, c2);
	theta1 = asind(numTheta1/demTheta1);
    theta5 = -(atan2d(r1c2,r1c1)-theta1-theta2);
	%end
else
    cosExp = cosd(atan2d(r2c3,r1c3));
    numExp = 58*cosd(theta3) + 95 + 110*cosd(theta3+theta4);
    theta1= acosd((-1/95)*(cosExp*numExp - x));
	theta2= atan2d(r2c3,r1c3) - theta1;
	theta5= atan2d(-r3c2,r3c1);
end

theta1_max_positive = 85;
theta1_max_negative = -80;
theta2_max_positive = 80;
theta2_max_negative = -75;
theta3_max_positive = 85;
theta3_max_negative = -80;
theta4_max_positive = 70;
theta4_max_negative = -80;
theta5_max_positive = 85;
theta5_max_negative = -80;

   
if (theta1 > theta1_max_positive) || (theta1 < theta1_max_negative)
    fprintf("Theta 1 out of bounds [-80,85], %i\n", theta1);
end

if (theta2 > theta2_max_positive) || (theta2 < theta2_max_negative)
    fprintf("Theta 2 out of bounds [-75,80], %i\n", theta2);
end

if (theta3 > theta3_max_positive) || (theta3 < theta3_max_negative)
    fprintf("Theta 3 out of bounds [-80,85], %i\n", theta3);
end

if (theta4 > theta4_max_positive) || (theta4 < theta4_max_negative)
    fprintf("Theta 4 out of bounds [-80,70], %i\n", theta4);
end
if (theta5 > theta5_max_positive) || (theta5 < theta5_max_negative)
    fprintf("Theta 5 out of bounds [-80,85], %i\n", theta5);
end
    
    
disp('Thetas');
disp(theta1);
disp(theta2);
disp(theta3);
disp(theta4);
disp(theta5);
    




%Move Robot to prompted theta vals
move_1_by(theta1);
move_2_by(theta2);
move_3_by(theta3);
move_4_by(theta4);
move_5_by(theta5);