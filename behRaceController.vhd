-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity raceController is
	port (
    i_clk : in std_logic ;
    i_reset_n : in std_logic ;
    i_start : in std_logic ;
    o_red : out std_logic ;
    o_yellow : out std_logic ;
    o_green : out std_logic
	);
end raceController;

architecture behavioral of raceController is
	type myState is (A,B,C,D,E,F,G,H);
    signal y: myState;
    begin
    	process (y)
        begin
        	if y=A or y=B then
            	o_red<='1';
                o_yellow<='0';
                o_green<='0';
            elsif y=C or y=D then
            	o_red<='0';
                o_yellow<='1';
                o_green<='0';
          	else
            	o_red<='0';
                o_yellow<='0';
                o_green<='1';
            end if;
		end process;
        
    	process (i_reset_n, i_clk)
        begin
        	if i_reset_n = '0' then
            	y<=A;
            elsif rising_edge(i_clk) then
            	   
                case y is
                	when A=>
			if i_start='0' then
				y<=A;
                        else y<=B;
                        end if;
                    when B=>
                    	y<=C;
                    when C=>
                    	y<=D;
                    when D=>
                    	y<=E;
                    when E=>
                    	y<=F;
                    when F=>
                    	y<=G;
                    when G=>
                    	y<=H;
                    when H=>
                    	y<=A;
            	end case;
        	end if;
    	end process;
        
end behavioral;
            
