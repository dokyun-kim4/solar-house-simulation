function dTdt = solarODE(t,T)
    %height of house
    height = 4.57;
    %width of house
    width = 5.49;
    %depth of house
    depth = 5.94;

    %Thickness of insulator
    L_ins = 
    %Thickness of wall
    L_wall =
    %Thickness of absorber
    L_abs = 

    %thermal conductivity of insulator
    k_ins =
    %thermal cond of outer wall
    k_wall=

    %Heat transfer coeff of window
    h_win = 1.4;
    %Heat transfer coeff of inside
    h_in = 15;
    %Heat transfer coeff of outside
    h_out = 30;

    %Area of window
    A_win = (sin(deg2rad(72)*height)*depth);
    %Area of wall
    A_wall = 
    %Area of insulator
    A_ins = (width * height * 2) + (sin(deg2rad(72)*height)*depth) + (width * depth);
    %Area of absorber
    A_abs = 


    %R absorber to air in
    R0= 
    %R air in to insulator
    R1=
    %R air in to window
    R2= 
    %R through window
    R3 = 1/(h_win*A_win);
    %R through insulator
    R4=
    %R through outer wall
    R5=
    %R wall to air out
    R6 = 
    %R window to air out
    R7=
    %C absorber
    C= 
    
    

    dTdt = []

end
