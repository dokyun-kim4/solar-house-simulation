function dTdt = solarODE(t,T)  
    %Temperature
    T_out = -3;
    
    % ALL MEASURED FROM INSIDE
    %height of house
    height = 4.57;
    %width of house
    width = 5.94;
    %depth of house
    depth = 5.49;

    %Thickness of insulator
    L_ins = 0.2; 
    %Thickness of wall
    L_wall = 0.2;
    %Thickness of absorber
    L_abs = 0.4;

    %thermal conductivity of insulator
    k_ins = 0.04;
    %thermal cond of outer wall
    k_wall= 35;

    %Heat transfer coeff of window
    h_win = 1.4;
    %Heat transfer coeff of inside
    h_in = 15;
    %Heat transfer coeff of outside
    h_out = 30;

    %Area of window
    A_win = (sin(deg2rad(72)*height)*depth);
    %Area of one side wall
    A_side = (2*(L_wall + L_ins) + width) * (2*(L_wall + L_ins) + L_abs + height);
    % Area of one top/bottom
    A_top = (2*(L_wall + L_ins) + width) * (2*(L_wall + L_ins) + depth); 
    %Area of wall
    A_wall = 2*A_side + 2*A_top + ((2*(L_wall + L_ins) + depth) * (2*(L_wall + L_ins) + L_abs + height));
    %Area of insulator
    A_ins = (width * height * 2) + (sin(deg2rad(72)*height)*depth) + (width * depth);
    %Area of absorber
    A_abs = 


    %R absorber to air in
    R0= 1/(h_in*A_abs);
    %R air in to insulator
    R1= 1/(h_in*A_ins);
    %R air in to window
    R2= 1/(h_in*A_win);
    %R through window
    R3 = 1/(h_win*A_win);
    %R through insulator
    R4= L_ins/(k_ins*A_ins);
    %R through outer wall
    R5= L_wall/(k_wall*A_wall);
    %R wall to air out
    R6 = 1/(h_out*A_wall);
    %R window to air out
    R7= 1/(h_out*A_win);
    %C absorber
    C = (A_ins*L_ins)*2600*800;
    
    %Q of sun
    q_sun = -361*(cos((pi*t)/(12*3600)))+224*(cos((pi*t)/(6*3600)))+210;
    Qin = q_sun*(3.88*depth);
    
    
    %Resistance Networks
    R_win_total = (R2+R3+R7)^(-1);
    R_wall_total = (R1+R4+R5+R6)^(-1);
    R_total = R0+(R_win_total+R_wall_total)^(-1);


    dTdt = (Qin/C) - (((T_out-T)/R_total)/C);

end
