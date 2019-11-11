function [ m ] = inverseKinematics(x, y, z, R1C3, R2C3, R3C3, R3C1, R3C2, xe)
	disp(x);
	disp(y);
	disp(z);

	%theta 3
	c = asind(-135 / 58);

	%theta 4
	d = asind(R3C3) - c;

	%theta 5
	e = atan2d(-R3C2 / R3C1);

	%theta 1
	a = (-1 / 95) * (atan2d(R2C3 / R1C3) * ((58 * cosd(c)) + 95 + (60 * cosd(c + d)))) - xe;

	%theta 2
	b = atan2d(R2C3 / R1C3) - a;

	%Setting bounds
	a_maxP = 85;
	b_maxP = 80;
	c_maxP = 85;
	d_maxP = 70;
	e_maxP = 85;
	
	a_maxN = -80;
	b_maxN = -75;
	c_maxN = -80;
	d_maxN = -80;
	e_maxN = -80;


	%Checking bounds
	if (a > a_maxP) || (a < a_maxN)
		fprintf("Theta 1 out of bounds [-80,85], %i\n", a);
	end

	if (b > b_maxP) || (b < b_maxN)
		fprintf("Theta 2 out of bounds [-75,80], %i\n", b);
	end

	if (c > c_maxP) || (c < c_maxN)
		fprintf("Theta 3 out of bounds [-80,85], %i\n", c);
	end

	if (d > d_maxP) || (d < d_maxN)
		fprintf("Theta 4 out of bounds [-80,70], %i\n", d);
	end

	if (e > e_maxP) || (e < e_maxN)
		fprintf("Theta 5 out of bounds [-80,85], %i\n", e);
	end


	%Display theta vals
	disp(a);
	disp(b);
	disp(c);
	disp(d);
	disp(e);